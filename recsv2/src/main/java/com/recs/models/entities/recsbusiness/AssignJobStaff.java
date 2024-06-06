package com.recs.models.entities.recsbusiness;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "JobAssignStaff")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AssignJobStaff {

    @Id
    private String jobId;

    private String realEstateId;

    private long createTimestamp;

    private int priority;

    private String status;

    private String staffId;

    private String managerId;

}
