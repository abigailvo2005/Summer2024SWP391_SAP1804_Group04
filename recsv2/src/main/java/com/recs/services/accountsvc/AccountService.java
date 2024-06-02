package com.recs.services.accountsvc;

import com.recs.models.entities.account.Account;

import java.util.List;

public interface AccountService {
    public List<Account> getAllAccount();

    public Account getById(String accountId);

    public Account create(Account account);

    public Account update(String accountId, Account account);

    public boolean deleteAccount(String accountId);

    public Account getByUserName(String username);

    public List<Account> getApprovingAccount();
}
