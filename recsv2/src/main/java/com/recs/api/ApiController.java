package com.recs.api;

import com.recs.models.entities.account.Account;
import com.recs.services.accountsvc.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/api")
public class ApiController {

    @Autowired
    private AccountService accountService;

    @PostMapping("/user/new")
    public String addNewAccount(@RequestBody Account account) {
        accountService.create(account);
        return "check database!!!";
    }
}
