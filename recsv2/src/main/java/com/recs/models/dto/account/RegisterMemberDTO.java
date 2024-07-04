package com.recs.models.dto.account;

import com.recs.models.entities.account.Account;
import com.recs.utils.AccountUtils;
import lombok.Data;

import java.util.Date;

@Data
public class RegisterMemberDTO {
    private String fullName;
    private String gender;
    private String email;
    private String phone;
    private String address;
    private String idCard;
    private String status;
    private String birthDate;
    private String password;

    public Account toAccount(){
        return new Account(
                0,
                "",
                this.password,
                "ROLE_MEMBER",
                fullName,
                gender.equalsIgnoreCase("Male") ? 0 : 1,
                birthDate,
                email,
                phone,
                address,
                idCard,
                "ACTIVE"
        );
    }
}
