package com.recs.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "/member")
@PreAuthorize("hasRole('ROLE_MANAGER')")
public class MemberController {

    @GetMapping({"", "/dashboard"})
    public String memberDashBoard(Model model) {
        return "member/dashboard-member";
    }

    @GetMapping("/create-buyer")
    public String createBuyer(Model model) {
        return "member/create-buyer";
    }

}
