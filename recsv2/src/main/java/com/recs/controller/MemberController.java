package com.recs.controller;

import java.util.Comparator;
import java.util.List;

import com.recs.models.dto.recsbusiness.BuyerRequestCreateDTO;
import com.recs.models.dto.recsbusiness.BuyerRequestDTO;
import com.recs.models.entities.recsbusiness.DealAssignMember;
import com.recs.models.enums.JobStatus;
import com.recs.services.businesssvc.RecsBusinessService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.DealAssignMemberDTO;
import com.recs.models.dto.recsbusiness.ValidationJobInfo;
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

        List<DealAssignMemberDTO> dealAssignMemberList = recsBusinessService.getAllDealByMemberId(userInfo.getMemberId())
                .stream().map(DealAssignMemberDTO::from).toList();
//        System.out.println(dealAssignMemberList);
        List<BuyerRequestDTO> allBuyerRequests = recsBusinessService.getBuyerRequestByMember(userInfo.getMemberId())
                .stream().sorted(Comparator.comparing(BuyerRequestDTO::getStatus))
                .toList();
        System.out.println("buyer request list: "+ allBuyerRequests);
        String currentPage = "dashboard";
        model.addAttribute("name", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("dealList", dealAssignMemberList);
        return "member/dashboard-member";
    }

    @GetMapping({ "/history" })
    public String historyView(Model model, @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        String name = userInfo.getFullName();
        Account account = accountService.getByUserName(name);
        String currentPage = "history";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "member/history-member";
    }

    @GetMapping("/create-buyer")
    public String createBuyerView(Model model, @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        String currentPage = "create-buyer";
        List<DealAssignMemberDTO> dealAssignMembers = recsBusinessService.getAssignDealPageByMemberId(userInfo.getMemberId());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("dealList", dealAssignMembers);
        model.addAttribute("name", userInfo.getFullName());
        return "member/create-buyer";
    }

    @PostMapping("/create-buyer")
    public String createBuyer(
            @ModelAttribute(name = "request")BuyerRequestCreateDTO request
            ) {
        recsBusinessService.createBuyerRequest(request);
        return "redirect:/create-buyer";
    }

}
