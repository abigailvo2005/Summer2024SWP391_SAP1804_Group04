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
import com.recs.services.emailservice.EmailService;
import com.recs.utils.AccountUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Service
public class AccountServiceImpl implements AccountService {

    private AccountRepository accountRepository;

    private SellerRepository sellerRepository;

    private ManagerRepository managerRepository;

    private StaffRepository staffRepository;

    private AgencyRepository agencyRepository;

    private MemberRepository memberRepository;

    private PasswordEncoder encoder;

    private AccountUtils accountUtils;

    private EmailService emailService;

    @Autowired
    public AccountServiceImpl(
            AccountRepository accountRepository,
            SellerRepository sellerRepository,
            ManagerRepository managerRepository,
            StaffRepository staffRepository,
            AgencyRepository agencyRepository,
            MemberRepository memberRepository,
            PasswordEncoder passwordEncoder,
            AccountUtils accountUtils,
            EmailService emailService) {
        this.accountRepository = accountRepository;
        this.sellerRepository = sellerRepository;
        this.managerRepository = managerRepository;
        this.staffRepository = staffRepository;
        this.agencyRepository = agencyRepository;
        this.memberRepository = memberRepository;
        this.encoder = passwordEncoder;
        this.accountUtils = accountUtils;
        this.emailService = emailService;
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
        Account deleteAccount = accountRepository.getReferenceById(accountId);
        if (deleteAccount != null & deleteAccount.getRoleId() != null) {
            switch (deleteAccount.getRoleId()) {
                case "ROLE_SELLER":
                    Seller seller = sellerRepository.findByAccountId(Integer.parseInt(accountId));
                    if (seller != null) {
                        sellerRepository.delete(seller);
                    }
                    break;
                case "ROLE_MANAGER":
                    Manager manager = managerRepository.findByAccountId(Integer.parseInt(accountId));
                    if (manager != null) {
                        managerRepository.delete(manager);
                    }
                    break;
                case "ROLE_AGENCY":
                    Agency agency = agencyRepository.findByAccountAccountId(Integer.parseInt(accountId));
                    if (agency != null) {
                        agencyRepository.delete(agency);
                    }
                    break;
                case "ROLE_MEMBER":
                    Member member = memberRepository.findByAccountAccountId(Integer.parseInt(accountId));
                    if (member != null) {
                        memberRepository.delete(member);
                    }
                    break;
                case "ROLE_STAFF":
                    Staff staff = staffRepository.findByAccountId(Integer.parseInt(accountId));
                    if (staff != null) {
                        staffRepository.delete(staff);
                    }
                    break;
            }
        }
        accountRepository.deleteById(accountId);
        return true;
    }

    @Override
    public void updateStatus(String accountId, String status) {
        Account account = accountRepository.getReferenceById(accountId);
        if (account != null) {
            account.setStatus(status);
            accountRepository.save(account);
        }

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
                Manager manager = managerRepository.getReferenceById(staff.getManagerId());
                Account managerAccount = accountRepository.getReferenceById(String.valueOf(manager.getAccountId()));
                UserInfo userInfo = UserInfo.fromStaff(account, staff);
                userInfo.setSuperiorId(managerAccount.getUsername());
                yield userInfo;
            }
            case "ROLE_AGENCY" -> {
                Agency agency = agencyRepository.findByAccountAccountId(id);
                yield UserInfo.fromAgency(account, agency);
            }
            case "ROLE_MEMBER" -> {
                Member member = memberRepository.findByAccountAccountId(id);
                Agency agency = agencyRepository.getReferenceById(member.getAgency().getAgencyId());
                UserInfo userInfo = UserInfo.fromMember(account, member);
                userInfo.setSuperiorId(agency.getAccount().getUsername());
                yield userInfo;
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
    public List<UserInfo> getListAgencyToUserInfo() {
        List<Agency> agencies = agencyRepository.findAll();

        return agencies.stream().map(agency -> {
            Account account = accountRepository.findById(String.valueOf(agency.getAccount().getAccountId()))
                    .orElse(null);
            return UserInfo.fromAgency(account, agency);
        })
                .collect(Collectors.toList());
    }

    @Override
    public List<UserInfo> getListSellerToUserInfo() {
        List<Seller> sellers = sellerRepository.findAll();

        return sellers.stream().map(seller -> {
            Account account = accountRepository.findById(String.valueOf(seller.getAccountId())).orElse(null);
            return UserInfo.fromSeller(account, seller);
        })
                .collect(Collectors.toList());
    }

    @Override
    public List<UserInfo> getListManagerToUserInfo() {
        List<Manager> managers = managerRepository.findAll();

        return managers.stream().map(manager -> {
            Account account = accountRepository.findById(String.valueOf(manager.getAccountId())).orElse(null);
            return UserInfo.fromManager(account, manager);
        })
                .collect(Collectors.toList());
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
                0,
                accountUtils.generateUsername(request.getFullName()),
                encoder.encode(request.getPassword()),
                request.getRole(),
                request.getFullName(),
                request.getGender().equalsIgnoreCase("Male") ? 0 : 1,
                request.getBirthDate(),
                request.getEmail(),
                request.getPhone(),
                request.getAddress(),
                request.getIdCard(),
                "ACTIVE",
                "");
        Account savedAccount = accountRepository.save(newAccount);
        mailRegisterAccount(newAccount, request.getPassword());
        switch (savedAccount.getRoleId()) {
            case "ROLE_SELLER" -> {
                Seller newSeller = new Seller(
                        UUID.randomUUID().toString(),
                        savedAccount.getAccountId(),
                        request.getCompanySeller());
                sellerRepository.save(newSeller);
            }
            case "ROLE_MANAGER" -> {
                Manager newManager = new Manager(
                        UUID.randomUUID().toString(),
                        savedAccount.getAccountId(),
                        request.getYearsOfExperienceMan() != 0 ? request.getYearsOfExperienceMan() : 0);
                managerRepository.save(newManager);
            }
            case "ROLE_AGENCY" -> {
                Agency newAgency = new Agency(
                        UUID.randomUUID().toString(),
                        request.getCompany(),
                        request.getYearsOfExperience() != 0 ? request.getYearsOfExperience() : 0,
                        request.getCompletedProject() != 0 ? request.getCompletedProject() : 0,
                        request.getDescription(),
                        savedAccount,
                        List.of());
                agencyRepository.save(newAgency);
            }
        }
    }

    @Override
    public void registerStaff(RegisterStaffDTO request, String managerId) {
        Account newAccount = request.toAccount();
        newAccount.setAccountPassword(encoder.encode(newAccount.getAccountPassword()));
        newAccount.setUsername(accountUtils.generateUsername(newAccount.getFullName()));
        Account savedAccount = accountRepository.save(newAccount);
        Staff newStaff = new Staff(
                UUID.randomUUID().toString(),
                savedAccount.getAccountId(),
                managerId,
                0);
        mailRegisterAccount(newAccount, request.getPassword());
        staffRepository.save(newStaff);
    }

    @Override
    public void registerMember(RegisterMemberDTO request, String agencyId) {
        Account newAccount = request.toAccount();
        newAccount.setAccountPassword(encoder.encode(newAccount.getAccountPassword()));
        newAccount.setUsername(accountUtils.generateUsername(newAccount.getFullName()));
        Account savedAccount = accountRepository.save(newAccount);
        Member newMember = new Member(
                UUID.randomUUID().toString(),
                agencyRepository.getReferenceById(agencyId),
                savedAccount);
        mailRegisterAccount(newAccount, request.getPassword());
        memberRepository.save(newMember);
    }

    private void mailRegisterAccount(Account newAccount, String password) {
        Account mailAccount = new Account();
        mailAccount.setUsername(newAccount.getUsername());
        mailAccount.setAccountPassword(password);
        mailAccount.setEmail(newAccount.getEmail());
        mailAccount.setRoleId(newAccount.getRoleId());
        emailService.sendNewAccountEmail(mailAccount);
    }

    @Override
    public void updatePassword(String accountId, String newPassword) {
        Account account = accountRepository.getReferenceById(accountId);
        account.setAccountPassword(encoder.encode(newPassword));
        accountRepository.save(account);
    }

    @Override
    public void updateAddress(String accountId, String address) {
        Account account = accountRepository.getReferenceById(accountId);
        account.setAddress(address);
        accountRepository.save(account);
    }

    @Override
    public void updateIDCard(String accountId, String idCard) {
        Account account = accountRepository.getReferenceById(accountId);
        account.setIdCard(idCard);
        accountRepository.save(account);
    }

    @Override
    public void updateEmail(String accountId, String email) {
        Account account = accountRepository.getReferenceById(accountId);
        account.setEmail(email);
        accountRepository.save(account);
    }

    @Override
    public void updateGender(String accountId, int gender) {
        Account account = accountRepository.getReferenceById(accountId);
        account.setGender(gender);
        accountRepository.save(account);
    }

    @Override
    public void updateBirthday(String accountId, String birthDate) {
        Account account = accountRepository.getReferenceById(accountId);
        account.setBirthDate(birthDate);
        accountRepository.save(account);
    }

    @Override
    public void updateYOE(String accountId, String yearsOfExperienceMan) {
        Manager manager = managerRepository.findByAccountId(Integer.valueOf(accountId));
        manager.setYearsOfExperience(Integer.valueOf(yearsOfExperienceMan));
        managerRepository.save(manager);
    }

    @Override
    public void updateNOP(String accountId, String numOfProjects) {
        Staff staff = staffRepository.findByAccountId(Integer.valueOf(accountId));
        staff.setNumOfProjects(Integer.valueOf(numOfProjects));
        staffRepository.save(staff);
    }

    @Override
    public void updateCompany(String accountId, String company) {
        Seller seller = sellerRepository.findByAccountId(Integer.valueOf(accountId));
        seller.setCompany(company);
        sellerRepository.save(seller);
    }

    @Override
    public void updateYOEAgency(String accountId, String yearsOfExperience) {
        Agency agency = agencyRepository.findByAccountAccountId(Integer.valueOf(accountId));
        agency.setYearsOfExperience(Integer.valueOf(yearsOfExperience));
        agencyRepository.save(agency);
    }

    @Override
    public void updateCompleteProjectAgency(String accountId, String completedProject) {
        Agency agency = agencyRepository.findByAccountAccountId(Integer.valueOf(accountId));
        agency.setCompletedProject(Integer.valueOf(completedProject));
        agencyRepository.save(agency);
    }

    @Override
    public void updateDescription(String accountId, String description) {
        Agency agency = agencyRepository.findByAccountAccountId(Integer.valueOf(accountId));
        agency.setDescription(description);
        agencyRepository.save(agency);
    }

    @Override
    public void updateCompanyAgency(String accountId, String company) {
        Agency agency = agencyRepository.findByAccountAccountId(Integer.valueOf(accountId));
        agency.setCompany(company);
        agencyRepository.save(agency);
    }

    @Override
    public void updatePhone(String accountId, String phoneNum) {
        Account account = accountRepository.getReferenceById(accountId);
        account.setPhone(phoneNum);
        accountRepository.save(account);
    }

    @Override
    public boolean checkPassword(String accountId, String password) {
        Account account = accountRepository.getReferenceById(accountId);
        return encoder.matches(password, account.getAccountPassword());
    }

    @Override
    public void forgetPassword(String username) {
        Optional<Account> optionalAccount = accountRepository.findByUsername(username);
        if (optionalAccount.isPresent()) {
            Account account = optionalAccount.get();
            String resetToken = UUID.randomUUID().toString();
            account.setResetToken(resetToken);
            accountRepository.save(account);
            emailService.sendForgetPasswordMail(account);
        } else {
            throw new UsernameNotFoundException("User with username " + username + " not found");
        }
    }

    @Override
    public void resetPassword(String token, String newPassword) {
        Account account = accountRepository.findByResetToken(token);
        if (account != null) {
            account.setAccountPassword(encoder.encode(newPassword));
            account.setResetToken(null);
            accountRepository.save(account);
        } else
            throw new RuntimeException("Cannot find account by token");
    }

    @Override
    public boolean checkExistedMail(String mail) {
        List<Account> accountsByEmail = accountRepository.getAllByEmail(mail);
        return !accountsByEmail.isEmpty();
    }

    @Override
    public boolean checkExistedMail(String mail) {
        List<Account> accountsByEmail = accountRepository.getAllByEmail(mail);
        return !accountsByEmail.isEmpty();
    }
}