package com.recs.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@PreAuthorize("hasRole('ROLE_MANAGER')")
@RequestMapping("/manager")
public class ManagerController {
    @GetMapping({"", "/dashboard"})
    public String dashboardView(Model model){
        return "manager/dashboard-man";
    }
}
