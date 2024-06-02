package com.recs.models.dto.account;

import com.recs.models.entities.account.Account;
import com.recs.models.entities.account.Seller;
import lombok.Data;

import java.util.Date;


/**
 * only supported api get details info, null fields will be hidden
 */
@Data
public class UserInfo {

    private int accountId;
    private String username;
    private String roleId;
    private String fullName;
    private String gender;
    private String email;
    private String phone;
    private String address;
    private String idCard;
    private String status;
    private Date birthDate;

    // Fields from Seller
    private String sellerId;
    private String company;

    // Fields from Manager
    private String managerId;
    private Integer yearsOfExperience;

    // Fields from Staff
    private String staffId;
    private String superiorId; // with staff is managerId, with member is agencyId

    // Fields from Agency
    private String agencyId;
    private Integer completedProject;
    private String agencyDescription;

    // Fields from Members
    private String memberId;
    private String companyId;

    public static UserInfo fromSeller(Account account, Seller seller) {
        UserInfo userInfo = new UserInfo();
        if (account != null) {
            userInfo.setAccountId(account.getAccountId());
            userInfo.setUsername(account.getUsername());
            userInfo.setRoleId(account.getRoleId());
            userInfo.setFullName(account.getFullName());
            userInfo.setGender(account.getGender() == 0 ? "Male" : "Female");
            userInfo.setEmail(account.getEmail());
            userInfo.setPhone(account.getPhone());
            userInfo.setAddress(account.getAddress());
            userInfo.setIdCard(account.getIdCard());
            userInfo.setStatus(account.getStatus());
            userInfo.setBirthDate(account.getBirthDate());
        }
        if (seller != null) {
            userInfo.setSellerId(seller.getSellerId());
            userInfo.setCompany(seller.getCompany());
        }
        return userInfo;
    }
}
