package com.recs.services;

import com.recs.models.entities.Account;

import java.util.List;

public interface AccountService {
    public List<Account> getAllAccount();

    public Account getById(String accountId);

    public Account create(Account account);

    public Account update(String accountId, Account account);

    public boolean deleteAccount(String accountId);

    public Account getByUserName(String username);
}
