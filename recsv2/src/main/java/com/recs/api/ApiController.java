package com.recs.api;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.entities.account.Account;
import com.recs.services.accountsvc.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/api")
public class ApiController {

    private AccountService accountService;

    @Autowired
    public ApiController(AccountService accountService) {
        this.accountService = accountService;
    }

    @PostMapping("/user/new")
    public String addNewAccount(@RequestBody Account account) {
        accountService.create(account);
        return "check database!!!";
    }

    @GetMapping(path = "/user/{id}", produces = "application/json")
    public ResponseEntity<UserInfo> getUserInfo(@PathVariable(name = "id") String id) {
        UserInfo user = accountService.getUserInfo(Integer.parseInt(id));
        return ResponseEntity.ok(user);
    }
}
