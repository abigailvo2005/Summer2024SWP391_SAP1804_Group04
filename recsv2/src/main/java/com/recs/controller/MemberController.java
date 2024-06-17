package com.recs.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.entities.account.Account;
import com.recs.services.realestaesvc.RealEstateService;
import com.recs.models.dto.realestate.CreateRealEstateRequestDTO;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.services.accountsvc.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller(value = "/member")
@PreAuthorize("hasRole('ROLE_MANAGER')")
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private RealEstateService realEstateService;

    @Autowired
    private AccountService accountService;

    @ModelAttribute(name = "LOGIN_USER")
    public UserInfo getLoginUser(Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        return accountService.getUserInfo(account.getAccountId());
    }

    @GetMapping({ "", "/dashboard" })
    public String dashboardView(Model model, @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        List<RealEstateInfo> validatingList = realEstateService.getValidatingBySeller(userInfo.getSellerId());
        List<RealEstateInfo> allRealEstate = realEstateService.getAllRealEstate();

        String currentPage = "dashboard";
        model.addAttribute("name", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("dealList", allRealEstate);
        // return "seller/dashboard-seller";
        return "member/dashboard-member";
    }

    @GetMapping("/create-buyer")
    public String createBuyer(Model model) {
        return "member/create-buyer";
    }

}
