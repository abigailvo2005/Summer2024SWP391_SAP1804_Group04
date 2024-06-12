package com.recs.models.dto.recsbusiness;

import lombok.Data;

@Data
public class UpdateJobStatusDTO {
    private String jobId;
    private String validateStatus;
    private String notes;
}
