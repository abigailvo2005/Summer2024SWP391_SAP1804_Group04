package com.recs.controller;

import com.recs.models.dto.account.CreateAccountRequestDTO;
import com.recs.models.entities.account.Account;
import com.recs.services.accountsvc.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        model.addAttribute("reqList", registerList);
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
        List<Account> listAccountActive = accountService.getActiveAccount();
        List<Account> listAccountDeclined = accountService.getDeclinedAccount();
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "history";
        model.addAttribute("name", name);
        model.addAttribute("listAccountDeclined", listAccountDeclined);
        model.addAttribute("listAccountActive", listAccountActive);
        model.addAttribute("currentPage", currentPage);
        return "admin/history-admin";
    }

    @GetMapping({"/create-account"})
    public String createAccount(Model model, Authentication authentication){
        List<Account> allAccountActive = accountService.getActiveAccount();
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "create-account";
        model.addAttribute("activeAccunt", allAccountActive);
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "admin/create-account";
    }

    @GetMapping("/account/approve")
    public String approveAccount(@RequestParam(name = "") String id, Model model){
        Account account = accountService.approveAccount(id);
        System.out.println("Approved account:"+account);
        model.addAttribute("msg","Account approved!");
        return ":/admin";
    }

    @GetMapping("/account/deny")
    public String denyAccount(@RequestParam(name = "") String id, Model model){
        Account account = accountService.denyAccount(id);
        System.out.println("Denied account:"+account);
        model.addAttribute("msg","Account denied!");
        return "redirect:/admin";
    }

    @PostMapping("/create-account")
    private String createAccount(
            @ModelAttribute(name = "request") CreateAccountRequestDTO request
            ) {
        accountService.registerAccount(request);
        return "redirect:/admin/create-account";
    }
}
