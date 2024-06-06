package com.recs.services.businesssvc;


import com.recs.models.dto.recsbusiness.ValidationJobInfo;
import com.recs.models.entities.recsbusiness.AssignJobStaff;

import java.util.List;

public interface RecsBusinessService {
    public AssignJobStaff createAssignJobStaff(AssignJobStaff assignJobStaff);

    public ValidationJobInfo getValidationJobInfo(String jobId);

    public List<ValidationJobInfo> getListByStaff(String staffId);

    public List<ValidationJobInfo> getListByManager(String managerId);

    public List<ValidationJobInfo> getListByManagerAndStatus(String managerId, String status);

    public List<ValidationJobInfo> getListByStaffAndStatus(String staffId, String status);

    public AssignJobStaff updateStatus(String jobId, String status);

}
