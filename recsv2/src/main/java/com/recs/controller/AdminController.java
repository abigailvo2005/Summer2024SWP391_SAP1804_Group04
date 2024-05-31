package com.recs.controller;

import com.recs.models.entities.Account;
import com.recs.services.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
        String currentPage = "dashboard";
        model.addAttribute("name", account);
        model.addAttribute("currentPage", currentPage);
        return "admin/dashboard-admin";
    }

    @GetMapping({"/profile"})
    public String profileView(Model model, Authentication authentication){
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "profile";
        model.addAttribute("name", account);
        model.addAttribute("currentPage", currentPage);
        return "admin/profile-admin";
    }

    @GetMapping({"/history"})
    public String historyView(Model model, Authentication authentication){
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "history";
        model.addAttribute("name", account);
        model.addAttribute("currentPage", currentPage);
        return "admin/history-admin";
    }
}
