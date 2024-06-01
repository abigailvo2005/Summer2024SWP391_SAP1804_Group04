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

@Controller
@PreAuthorize("hasRole('ROLE_SELLER')")
@RequestMapping("/seller")
public class SellerController {
    @Autowired
    private AccountService accountService;

    @GetMapping({ "", "/dashboard" })
    public String dashboardView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "dashboard";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "seller/dashboard-seller";
    }

    @GetMapping({ "/create-property" })
    public String createPropView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "create-property";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "seller/create-property";
    }

    @GetMapping({ "/history" })
    public String historyView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "history";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "seller/history-seller";
    }

    @GetMapping({ "/profile" })
    public String profileView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "profile";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "seller/profile-seller";
    }
}


