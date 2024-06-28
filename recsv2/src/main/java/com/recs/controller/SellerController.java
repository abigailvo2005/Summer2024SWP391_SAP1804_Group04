package com.recs.controller;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.CreateRealEstateRequestDTO;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.ApproveAgencyRequestDTO;
import com.recs.models.entities.account.Account;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.models.enums.BuyerRequestStatus;
import com.recs.models.enums.RealEstateStatus;
import com.recs.services.accountsvc.AccountService;
import com.recs.services.businesssvc.RecsBusinessService;
import com.recs.services.realestaesvc.RealEstateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@PreAuthorize("hasRole('ROLE_SELLER')")
@RequestMapping("/seller")
@SessionAttributes(names = "LOGIN_USER")
public class SellerController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private RealEstateService realEstateService;

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
        List<RealEstateInfo> validatingList = realEstateService.getValidatingBySeller(userInfo.getSellerId());
        List<RealEstateInfo> allRealEstate = realEstateService.getAllBySeller(userInfo.getSellerId());

        String currentPage = "dashboard";
        model.addAttribute("name", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("reqList", validatingList);
        model.addAttribute("propList", allRealEstate);
        return "seller/dashboard-seller";
    }

    @PostMapping("/dashboard")
    public String updatePW(@RequestParam("realEstateID") String realEstateID,
            @RequestParam("url") String url,

            Model model) {
        System.out.println("ID" + realEstateID);
        realEstateService.updateStatus(realEstateID, RealEstateStatus.REVIEWING, "");

        realEstateService.updatePaperWork(realEstateID, url);

        String currentPage = "dashboard";
        model.addAttribute("currentPage", currentPage);
        return "redirect:/seller";
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

    @PostMapping({ "/create-property" })
    public String createPropView(
            @ModelAttribute(name = "request") CreateRealEstateRequestDTO request,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo,
            Model model) {

        RealEstate realEstate = realEstateService.createRealEstate(userInfo.getSellerId(), request);
        String currentPage = "create-property";
        model.addAttribute("name", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);

        return "redirect:/seller";
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

    @PostMapping("/agency-request/approve")
    public String updateAgencyRequestStatus(
            @ModelAttribute(name = "request") ApproveAgencyRequestDTO request) {
        recsBusinessService.approveAgencyRequest(request);
        return "redirect:/seller";
    }

    @PostMapping("/buyer-request/approve")
    public String approveBuyer(
            @RequestParam List<String> requestIds
    ) {
        recsBusinessService.updateBuyer(requestIds, BuyerRequestStatus.ACCEPTED);
        return "redirect:/seller";
    }

    @PostMapping("buyer-request/connect")
    public String connectBuyer(
            @RequestParam String requestId
    ) {
        recsBusinessService.updateBuyer(List.of(requestId), BuyerRequestStatus.CONNECTED);
        return "redirect:/seller";
    }
}
