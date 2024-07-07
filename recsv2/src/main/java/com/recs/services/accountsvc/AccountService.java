package com.recs.services.accountsvc;

import com.recs.models.dto.account.CreateAccountRequestDTO;
import com.recs.models.dto.account.MemberDTO;
import com.recs.models.dto.account.RegisterMemberDTO;
import com.recs.models.dto.account.RegisterStaffDTO;
import com.recs.models.dto.account.UserInfo;
import com.recs.models.entities.account.Account;
import com.recs.models.entities.account.Agency;
import com.recs.models.entities.account.Manager;
import com.recs.models.entities.account.Member;
import com.recs.models.entities.account.Seller;
import com.recs.models.entities.account.Staff;

import java.util.List;

public interface AccountService {
    public List<Account> getAllAccount();

    public Account getById(String accountId);

    public Account create(Account account);

    public Account update(String accountId, Account account);

    public boolean deleteAccount(String accountId);

    public Account getByUserName(String username);

    public List<Account> getApprovingAccount();

    public List<Account> getActiveAccount();

    public List<Account> getDeclinedAccount();

    public Account approveAccount(String id);

    public Account denyAccount(String id);

    public Seller getSellerByAccountId(int id);

    public Manager getManagerByAccountId(int id);

    public Staff getStaffByAccountId(int id);

    public Agency getAgencyByAccountId(int id);

    public Member getMemberByAccountId(int id);

    public UserInfo getUserInfo(int id);

    public UserInfo getSellerToUserInfo(String sellerId);

    public UserInfo getManagerToUserInfo(String managerId);

    public List<UserInfo> getListManagerToUserInfo();

    public List<UserInfo> getListSellerToUserInfo();

    public List<UserInfo> getListAgencyToUserInfo();

    public UserInfo getAgencyToUserInfo(String agencyId);

    public UserInfo getStaffToUserInfo(String staffId);

    public UserInfo getMemberToUserInfo(String memberId);

    public List<UserInfo> getListStaffByManager(String managerId);

    public List<MemberDTO> getMembersByAgency(String agencyId);

    public void registerAccount(CreateAccountRequestDTO request);

    public void registerStaff(RegisterStaffDTO request, String managerId);

    public void registerMember(RegisterMemberDTO request, String agencyId);

    public void updatePassword(String accountId, String newPassword);

    public void updatePhone(String accountId, String phoneNum);

    public boolean checkPassword(String accountId, String password);
}
