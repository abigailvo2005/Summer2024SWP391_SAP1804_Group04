package com.recs.controller;

import com.recs.models.dto.account.RegisterStaffDTO;
import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.AssignJobRequest;
import com.recs.models.dto.recsbusiness.ValidationJobInfo;
import com.recs.models.entities.account.Account;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.models.entities.recsbusiness.AssignJobStaff;
import com.recs.models.enums.JobStatus;
import com.recs.services.accountsvc.AccountService;
import com.recs.services.businesssvc.RecsBusinessService;
import com.recs.services.realestaesvc.RealEstateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.time.Clock;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@PreAuthorize("hasRole('ROLE_MANAGER')")
@RequestMapping("/manager")
@SessionAttributes(names = "LOGIN_USER")
public class ManagerController {

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

        List<ValidationJobInfo> allJob = recsBusinessService.getListByManager(userInfo.getManagerId());

        List<ValidationJobInfo> validatingJobList = allJob.stream()
                .filter(row -> JobStatus.ASSIGNED == row.getStatus())
                .toList();
        String currentPage = "dashboard";
        model.addAttribute("fullName", userInfo.getFullName()); // can get userInfo by using $sessionScope in jsp
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("valList", validatingJobList);
        return "manager/dashboard-man";
    }

    @GetMapping({ "/profile" })
    public String profileView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "profile";
        model.addAttribute("fullName", name);
        model.addAttribute("account", account);
        model.addAttribute("currentPage", currentPage);
        return "manager/profile-man";
    }

    @GetMapping({ "/assign-job" })
    public String assignJobView(Authentication authentication, Model model,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        List<RealEstateInfo> reviewingList = realEstateService.getReviewingListByManager(userInfo.getManagerId());
        String name = authentication.getName();
        List<UserInfo> staffList = accountService.getListStaffByManager(userInfo.getManagerId());

        String currentPage = "assign-job";
        model.addAttribute("fullName", name);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("reqList", reviewingList);
        model.addAttribute("staffList", staffList);
        return "manager/assign-job";
    }

    @PostMapping("/assign-job")
    public String assignJob(
            @ModelAttribute(name = "request") AssignJobRequest request,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        System.out.println(request);
        AssignJobStaff entity = new AssignJobStaff(
                UUID.randomUUID().toString(),
                request.getRealEstateId(),
                Clock.systemUTC().millis(),
                1,
                JobStatus.ASSIGNED.getValue(),
                request.getStaffId(),
                userInfo.getManagerId());

        recsBusinessService.createAssignJobStaff(entity);

        return "redirect:/manager";
    }

    @GetMapping({ "/register-acc-man" })
    public String registerStaffView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "register";
        model.addAttribute("fullName", name);
        model.addAttribute("currentPage", currentPage);
        return "manager/register-acc-man";
    }

    @GetMapping({ "/history" })
    public String historyView(Model model, @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        String currentPage = "history";

        List<ValidationJobInfo> listingListValidateSuccess = recsBusinessService
                .getListByManagerAndStatus(userInfo.getManagerId(), JobStatus.SUCCESSFUL.getValue());
        List<ValidationJobInfo> listingListValidateFail = recsBusinessService
                .getListByManagerAndStatus(userInfo.getManagerId(), JobStatus.FAIL.getValue());

        List<ValidationJobInfo> allValidatedJobs = new ArrayList<>();
        allValidatedJobs.addAll(listingListValidateSuccess);
        allValidatedJobs.addAll(listingListValidateFail);

        model.addAttribute("fullName", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("listJobAssigned", allValidatedJobs);
        return "manager/history-man";
    }

    @GetMapping({ "/create-staff" })
    public String registerStaff(Model model, @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        String currentPage = "create-staff";
        List<UserInfo> listStaffCreated = accountService.getListStaffByManager(userInfo.getManagerId());
        model.addAttribute("listStaff", listStaffCreated);
        model.addAttribute("fullName", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);

        return "manager/create-acc-staff";
    }

    @PostMapping("/create-staff")
    public String createStaff(
            @ModelAttribute(name = "request") RegisterStaffDTO request,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo,
            Model model
    ) {
        accountService.registerStaff(request, userInfo.getManagerId());


        UserInfo updateUserInfo = accountService.getManagerToUserInfo(userInfo.getManagerId());
        model.addAttribute("LOGIN_USER", updateUserInfo);
        model.addAttribute("fullName", userInfo.getManagerId());
        return "redirect:/manager/create-staff";
    }

}