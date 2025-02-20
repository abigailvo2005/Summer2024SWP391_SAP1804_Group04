package com.recs.controller;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.UpdateJobStatusDTO;
import com.recs.models.dto.recsbusiness.ValidationJobInfo;
import com.recs.models.entities.account.Account;
import com.recs.models.enums.JobStatus;
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
@PreAuthorize("hasRole('ROLE_STAFF')")
@RequestMapping("/staff")
@SessionAttributes(names = "LOGIN_USER")
public class StaffController {
    @Autowired
    private AccountService accountService;

    @Autowired
    private RecsBusinessService recsBusinessService;

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

        List<ValidationJobInfo> validatingList = recsBusinessService.getListByStaffAndStatus(userInfo.getStaffId(),
                JobStatus.ASSIGNED.getValue());

        List<ValidationJobInfo> listingList = recsBusinessService.getListByStaffAndStatus(userInfo.getStaffId(),
                JobStatus.SUCCESSFUL.getValue());

        String currentPage = "dashboard";
        model.addAttribute("fullName", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("jobList", validatingList);
        model.addAttribute("listingList", listingList);

        return "staff/dashboard-staff";
    }

    @PostMapping("/job/cancel")
    public String cancelJob(@RequestParam String jobId) {
        recsBusinessService.cancelJob(jobId);
        return "redirect:/staff/dashboard";
    }
    

    @PostMapping("/validate-property")
    public String validate(@ModelAttribute(name = "request") UpdateJobStatusDTO request) {
        recsBusinessService.updateStatus(request);
        return "redirect:/staff/history";
    }

    @GetMapping({ "/history" })
    public String historyView(Model model, @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        List<ValidationJobInfo> listingListValidateSuccess = recsBusinessService
                .getListByStaffAndStatus(userInfo.getStaffId(), JobStatus.SUCCESSFUL.getValue());
        List<ValidationJobInfo> listingListValidateFail = recsBusinessService
                .getListByStaffAndStatus(userInfo.getStaffId(), JobStatus.FAIL.getValue());
        String name = userInfo.getFullName();
        Account account = accountService.getByUserName(name);
        String currentPage = "history";
        model.addAttribute("listSuccess", listingListValidateSuccess);
        model.addAttribute("listFail", listingListValidateFail);
        model.addAttribute("fullName", name);
        model.addAttribute("currentPage", currentPage);
        return "staff/history-staff";
    }

    @GetMapping({ "/profile" })
    public String profileView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "profile";
        model.addAttribute("fullName", name);
        model.addAttribute("account", account);
        model.addAttribute("currentPage", currentPage);
        return "staff/profile-staff";
    }

    @PostMapping("/password/update")
    public String updatePassword(
            @RequestParam String password,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        accountService.updatePassword(String.valueOf(userInfo.getAccountId()), password);
        return "redirect:/staff/profile";
    }

    @PostMapping("/phone/update")
    public String updatePhone(
            @RequestParam String phone,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        accountService.updatePhone(String.valueOf(userInfo.getAccountId()), phone);
        return "redirect:/staff/profile";
    }

}
