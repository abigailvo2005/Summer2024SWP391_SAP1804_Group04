package com.recs.controller;

import com.recs.models.dto.account.CreateAccountRequestDTO;
import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.entities.account.Account;
import com.recs.models.entities.account.Staff;
import com.recs.services.accountsvc.AccountService;
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

import java.util.ArrayList;
import java.util.List;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
@SessionAttributes(names = "LOGIN_USER")
public class AdminController {

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

    @GetMapping({"", "/dashboard"})
    public String dashboardView(
            Model model,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo
            ){
        Account account = accountService.getByUserName(userInfo.getUsername());
        List<Account> registerList = accountService.getApprovingAccount()
                .stream()
                .filter(row -> row.getAccountId() != userInfo.getAccountId()).toList();;
        List<Account> allAccounts = accountService.getAllAccount().stream()  
                .filter(row -> row.getAccountId() != userInfo.getAccountId()).toList();
        List<RealEstateInfo> allRealEstateInfo = realEstateService.getAllRealEstate();
        String currentPage = "dashboard";
        model.addAttribute("listRealEstate", allRealEstateInfo);
        model.addAttribute("fullName", userInfo.getUsername());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("reqList", registerList);
        model.addAttribute("allAccounts", allAccounts);
        return "admin/dashboard-admin";
    }

    @GetMapping({"/profile"})
    public String profileView(Model model, Authentication authentication){
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "profile";
        model.addAttribute("fullName", name);
        model.addAttribute("account", account);
        model.addAttribute("currentPage", currentPage);
        return "admin/profile-admin";
    }


    @GetMapping({"/create-account"})
    public String createAccount(Model model, Authentication authentication){
        List<UserInfo> agencyList = accountService.getListAgencyToUserInfo();
        List<UserInfo> managerList = accountService.getListManagerToUserInfo();
        List<UserInfo> sellerList = accountService.getListSellerToUserInfo();
        List<UserInfo> listAll = new ArrayList<>();
        listAll.addAll(agencyList);
        listAll.addAll(managerList);
        listAll.addAll(sellerList);
        
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "create-account";
        model.addAttribute("listAccount", listAll);
        model.addAttribute("fullName", name);
        model.addAttribute("currentPage", currentPage);
        return "admin/create-account";
    }

    @PostMapping("/create-account")
    public String createAccount(
            @ModelAttribute(name = "request") CreateAccountRequestDTO request
            ) {
        accountService.registerAccount(request);
        return "redirect:/admin/create-account";
    }
    

    @PostMapping("/password/update")
    public String updatePassword(
            @RequestParam String password,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo
    ) {
        accountService.updatePassword(String.valueOf(userInfo.getAccountId()), password);
        return "redirect:/admin/profile";
    }

    @PostMapping("/email/update")
    public String updateEmail(
            @RequestParam String accountId,
            @RequestParam String email) {
        accountService.updateEmail(accountId, email);
        return "redirect:/admin/dashboard";
    }

    @PostMapping("/company/update")
    public String updateCompany(@RequestParam String accountId, @RequestParam String companySeller) {
        accountService.updateCompany(accountId, companySeller);
        return "redirect:/admin/dashboard";
    }

    @PostMapping("/yearofexperience/update")
    public String updateYearOfExperience(@RequestParam String accountId, @RequestParam String yearsOfExperienceMan) {
        accountService.updateYOE(accountId, yearsOfExperienceMan);
        return "redirect:/admin/dashboard";
    }

    @PostMapping("/numberofproject/update")
    public String updateNumberOfProject(@RequestParam String accountId, @RequestParam String numOfProjects) {
        accountService.updateNOP(accountId, numOfProjects);
        return "redirect:/admin/dashboard";
    }

    @PostMapping("/yoeagency/update")
    public String updateYOEAgency(@RequestParam String accountId, @RequestParam String yearsOfExperience) {
        accountService.updateYOEAgency(accountId, yearsOfExperience);
        return "redirect:/admin/dashboard";
    }

    @PostMapping("/completeprojectagency/update")
    public String updateCompletProject(@RequestParam String accountId, @RequestParam String completedProject) {
        accountService.updateCompleteProjectAgency(accountId, completedProject);
        return "redirect:/admin/dashboard";
    }

    @PostMapping("/description/update")
    public String updateDescription(@RequestParam String accountId, @RequestParam String description) {
        accountService.updateDescription(accountId, description);
        return "redirect:/admin/dashboard";
    }
    
    
    

    @PostMapping("/companyAgency/update")
    public String updateCompanyAgency(@RequestParam String accountId, @RequestParam String company) {
        accountService.updateCompanyAgency(accountId, company);
        return "redirect:/admin/dashboard";
    }
    
    
    
    

    @PostMapping("/birthday/update")
    public String updateBirthday(@RequestParam String accountId, @RequestParam String birthDate) {
        accountService.updateBirthday(accountId, birthDate);
        return "redirect:/admin/dashboard";
    }
    

    @PostMapping("/address/update")
    public String updateAddress(@RequestParam String accountId,
                                 @RequestParam String address) {
        
        accountService.updateAddress(accountId, address);
        return "redirect:/admin/dashboard";
    }
    
    

    @PostMapping("/gender/update")
    public String updateGender(
            @RequestParam String accountId,
            @RequestParam int gender) {
        accountService.updateGender(accountId, gender);
        return "redirect:/admin/dashboard";
    }
    
    @PostMapping("/idcard/update")
    public String postMethodName(@RequestParam String accountId,
                                 @RequestParam String idCard) {
        accountService.updateIDCard(accountId, idCard);
        System.out.println("Acccount: " + accountId);
        System.out.println("idcard" + idCard);
        return "redirect:/admin/dashboard";
    }


    @PostMapping("/phone/update")
    public String updatePhone(
            @RequestParam String phone,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo
    ) {
        accountService.updatePhone(String.valueOf(userInfo.getAccountId()), phone);
        return "redirect:/admin/profile";
    }

    @PostMapping("/account/delete")
    public String deleteAccount(
            @RequestParam String accountId
    ) {
        System.out.println("Account Id: " + accountId);
        accountService.updateStatus(accountId, "INACTIVE");
        return  "redirect:/admin";
    }
}
