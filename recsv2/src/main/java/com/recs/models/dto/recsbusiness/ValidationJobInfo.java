package com.recs.models.dto.recsbusiness;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
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
    private String status;
    private int priority;
    private RealEstateInfo realEstateInfo;
    private UserInfo managerInfo;
    private UserInfo staffInfo;
}
