package com.recs.services.businesssvc;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateDTO;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.AgencyRequestCreateDTO;
import com.recs.models.dto.recsbusiness.AgencyRequestDTO;
import com.recs.models.dto.recsbusiness.ApproveAgencyRequestDTO;
import com.recs.models.dto.recsbusiness.AssignDealRequest;
import com.recs.models.dto.recsbusiness.BuyerRequestCreateDTO;
import com.recs.models.dto.recsbusiness.BuyerRequestDTO;
import com.recs.models.dto.recsbusiness.DealAssignMemberDTO;
import com.recs.models.dto.recsbusiness.UpdateJobStatusDTO;
import com.recs.models.dto.recsbusiness.ValidationJobInfo;
import com.recs.models.entities.account.Agency;
import com.recs.models.entities.realestate.PropertyHouse;
import com.recs.models.entities.realestate.PropertyLand;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.models.entities.recsbusiness.AgencyRequest;
import com.recs.models.entities.recsbusiness.AssignJobStaff;
import com.recs.models.entities.recsbusiness.BuyerRequest;
import com.recs.models.entities.recsbusiness.DealAssignMember;
import com.recs.models.enums.AgencyRequestStatus;
import com.recs.models.enums.BuyerRequestStatus;
import com.recs.models.enums.DealAssignMemberStatus;
import com.recs.models.enums.JobStatus;
import com.recs.models.enums.RealEstateStatus;
import com.recs.repositories.account.AgencyRepository;
import com.recs.repositories.account.MemberRepository;
import com.recs.repositories.realestate.PaperWorksRepository;
import com.recs.repositories.realestate.PropertyHouseRepository;
import com.recs.repositories.realestate.PropertyLandRepository;
import com.recs.repositories.recsbusiness.AgencyRequestRepository;
import com.recs.repositories.recsbusiness.BuyerRequestRepository;
import com.recs.repositories.recsbusiness.DealAssignMemberRepository;
import com.recs.repositories.recsbusiness.JobAssignStaffRepository;
import com.recs.services.accountsvc.AccountService;
import com.recs.services.realestaesvc.RealEstateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.WebProperties.Resources.Chain.Strategy;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

@Service
public class RecsBusinessServiceImpl implements RecsBusinessService{

    @Autowired
    private AccountService accountService;

    @Autowired
    private RealEstateService realEstateService;

    @Autowired
    private JobAssignStaffRepository jobAssignStaffRepository;

    @Autowired
    private AgencyRequestRepository agencyRequestRepository;

    @Autowired
    private DealAssignMemberRepository dealAssignMemberRepository;

    @Autowired
    private AgencyRepository agencyRepository;

    @Autowired
    private PaperWorksRepository paperWorksRepository;

    @Autowired
    private PropertyLandRepository propertyLandRepository;

    @Autowired
    private PropertyHouseRepository propertyHouseRepository;

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private BuyerRequestRepository buyerRequestRepository;

    @Override
    public AssignJobStaff createAssignJobStaff(AssignJobStaff assignJobStaff) {
        realEstateService.updateStatus(assignJobStaff.getRealEstateId(), RealEstateStatus.VALIDATING, "Property is validating");
        return jobAssignStaffRepository.save(assignJobStaff);
    }

    @Override
    public ValidationJobInfo getValidationJobInfo(String jobId) {
        AssignJobStaff entity = jobAssignStaffRepository.getReferenceById(jobId);
        return convertToValidationInfo(entity);
    }

    private ValidationJobInfo convertToValidationInfo(AssignJobStaff entity) {
        UserInfo staffInfo = accountService.getStaffToUserInfo(entity.getStaffId());
        RealEstateInfo realEstateInfo = realEstateService.getRealEstateInfo(entity.getRealEstateId());
        return new ValidationJobInfo(
                entity.getJobId(),
                entity.getCreateTimestamp(),
                JobStatus.from(entity.getStatus()),
                entity.getPriority(),
                realEstateInfo,
                realEstateInfo.getManagerInfo(),
                staffInfo
        );
    }

    @Override
    public List<ValidationJobInfo> getListByStaff(String staffId) {
        List<AssignJobStaff> list = jobAssignStaffRepository.findAllByStaffId(staffId);
        List<ValidationJobInfo> infoList = list.stream().map(
                this::convertToValidationInfo
        ).toList();
        System.out.println("list validation job by staff "+ staffId +" size"+ list.size());
        return infoList;
    }

    @Override
    public List<ValidationJobInfo> getListByManager(String managerId) {
        List<AssignJobStaff> list = jobAssignStaffRepository.findAllByManagerId(managerId);
        List<ValidationJobInfo> infoList = list.stream().map(
                this::convertToValidationInfo
        ).toList();
        System.out.println("list validation job by manager "+ managerId +" size"+ list.size());
        return infoList;
    }

    @Override
    public List<ValidationJobInfo> getListByManagerAndStatus(String managerId, String status) {
        List<AssignJobStaff> list = jobAssignStaffRepository.findAllByManagerIdAndStatus(managerId, status);
        List<ValidationJobInfo> infoList = list.stream().map(
                this::convertToValidationInfo
        ).toList();
        System.out.println("list " + status + " job by manager "+ managerId +" size"+ list.size());
        return infoList;
    }

    @Override
    public List<ValidationJobInfo> getListByStaffAndStatus(String staffId, String status) {
        List<AssignJobStaff> list = jobAssignStaffRepository.findAllByStaffIdAndStatus(staffId, status);
        List<ValidationJobInfo> infoList = list.stream().map(
                this::convertToValidationInfo
        ).toList();
        System.out.println("list "+ status +" job by staff "+ staffId +" size"+ list.size());
        return infoList;
    }

    @Override
    public AssignJobStaff updateStatus(UpdateJobStatusDTO request) {
        AssignJobStaff job = jobAssignStaffRepository.getReferenceById(request.getJobId());
        if (job != null) {
            job.setStatus(request.getValidateStatus());
            realEstateService.updateStatus(
                    job.getRealEstateId(),
                    RealEstateStatus.fromJobStatus(JobStatus.from(request.getValidateStatus())),
                    request.getNotes()
            );
            jobAssignStaffRepository.save(job);
        }
        return job;
    }

    @Override
    public List<AgencyRequest> getListRequestByAgencyAndStatus(String agencyId, String status) {
        return agencyRequestRepository.getAllByAgencyAgencyIdAndStatus(agencyId, status);
    }

    @Override
    public List<AgencyRequest> getAllRequestByAgency(String agencyId) {
        return agencyRequestRepository.getAllByAgencyAgencyId(agencyId);
    }

    @Override
    public List<DealAssignMember> getAllDealByMemberId(String memberId) {
        return dealAssignMemberRepository.getByMemberMemberId(memberId);
    }

    @Override
    public List<DealAssignMember> getDashboarDealByMemberId(String memberId) {
        List<String> dashboardStatus = Stream.of(DealAssignMemberStatus.ASSIGNED, DealAssignMemberStatus.REVIEWING)
            .map(DealAssignMemberStatus::getValue)
            .toList();
        return dealAssignMemberRepository.getByMemberMemberIdAndStatusIn(memberId, dashboardStatus);
    }

    @Override
    public List<DealAssignMember> getDealByMemberIdAndStatus(String memberId, String status) {
        return dealAssignMemberRepository.getByMemberMemberIdAndStatus(memberId, status);
    }

    @Override
    public List<DealAssignMember> getDealByAgencyIdAndStatus(String agencyId, String status) {
        return dealAssignMemberRepository.getByAgencyAgencyIdAndStatus(agencyId, status);
    }

    @Override
    public void createAgencyRequest(AgencyRequestCreateDTO request, int accountId) {
        Agency agency = agencyRepository.findByAccountAccountId(accountId);
        AgencyRequest agencyRequest = new AgencyRequest(
                UUID.randomUUID().toString(),
                System.currentTimeMillis(),
                AgencyRequestStatus.REVIEWING.getValue(),
                request.getAgencyMessage(),
                agency,
                realEstateService.getById(request.getRealEstateId())
        );
        realEstateService.updateStatus(request.getRealEstateId(), RealEstateStatus.AGENCY_APPROVING, "");
        agencyRequestRepository.save(agencyRequest);
    }

    @Override
    public List<AgencyRequest> getAgencyRequestsByAgencyId(String agencyId) {
        return agencyRequestRepository.getAllByAgencyAgencyId(agencyId);
    }

    @Override
    public void updateAgencyRequestStatus(String agencyRequestId, AgencyRequestStatus status) {
        AgencyRequest agencyRequest = agencyRequestRepository.getReferenceById(agencyRequestId);
        if(agencyRequest != null) {
            agencyRequest.setStatus(status.getValue());
            realEstateService.updateStatus(
                    agencyRequest.getRealEstate().getRealEstateId(),
                    status.toRealEstateStatus(),
                    ""
                    );
            agencyRequestRepository.save(agencyRequest);
        }
    }

    @Override
    public void approveAgencyRequest(ApproveAgencyRequestDTO request) {
        RealEstate realEstate = realEstateService.getById(request.getRealEstateId());
        realEstate.getAgencyRequests().forEach(agencyRequest -> {
            if(request.getAgencyRequestIds().contains(agencyRequest.getRequestId())) {
                agencyRequest.setStatus(AgencyRequestStatus.ACCEPTED.getValue());
            }
        });
        realEstate.setStatus(RealEstateStatus.HANDLED.getValue());
        realEstateService.update(realEstate);
    }

    @Override
    public DealAssignMemberDTO getDealInfo(String id) {
        DealAssignMember deal = dealAssignMemberRepository.getReferenceById(id);
        RealEstateInfo realEstateInfo = realEstateService.getRealEstateInfo(deal.getRealEstate().getRealEstateId());
        DealAssignMemberDTO dto = DealAssignMemberDTO.from(deal);
        dto.setRealEstate(realEstateInfo);
        return dto;
    }

    @Override
    public AgencyRequestDTO getAgencyRequest(String id) {
        AgencyRequest agencyRequest = agencyRequestRepository.getReferenceById(id);
        AgencyRequestDTO dto = AgencyRequestDTO.from(agencyRequest);
        if(dto.getRealEstate().getRealEstateType().equals("Land")) {
            PropertyLand land = propertyLandRepository.getByRealEstateId(dto.getRealEstateId());
            dto.setRealEstate(RealEstateDTO.fromLand(agencyRequest.getRealEstate(),land));
        } else {
            PropertyHouse house = propertyHouseRepository.getByRealEstateId(dto.getRealEstateId());
            dto.setRealEstate(RealEstateDTO.fromHouse(agencyRequest.getRealEstate(),house));
        }
        dto.getRealEstate().setPaperWorks(paperWorksRepository.getReferenceById(dto.getRealEstateId()).getUrl());
        return dto;
    }

    @Override
    public List<AgencyRequestDTO> getDashBoardAgencyRequest(String agencyId) {
        List<String> dashboardStatus = Stream.of(AgencyRequestStatus.ACCEPTED,AgencyRequestStatus.REVIEWING)
                .map(AgencyRequestStatus::getValue)
                .toList();
        return agencyRequestRepository.getAllByAgencyAgencyIdAndStatusIn(agencyId, dashboardStatus)
                .stream()
                .map(AgencyRequestDTO::from)
                .sorted(Comparator.comparing(AgencyRequestDTO::getStatus))
                .toList();
    }

    @Override
    public List<AgencyRequestDTO> getPageHistoryAgencyRequest(String agencyId) {
        List<String> dashboardStatus = Stream.of(AgencyRequestStatus.DENIED, AgencyRequestStatus.DROPPED, AgencyRequestStatus.DENIED, AgencyRequestStatus.CLOSED)
                .map(AgencyRequestStatus::getValue)
                .toList();
        return agencyRequestRepository.getAllByAgencyAgencyIdAndStatusIn(agencyId, dashboardStatus)
                .stream()
                .map(AgencyRequestDTO::from)
                .sorted(Comparator.comparing(AgencyRequestDTO::getStatus))
                .toList();
    }

    @Override
    public List<DealAssignMemberDTO> getAgencyDashboardDeal(String agencyId) {
        List<String> dashboardStatus = Stream.of(DealAssignMemberStatus.ASSIGNED, DealAssignMemberStatus.REVIEWING)
            .map(DealAssignMemberStatus::getValue)
            .toList();
        return dealAssignMemberRepository.getByAgencyAgencyIdAndStatusIn(agencyId, dashboardStatus)
                .stream()
                .map(DealAssignMemberDTO::from)
                .sorted(Comparator.comparing(DealAssignMemberDTO::getCreateTimestamp).reversed())
                .toList();
    }
    

    @Override
    public List<DealAssignMemberDTO> getDealPageByAgencyIdAndStatus(String agencyId, String status) {
        return dealAssignMemberRepository.getByAgencyAgencyIdAndStatus(agencyId, status)
                .stream()
                .map(DealAssignMemberDTO::from)
                .sorted(Comparator.comparing(DealAssignMemberDTO::getCreateTimestamp).reversed())
                .toList();
    }

    @Override
    public List<DealAssignMemberDTO> getPageHistoryAssignDealPageByMemberId(String memberId) {
        List<String> dashboardStatus = Stream.of(DealAssignMemberStatus.CANCELLED, DealAssignMemberStatus.CLOSED)
                    .map(DealAssignMemberStatus::getValue)
                    .toList();
        return dealAssignMemberRepository.getByMemberMemberIdAndStatusIn(memberId, dashboardStatus)
                .stream().map(DealAssignMemberDTO::from)
                .sorted(Comparator.comparing(DealAssignMemberDTO::getCreateTimestamp).reversed())
                .toList();
    }

    @Override
    public List<DealAssignMemberDTO> getAssignDealPageByMemberId(String memberId) {
        List<String> createStatus = Stream.of(DealAssignMemberStatus.ASSIGNED, DealAssignMemberStatus.REVIEWING)
                .map(DealAssignMemberStatus::getValue)
                .toList();
        return dealAssignMemberRepository.getByMemberMemberIdAndStatusIn(memberId, createStatus)
                .stream()
                .map(DealAssignMemberDTO::from)
                .sorted(Comparator.comparing(DealAssignMemberDTO::getCreateTimestamp).reversed())
                .toList();
    }

    @Override
    public void createDeal(AssignDealRequest request, String agencyId) {

        RealEstate realEstate = realEstateService.getById(request.getRealEstateId());
        realEstate.setStatus(RealEstateStatus.MARKETED.getValue());
        realEstateService.update(realEstate);

        AgencyRequest agencyRequest = agencyRequestRepository.getReferenceById(request.getRequestId());

        agencyRequest.setStatus(AgencyRequestStatus.PROCESSING.getValue());
        agencyRequestRepository.save(agencyRequest);

        DealAssignMember dealAssignMember = new DealAssignMember(
                UUID.randomUUID().toString(),
                System.currentTimeMillis(),
                1,
                DealAssignMemberStatus.ASSIGNED.getValue(),
                agencyRepository.getReferenceById(agencyId),
                memberRepository.getReferenceById(request.getMemberId()),
                realEstate
        );
        dealAssignMemberRepository.save(dealAssignMember);
    }

    @Override
    public void createBuyerRequest(BuyerRequestCreateDTO request) {
        DealAssignMember deal = dealAssignMemberRepository.getReferenceById(request.getDealId());
        RealEstate realEstate = deal.getRealEstate();
        deal.setStatus(DealAssignMemberStatus.REVIEWING.getValue());
        realEstate.setStatus(RealEstateStatus.BUYER_APPROVING.getValue());
        BuyerRequest buyerRequest = new BuyerRequest(
                UUID.randomUUID().toString(),
                request.getFullName(),
                request.getPhoneNumber(),
                request.getMessage(),
                System.currentTimeMillis(),
                BuyerRequestStatus.REVIEWING.getValue(),
                deal.getMember(),
                realEstate,
                deal
        );
        buyerRequestRepository.save(buyerRequest);
    }

    @Override
    public List<BuyerRequestDTO> getBuyerRequestByMember(String memberId) {
        List<BuyerRequest> buyerRequests = buyerRequestRepository.findAllByMemberMemberId(memberId);
        return buyerRequests.stream().map(BuyerRequestDTO::from).toList();
    }

    @Override
    public List<BuyerRequestDTO> getDaboardBuyerRequestByMember(String memberId) {
        List<String> status = Stream.of(BuyerRequestStatus.ACCEPTED, BuyerRequestStatus.REVIEWING)
            .map(BuyerRequestStatus::getValue)
            .toList();

        return buyerRequestRepository.findAllByMemberMemberIdAndStatusIn(memberId, status)
                .stream().map(BuyerRequestDTO::from).toList();
    }

    @Override
    public List<BuyerRequestDTO> getPageBuyerRequestByMemberId(String memberId) {
        List<String> status = Stream.of(BuyerRequestStatus.CONNECTED, BuyerRequestStatus.DENIED)
            .map(BuyerRequestStatus::getValue)
            .toList();
        List<BuyerRequest> buyerRequests = buyerRequestRepository.findAllByMemberMemberIdAndStatusIn(memberId, status);
        return buyerRequests.stream().map(BuyerRequestDTO::from)
                .sorted(Comparator.comparing(BuyerRequestDTO::getStatus))
                .toList();
    }

    @Override
    public void updateBuyer(List<String> buyerRequests, BuyerRequestStatus status) {
        List<BuyerRequest> updateList = buyerRequestRepository.findAllByRequestIdIn(buyerRequests);
        updateList.forEach(row -> {
            row.setStatus(status.getValue());
            switch (status) {
                case ACCEPTED -> {
                    row.getRealEstate().setStatus(RealEstateStatus.CONNECTED.getValue());
                }
                case CONNECTED -> {
                    row.getRealEstate().setStatus(RealEstateStatus.CLOSED.getValue());

                    //deny all buyer request
                    List<BuyerRequest> othersRequest = buyerRequestRepository.findAllByRealEstateRealEstateId(row.getRealEstate().getRealEstateId())
                            .stream().filter(buyerRequest -> !buyerRequest.getRequestId().equals(row.getRequestId()))
                            .toList();
                    othersRequest.forEach(buyerRequest -> {
                        buyerRequest.setStatus(BuyerRequestStatus.DENIED.getValue());
                        buyerRequest.getDeal().setStatus(DealAssignMemberStatus.CLOSED.getValue());
                    });

                    //close all deal
                    List<DealAssignMember> allDeal = dealAssignMemberRepository.getByRealEstateRealEstateId(row.getRealEstate().getRealEstateId());
                    allDeal.forEach(deal -> deal.setStatus(DealAssignMemberStatus.CLOSED.getValue()));

                    //deny all agency request
                    List<AgencyRequest> allAgencyRequests = agencyRequestRepository.getAllByRealEstateRealEstateId(row.getRealEstate().getRealEstateId());
                    allAgencyRequests.forEach( agencyRequest -> {
                        if(agencyRequest.getAgency().getAgencyId().equals(row.getDeal().getAgency().getAgencyId()))
                            agencyRequest.setStatus(AgencyRequestStatus.CLOSED.getValue());
                        else agencyRequest.setStatus(AgencyRequestStatus.DENIED.getValue());
                            }
                    );

                    //save action
                    agencyRequestRepository.saveAll(allAgencyRequests);
                    dealAssignMemberRepository.saveAll(allDeal);
                    buyerRequestRepository.saveAll(othersRequest);
                }
            }
        });
        buyerRequestRepository.saveAll(updateList);
    }

    @Override
    public BuyerRequestDTO getBuyerRequest(String id) {
        BuyerRequest buyerRequest = buyerRequestRepository.getReferenceById(id);
        return BuyerRequestDTO.from(buyerRequest);
    }

    @Override
    public void cancelJob(String jobId) {
        AssignJobStaff job = jobAssignStaffRepository.getReferenceById(jobId);
        job.setStatus(JobStatus.CANCELLED.getValue());
        realEstateService.updateStatusNoNote(job.getRealEstateId(), RealEstateStatus.REVIEWING);
        jobAssignStaffRepository.save(job);
    }

    @Override
    public void cancelDeal(String dealId) {
        DealAssignMember deal = dealAssignMemberRepository.getReferenceById(dealId);
        deal.setStatus(DealAssignMemberStatus.CANCELLED.getValue());
        realEstateService.updateStatusNoNote(deal.getRealEstate().getRealEstateId(), RealEstateStatus.HANDLED);
        AgencyRequest agencyRequest = agencyRequestRepository.getByAgencyAgencyIdAndRealEstateRealEstateId(
                deal.getAgency().getAgencyId(),
                deal.getRealEstate().getRealEstateId()
        );
        agencyRequest.setStatus(AgencyRequestStatus.ACCEPTED.getValue());
        dealAssignMemberRepository.save(deal);
        agencyRequestRepository.save(agencyRequest);
    }

    @Override
    public void dropAgencyRequest(String requestId) {
        AgencyRequest agencyRequest = agencyRequestRepository.getReferenceById(requestId);
        RealEstate realEstate = agencyRequest.getRealEstate();
        List<AgencyRequest> handledList = realEstate.getAgencyRequests().stream()
                .filter(request -> request.getStatus().equals(AgencyRequestStatus.ACCEPTED.getValue()))
                .toList();
        if(handledList.size() == 1 && agencyRequest.getRequestId().equals(handledList.get(0).getRequestId()))
            realEstate.setStatus(RealEstateStatus.DISPLAYED.getValue());
        agencyRequest.setStatus(AgencyRequestStatus.DROPPED.getValue());
        agencyRequestRepository.save(agencyRequest);
    }

}
