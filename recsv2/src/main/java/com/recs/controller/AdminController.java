package com.recs.controller;

import com.recs.models.entities.account.Account;
import com.recs.services.accountsvc.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {

    @Autowired
    private AccountService accountService;

    @GetMapping({"", "/dashboard"})
    public String dashboardView(Model model, Authentication authentication){
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        List<Account> registerList = accountService.getApprovingAccount();
        List<Account> allAccounts = accountService.getAllAccount();
        String currentPage = "dashboard";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("registerList", registerList);
        model.addAttribute("allAccounts", allAccounts);
        return "admin/dashboard-admin";
    }

    @GetMapping({"/profile"})
    public String profileView(Model model, Authentication authentication){
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "profile";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "admin/profile-admin";
    }

    @GetMapping({"/property-tracking"})
    public String propTrackingView(Model model, Authentication authentication){
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "tracking";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "admin/property-tracking";
    }

    @GetMapping({"/history"})
    public String historyView(Model model, Authentication authentication){
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "history";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "admin/history-admin";
    }
}
