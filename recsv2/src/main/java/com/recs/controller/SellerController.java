package com.recs.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@PreAuthorize("hasRole('ROLE_SELLER')")
@RequestMapping("/seller")
public class SellerController {

    @GetMapping({"","/dashboard"})
    public String dashboardView(Model model){
        return "seller/dashboard-seller";
    }
}
