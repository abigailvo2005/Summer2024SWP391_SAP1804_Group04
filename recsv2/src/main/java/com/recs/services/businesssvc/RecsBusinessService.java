package com.recs.services.businesssvc;


import com.recs.models.dto.recsbusiness.AgencyRequestCreateDTO;
import com.recs.models.dto.recsbusiness.AgencyRequestDTO;
import com.recs.models.dto.recsbusiness.ApproveAgencyRequestDTO;
import com.recs.models.dto.recsbusiness.AssignDealRequest;
import com.recs.models.dto.recsbusiness.BuyerRequestCreateDTO;
import com.recs.models.dto.recsbusiness.BuyerRequestDTO;
import com.recs.models.dto.recsbusiness.DealAssignMemberDTO;
import com.recs.models.dto.recsbusiness.UpdateJobStatusDTO;
import com.recs.models.dto.recsbusiness.ValidationJobInfo;
import com.recs.models.entities.recsbusiness.AgencyRequest;
import com.recs.models.entities.recsbusiness.AssignJobStaff;
import com.recs.models.entities.recsbusiness.DealAssignMember;
import com.recs.models.enums.AgencyRequestStatus;
import com.recs.models.enums.BuyerRequestStatus;

import java.util.List;

public interface RecsBusinessService {
    public AssignJobStaff createAssignJobStaff(AssignJobStaff assignJobStaff);

    public ValidationJobInfo getValidationJobInfo(String jobId);

    public List<ValidationJobInfo> getListByStaff(String staffId);

    public List<ValidationJobInfo> getListByManager(String managerId);

    public List<ValidationJobInfo> getListByManagerAndStatus(String managerId, String status);

    public List<ValidationJobInfo> getListByStaffAndStatus(String staffId, String status);

    public AssignJobStaff updateStatus(UpdateJobStatusDTO request);

    public List<AgencyRequest> getListRequestByAgencyAndStatus(String agencyId, String status);

    public List<AgencyRequest> getAllRequestByAgency(String agencyId);

    public List<DealAssignMember> getAllDealByMemberId(String memberId);

    public List<DealAssignMember> getDashboarDealByMemberId(String memId);

    public List<DealAssignMemberDTO> getAssignDealPageByMemberId(String memberId);

    public List<DealAssignMemberDTO> getPageHistoryAssignDealPageByMemberId(String memberId);

    public List<DealAssignMember> getDealByMemberIdAndStatus(String memberId, String status);

    public List<DealAssignMember> getDealByAgencyIdAndStatus(String agencyId, String status);

    public List<DealAssignMemberDTO> getDealPageByAgencyIdAndStatus(String agencyId, String status);

    public void createAgencyRequest(AgencyRequestCreateDTO request, int accountId);

    public List<AgencyRequest> getAgencyRequestsByAgencyId(String agencyId);

    public void updateAgencyRequestStatus(String agencyRequestId, AgencyRequestStatus status);

    public void approveAgencyRequest(ApproveAgencyRequestDTO request);

    public DealAssignMemberDTO getDealInfo(String id);

    public AgencyRequestDTO getAgencyRequest(String id);

    public List<AgencyRequestDTO> getDashBoardAgencyRequest(String agencyId);

    public List<AgencyRequestDTO> getPageHistoryAgencyRequest(String agecyId);

    public List<DealAssignMemberDTO> getAgencyDashboardDeal(String agencyId);

    public void createDeal(AssignDealRequest request, String agencyId);

    public void createBuyerRequest(BuyerRequestCreateDTO request);

    public List<BuyerRequestDTO> getBuyerRequestByMember(String memberId);

    public List<BuyerRequestDTO> getDaboardBuyerRequestByMember(String memberId);

    public List<BuyerRequestDTO> getPageBuyerRequestByMemberId(String memberId);

    public void updateBuyer(List<String> buyerRequests, BuyerRequestStatus status);

    public BuyerRequestDTO getBuyerRequest(String id);

    public void cancelDeal(String dealId);

    public void dropAgencyRequest(String requestId);
}
