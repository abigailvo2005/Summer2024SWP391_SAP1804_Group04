package com.recs.controller;

import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.AssignJobRequest;
import com.recs.models.dto.recsbusiness.ValidationJobInfo;
import com.recs.models.entities.account.Account;
import com.recs.models.entities.realestate.RealEstate;
import com.recs.models.entities.recsbusiness.AssignJobStaff;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import java.time.Clock;
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

        List<ValidationJobInfo> validatingJobList = recsBusinessService.
                getListByManagerAndStatus(userInfo.getManagerId(), "validating");

        List<ValidationJobInfo> successJobList = recsBusinessService.
                getListByManagerAndStatus(userInfo.getManagerId(), "success");


        /* List<RealEstate> validatingList = realEstateService.getValidatingListByManager(userInfo.getManagerId()); */
        // Todo() tự nhét
        String currentPage = "dashboard";
        model.addAttribute("name", userInfo.getFullName()); // can get userInfo by using $sessionScope in jsp
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("valList", validatingJobList);
        return "manager/dashboard-man";
    }

    @GetMapping({ "/profile" })
    public String profileView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "profile";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "manager/profile-man";
    }

    @GetMapping({ "/assign-job" })
    public String assignJobView(Authentication authentication, Model model,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        List<RealEstateInfo> reviewingList = realEstateService.getReviewingListByManager(userInfo.getManagerId());
        String name = authentication.getName();
        List<UserInfo> staffList = accountService.getListStaffByManager(userInfo.getManagerId());
        Account account = accountService.getByUserName(name);

        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!Assign Job Controller: " + staffList +"\nManagerID: " + (userInfo.getManagerId()));
        String currentPage = "assign-job";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("reqList", reviewingList);
        model.addAttribute("staffList", staffList);
        return "manager/assign-job";
    }

    @PostMapping("/assign-job")
    public String assignJob(
            @ModelAttribute(name = "request")AssignJobRequest request,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo
            ) {
        AssignJobStaff entity = new AssignJobStaff(
                UUID.randomUUID().toString(),
                request.getRealEstateId(),
                Clock.systemUTC().millis(),
                1,
                "validating",
                request.getStaffId(),
                userInfo.getManagerId()
        );

        recsBusinessService.createAssignJobStaff(entity);

        return "manager/assign-job";
    }

    @GetMapping({ "/register-acc-man" })
    public String registerStaffView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "register";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "manager/register-acc-man";
    }

    @GetMapping({ "/history" })
    public String historyView(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "history";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        return "manager/history-man";
    }

    @GetMapping({ "/register-staff" })
    public String registerStaff(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "register-staff";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);

        /* logic BE update db... */

        return "manager/register-acc-man";
    }

}