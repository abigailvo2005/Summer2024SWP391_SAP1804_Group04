package com.recs.services.emailservice;

import com.recs.models.entities.account.Account;

public interface EmailService {
    public void sendNewAccountEmail(Account account);

    public void sendForgetPasswordMail(Account account);
}
