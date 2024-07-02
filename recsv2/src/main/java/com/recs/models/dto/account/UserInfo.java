package com.recs.models.dto.account;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.recs.models.entities.account.Account;
import com.recs.models.entities.account.Agency;
import com.recs.models.entities.account.Manager;
import com.recs.models.entities.account.Member;
import com.recs.models.entities.account.Seller;
import com.recs.models.entities.account.Staff;
import lombok.Data;

import java.util.Date;


/**
 * only supported api get details info, null fields will be hidden
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
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
    private String birthDate;

    // Fields from Seller
    private String sellerId;
    private String company;

    // Fields from Manager
    private String managerId;
    private Integer yearsOfExperience;

    // Fields from Staff
    private String staffId;
    private String superiorId; // with staff is managerId, with member is agencyId
    private Integer numOfProjects;

    // Fields from Agency
    private String agencyId;
    private Integer completedProject;
    private String agencyDescription;
    private Integer agencyYearsOfExperience;

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

    public static UserInfo fromManager(Account account, Manager manager) {
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
        if (manager != null) {
            userInfo.setManagerId(manager.getManagerId());
            userInfo.setYearsOfExperience(manager.getYearsOfExperience());
        }
        return userInfo;
    }

    public static UserInfo fromStaff(Account account, Staff staff) {
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
        if (staff != null) {
            userInfo.setStaffId(staff.getStaffId());
            userInfo.setSuperiorId(staff.getManagerId());
            userInfo.setNumOfProjects(staff.getNumOfProjects());
        }
        return userInfo;
    }

    public static UserInfo fromAgency(Account account, Agency agency) {
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
        if (agency != null) {
            userInfo.setAgencyId(agency.getAgencyId());
            userInfo.setCompany(agency.getCompany());
            userInfo.setCompletedProject(agency.getCompletedProject());
            userInfo.setAgencyYearsOfExperience(agency.getYearsOfExperience());
            userInfo.setAgencyDescription(agency.getDescription());
        }
        return userInfo;
    }

    public static UserInfo fromMember(Account account, Member member) {
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
        if (member != null) {
            userInfo.setMemberId(member.getMemberId());
//            userInfo.setCompanyId(member.getCompany());
            userInfo.setSuperiorId(member.getAgency().getAgencyId());
        }
        return userInfo;
    }

    public static UserInfo fromAccount(Account account) {
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
        return userInfo;
    }
}
