package com.recs.services.businesssvc;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.UpdateJobStatusDTO;
import com.recs.models.dto.recsbusiness.ValidationJobInfo;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.models.entities.recsbusiness.AssignJobStaff;
import com.recs.models.enums.JobStatus;
import com.recs.models.enums.RealEstateStatus;
import com.recs.repositories.recsbusiness.JobAssignStaffRepository;
import com.recs.services.accountsvc.AccountService;
import com.recs.services.realestaesvc.RealEstateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecsBusinessServiceImpl implements RecsBusinessService{

    @Autowired
    private AccountService accountService;

    @Autowired
    private RealEstateService realEstateService;

    @Autowired
    private JobAssignStaffRepository jobAssignStaffRepository;

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


}
