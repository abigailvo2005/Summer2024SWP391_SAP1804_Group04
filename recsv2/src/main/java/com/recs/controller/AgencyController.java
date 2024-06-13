package com.recs.controller;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.entities.account.Account;
import com.recs.models.entities.account.Agency;
import com.recs.services.accountsvc.AccountService;
import com.recs.services.realestaesvc.RealEstateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@PreAuthorize("hasRole('ROLE_AGENCY')")
@RequestMapping("/agency")
@SessionAttributes(names = "LOGIN_USER")
public class AgencyController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private RealEstateService realEstateService;

    @ModelAttribute(name = "LOGIN_USER")
    public UserInfo getLoginUser(Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        return accountService.getUserInfo(account.getAccountId());
    }


    @GetMapping({ "", "/dashboard" })
    public String dashboardView(Model model, @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        //List<RealEstateInfo> validatingList = realEstateService.getValidatingBySeller(userInfo.getSellerId());
        //sample loading only
        List<RealEstateInfo> validatedList = realEstateService.getAllRealEstate().stream()
         .filter(realEstateInfo -> realEstateInfo.getStatus().equals("success")).toList();

        //TODO() tự nhét vào
        String currentPage = "dashboard";
        model.addAttribute("name", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);
        //model.addAttribute("reqList", validatingList);
        model.addAttribute("propList", validatedList);
        return "agency/dashboard-agency";
    }

    /* FOR VIEW TEST ONLY - DELETE WHEN HAVE AGENCY CONTROLLER */
    @GetMapping({ "/marketplace" })
    public String marketplaceView(Model model, @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {

         List<RealEstateInfo> validatedList = realEstateService.getAllRealEstate().stream()
         .filter(realEstateInfo -> realEstateInfo.getStatus().equals("success")).toList();

         //Current Agency information - for Agency Profile loading
         Agency agency = accountService.getAgencyByAccountId(userInfo.getAccountId());
         System.out.println("Account Agency ID: " + userInfo.getAccountId());


        String currentPage = "marketplace";
        model.addAttribute("name", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("propList", validatedList);
        model.addAttribute("agency", agency);
        return "agency/marketplace";
    }

    @GetMapping({ "/create-mem"})
    public String registerStaff(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "create-mem";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);

        return "agency/create-acc-mem";
    }

}
