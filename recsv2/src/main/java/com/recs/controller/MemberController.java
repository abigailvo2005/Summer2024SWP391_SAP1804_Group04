package com.recs.controller;

import java.util.List;

import com.recs.models.entities.recsbusiness.DealAssignMember;
import com.recs.services.businesssvc.RecsBusinessService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.DealAssignMemberDTO;
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

@Controller
@PreAuthorize("hasRole('ROLE_MEMBER')")
@RequestMapping("/member")
@SessionAttributes(names = "LOGIN_USER")
public class MemberController {
    @Autowired
    private RealEstateService realEstateService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private RecsBusinessService recsBusinessService;

    @ModelAttribute(name = "LOGIN_USER")
    public UserInfo getLoginUser(Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        return accountService.getUserInfo(account.getAccountId());
    }

    @GetMapping({ "", "/dashboard" })
    public String dashboardView(Model model, @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {

        List<DealAssignMember> dealAssignMemberList = recsBusinessService.getAllDealByMemberId(userInfo.getMemberId());
//        System.out.println(dealAssignMemberList);
        String currentPage = "dashboard";
        model.addAttribute("name", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("dealList", dealAssignMemberList);
        // return "seller/dashboard-seller";
        return "member/dashboard-member";
    }

    @GetMapping("/create-buyer")
    public String createBuyer(Model model, @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        String currentPage = "create-buyer";
        List<DealAssignMember> dealAssignMembers = recsBusinessService.getAllDealByMemberId(userInfo.getMemberId());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("dealList", dealAssignMembers);
        model.addAttribute("name", userInfo.getFullName());
        return "member/create-buyer";
    }

}
