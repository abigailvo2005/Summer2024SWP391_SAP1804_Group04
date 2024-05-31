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
@PreAuthorize("hasRole('ROLE_MANAGER')")
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private AccountService accountService;


    @GetMapping({ "", "/dashboard" })
    public String dashboardView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "dashboard";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "manager/dashboard-man";
    }

    @GetMapping({ "/profile" })
    public String profileView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "profile";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "manager/profile-man";
    }

    @GetMapping({ "/assign-job" })
    public String assignJobView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "assign-job";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "manager/assign-job";
    }

    @GetMapping({ "/register-acc-man" })
    public String registerStaffView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "register";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "manager/register-acc-man";
    }

    @GetMapping({ "/history" })
    public String historyView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "history";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "manager/history-man";
    }

    @GetMapping({ "/register-staff" })
    public String historyView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "history";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);

        /* logic BE update db... */


        return "manager/register-acc-man";
    }


}
