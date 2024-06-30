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
import com.recs.repositories.account.*;
import com.recs.utils.AccountUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Service
public class AccountServiceImpl implements AccountService {

    private AccountRepository accountRepository;

    private SellerRepository sellerRepository;

    private ManagerRepository managerRepository;

    private StaffRepository staffRepository;

    private AgencyRepository agencyRepository;

    private MemberRepository memberRepository;

    private PasswordEncoder encoder;

    @Autowired
    public AccountServiceImpl(
            AccountRepository accountRepository,
            SellerRepository sellerRepository,
            ManagerRepository managerRepository,
            StaffRepository staffRepository,
            AgencyRepository agencyRepository,
            MemberRepository memberRepository,
            PasswordEncoder passwordEncoder) {
        this.accountRepository = accountRepository;
        this.sellerRepository = sellerRepository;
        this.managerRepository = managerRepository;
        this.staffRepository = staffRepository;
        this.agencyRepository = agencyRepository;
        this.memberRepository = memberRepository;
        this.encoder = passwordEncoder;
    }

    @Override
    public List<Account> getAllAccount() {
        List<Account> list = accountRepository.findAll().stream()
                .sorted(Comparator.comparing(Account::getStatus)).toList();
        System.out.println("List all accounts size :" + list.size());
        return list;
    }

    @Override
    public Account getById(String accountId) {
        return accountRepository.getReferenceById(accountId);
    }

    @Override
    public Account create(Account account) {
        account.setAccountPassword(encoder.encode(account.getAccountPassword()));
        return accountRepository.save(account);
    }

    @Override
    public Account update(String accountId, Account account) {
        Account a = accountRepository.getReferenceById(accountId);
        if (a != null) {
            a.setEmail(account.getEmail());
            a.setPhone(account.getPhone());
            accountRepository.save(a);
        }
        return a;
    }

    @Override
    public boolean deleteAccount(String accountId) {
        accountRepository.deleteById(accountId);
        return true;
    }

    @Override
    public Account getByUserName(String username) {
        return accountRepository.getByUsername(username);
    }

    @Override
    public List<Account> getActiveAccount() {
        List<Account> list = accountRepository.findByStatus("ACTIVE")
                .stream().sorted(
                        Comparator.comparing(Account::getAccountId)
                                .thenComparing(Account::getAccountId))
                .toList();
        System.out.println("ACTIVE LIST " + list.size());
        return list;
    }

    @Override
    public List<Account> getDeclinedAccount() {
        List<Account> list = accountRepository.findByStatus("DENIED")
                .stream().sorted(
                        Comparator.comparing(Account::getAccountId)
                                .thenComparing(Account::getAccountId))
                .toList();
        System.out.println("ACTIVE LIST " + list.size());
        return list;
    }

    @Override
    public List<Account> getApprovingAccount() {
        List<Account> list = accountRepository.findByStatus("APPROVING")
                .stream().sorted(
                        Comparator.comparing(Account::getAccountId)
                                .thenComparing(Account::getAccountId))
                .toList();
        System.out.println("list registering account size: " + list.size());
        return list;
    }

    @Override
    public Account approveAccount(String id) {
        Account a = accountRepository.getReferenceById(id);
        if (a != null) {
            a.setStatus("ACTIVE");
            accountRepository.save(a);
        }
        return a;
    }

    @Override
    public Account denyAccount(String id) {
        Account a = accountRepository.getReferenceById(id);
        if (a != null) {
            a.setStatus("DENIED");
            accountRepository.save(a);
        }
        return a;
    }

    @Override
    public Seller getSellerByAccountId(int id) {
        return sellerRepository.findByAccountId(id);
    }

    @Override
    public Manager getManagerByAccountId(int id) {
        return managerRepository.findByAccountId(id);
    }

    @Override
    public Staff getStaffByAccountId(int id) {
        return staffRepository.findByAccountId(id);
    }

    @Override
    public Agency getAgencyByAccountId(int id) {
        return agencyRepository.findByAccountAccountId(id);
    }

    @Override
    public Member getMemberByAccountId(int id) {
        return memberRepository.findByAccountAccountId(id);
    }

    @Override
    public UserInfo getUserInfo(int id) {
        Account account = accountRepository.findById(String.valueOf(id)).orElse(null);
        if (account == null) {
            throw new RuntimeException("Account not found");
        }

        return switch (account.getRoleId()) {
            case "ROLE_SELLER" -> {
                Seller seller = sellerRepository.findByAccountId(id);
                yield UserInfo.fromSeller(account, seller);
            }
            case "ROLE_MANAGER" -> {
                Manager manager = managerRepository.findByAccountId(id);
                yield UserInfo.fromManager(account, manager);
            }
            case "ROLE_STAFF" -> {
                Staff staff = staffRepository.findByAccountId(id);
                yield UserInfo.fromStaff(account, staff);
            }
            case "ROLE_AGENCY" -> {
                Agency agency = agencyRepository.findByAccountAccountId(id);
                yield UserInfo.fromAgency(account, agency);
            }
            case "ROLE_MEMBER" -> {
                Member member = memberRepository.findByAccountAccountId(id);
                yield UserInfo.fromMember(account, member);
            }
            default -> UserInfo.fromAccount(account);
        };
    }

    @Override
    public UserInfo getSellerToUserInfo(String sellerId) {
        Seller seller = sellerRepository.getReferenceById(sellerId);
        Account account = accountRepository.getReferenceById(String.valueOf(seller.getAccountId()));
        UserInfo info = UserInfo.fromSeller(account, seller);
        System.out.println("get seller info: " + info);
        return info;
    }

    @Override
    public UserInfo getManagerToUserInfo(String managerId) {
        Manager manager = managerRepository.getReferenceById(managerId);
        Account account = accountRepository.getReferenceById(String.valueOf(manager.getAccountId()));
        UserInfo info = UserInfo.fromManager(account, manager);
        System.out.println("get manager info: " + info);
        return info;
    }

    @Override
    public UserInfo getStaffToUserInfo(String staffId) {
        Staff staff = staffRepository.getReferenceById(staffId);
        Account account = accountRepository.getReferenceById(String.valueOf(staff.getAccountId()));
        UserInfo info = UserInfo.fromStaff(account, staff);
        System.out.println("get staff info: " + info);
        return info;
    }

    @Override
    public UserInfo getAgencyToUserInfo(String agencyId) {
        Agency agency = agencyRepository.getReferenceById(agencyId);
        Account account = accountRepository.getReferenceById(String.valueOf(agency.getAccount().getAccountId()));
        UserInfo info = UserInfo.fromAgency(account, agency);
        System.out.println("get agency info: " + info);
        return info;
    }

    @Override
    public UserInfo getMemberToUserInfo(String memberId) {
        Member member = memberRepository.getReferenceById(memberId);
        Account account = accountRepository.getReferenceById(String.valueOf(member.getAccount().getAccountId()));
        UserInfo info = UserInfo.fromMember(account, member);
        System.out.println("get member info: " + info);
        return info;
    }

    @Override
    public List<UserInfo> getListStaffByManager(String managerId) {
        List<Staff> list = staffRepository.findAllByManagerId(managerId);
        List<UserInfo> staffList = list.stream().map(staff -> getStaffToUserInfo(staff.getStaffId())).toList();
        System.out.println("List staff info by manager " + managerId + " size " + staffList.size());
        return staffList;
    }

    @Override
    public List<MemberDTO> getMembersByAgency(String agencyId) {
        return memberRepository.findAllByAgencyAgencyId(agencyId)
                .stream().map(MemberDTO::from)
                .toList();
    }

    @Override
    public void registerAccount(CreateAccountRequestDTO request) {
        Account newAccount = new Account(
                -1,
                AccountUtils.generateUsername(request.getFullName()),
                encoder.encode(request.getPassword()),
                request.getRole(),
                request.getFullName(),
                request.getGender(),
                request.getBirthDate(),
                request.getEmail(),
                request.getPhone(),
                request.getAddress(),
                request.getIdCard(),
                "active"
        );
        Account savedAccount = accountRepository.save(newAccount);
        switch (savedAccount.getRoleId()) {
            case "ROLE_SELLER" -> {
                Seller newSeller = new Seller(
                        UUID.randomUUID().toString(),
                        savedAccount.getAccountId(),
                        request.getCompany()
                );
                sellerRepository.save(newSeller);
            }
            case "ROLE_MANAGER" -> {
                Manager newManager = new Manager(
                        UUID.randomUUID().toString(),
                        savedAccount.getAccountId(),
                        request.getYearsOfExperience()
                );
                managerRepository.save(newManager);
            }
            case "ROLE_AGENCY" -> {
                Agency newAgency = new Agency(
                        UUID.randomUUID().toString(),
                        request.getCompany(),
                        request.getYearsOfExperience(),
                        request.getCompletedProject(),
                        request.getDescription(),
                        savedAccount,
                        List.of()
                );
                agencyRepository.save(newAgency);
            }
        }
    }

    @Override
    public void registerStaff(RegisterStaffDTO request, String managerId) {
        Account newAccount = request.toAccount();
        newAccount.setAccountPassword(encoder.encode(newAccount.getAccountPassword()));
        Account savedAccount = accountRepository.save(newAccount);
        Staff newStaff = new Staff(
                UUID.randomUUID().toString(),
                savedAccount.getAccountId(),
                managerId
        );
        staffRepository.save(newStaff);
    }

    @Override
    public void registerMember(RegisterMemberDTO request, String agencyId) {
        Account newAccount = request.toAccount();
        newAccount.setAccountPassword(encoder.encode(newAccount.getAccountPassword()));
        Account savedAccount = accountRepository.save(newAccount);
        Member newMember = new Member(
                UUID.randomUUID().toString(),
                agencyRepository.getReferenceById(agencyId),
                savedAccount
        );
        memberRepository.save(newMember);
    }
}