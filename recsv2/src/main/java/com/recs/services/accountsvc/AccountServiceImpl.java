package com.recs.services.accountsvc;

import com.recs.models.entities.account.Account;
import com.recs.models.entities.account.Agency;
import com.recs.repositories.account.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService{

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
        List<Account> list = accountRepository.findAll();
        System.out.println("List all accounts size :"+ list.size());
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
        if(a != null){
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
    public List<Account> getApprovingAccount() {
        List<Account> list = accountRepository.findByStatus("APPROVING");
        System.out.println("list registering account size: "+ list.size());
        return list;
    }
}
