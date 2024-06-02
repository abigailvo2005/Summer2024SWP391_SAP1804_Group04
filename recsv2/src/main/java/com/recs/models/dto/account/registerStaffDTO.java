package com.recs.models.dto.account;

import com.recs.models.entities.account.Account;
import lombok.Data;

import java.util.Date;

@Data
public class registerStaffDTO {
    private String fullName;
    private String gender;
    private String email;
    private String phone;
    private String address;
    private String idCard;
    private String status;
    private Date birthDate;
    private String password;

    public static Account toAccount(){
        return null;
    }

}
