package com.recs.models.dto.recsbusiness;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.entities.recsbusiness.AssignJobStaff;
import com.recs.models.enums.JobStatus;
import com.recs.utils.RealEstateUtils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ValidationJobInfo {
    private String jobId;
    private long createTimeStamp;
    private JobStatus status;
    private int priority;
    private RealEstateInfo realEstateInfo;
    private UserInfo managerInfo;
    private UserInfo staffInfo;

    public String createDate() {
        return RealEstateUtils.formatDate(createTimeStamp);
    }
}
