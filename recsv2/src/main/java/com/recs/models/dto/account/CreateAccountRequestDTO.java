package com.recs.models.dto.account;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateAccountRequestDTO {
    private String fullName;

    private String password;

    private String role;

    private String gender;

    private String birthDate;

    private String email;

    private String phone;

    private String address;

    private String idCard;

    private String company;

    private String description;
    
    private int yearsOfExperience = 0;

    private int completedProject = 0;

    private int yearsOfExperienceMan = 0;
}
