package com.recs.models.dto.account;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.recs.models.entities.account.Agency;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AgencyDTO {
    private String username;
    private String fullName;
    private String company;
    private Integer yearsOfExperience;
    private Integer completedProject;
    private String description;
    private String phone;
    private String email;

    public static AgencyDTO from(Agency agency) {
        return new AgencyDTO(
                agency.getAccount().getUsername(),
                agency.getAccount().getFullName(),
                agency.getCompany(),
                agency.getYearsOfExperience(),
                agency.getCompletedProject(),
                agency.getDescription(),
                agency.getAccount().getPhone(),
                agency.getAccount().getEmail()
        );
    }
}
