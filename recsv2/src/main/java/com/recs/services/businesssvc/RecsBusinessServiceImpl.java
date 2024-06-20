package com.recs.services.businesssvc;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.UpdateJobStatusDTO;
import com.recs.models.dto.recsbusiness.ValidationJobInfo;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.models.entities.recsbusiness.AgencyRequest;
import com.recs.models.entities.recsbusiness.AssignJobStaff;
import com.recs.models.entities.recsbusiness.DealAssignMember;
import com.recs.models.enums.AgencyRequestStatus;
import com.recs.models.enums.JobStatus;
import com.recs.models.enums.RealEstateStatus;
import com.recs.repositories.account.AgencyRepository;
import com.recs.repositories.recsbusiness.AgencyRequestRepository;
import com.recs.repositories.recsbusiness.DealAssignMemberRepository;
import com.recs.repositories.recsbusiness.JobAssignStaffRepository;
import com.recs.services.accountsvc.AccountService;
import com.recs.services.realestaesvc.RealEstateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

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
    public List<DealAssignMember> getDealByMemberIdAndStatus(String memberId, String status) {
        return dealAssignMemberRepository.getByMemberMemberIdAndStatus(memberId, status);
    }

    @Override
    public void createAgencyRequest(String realEstateId, String agencyId) {
        AgencyRequest agencyRequest = new AgencyRequest(
                UUID.randomUUID().toString(),
                System.currentTimeMillis(),
                AgencyRequestStatus.REVIEWING.getValue(),
                agencyRepository.getReferenceById(agencyId),
                realEstateService.getById(realEstateId)
        );
        realEstateService.updateStatus(realEstateId, RealEstateStatus.AGENCY_APPROVING, "");
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

}
