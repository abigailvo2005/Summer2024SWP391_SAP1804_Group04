package com.recs.controller;

import com.recs.models.dto.account.MemberDTO;
import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.AgencyRequestCreateDTO;
import com.recs.models.dto.recsbusiness.AgencyRequestDTO;
import com.recs.models.dto.recsbusiness.AssignJobRequest;
import com.recs.models.dto.recsbusiness.AssignDealRequest;
import com.recs.models.dto.recsbusiness.DealAssignMemberDTO;
import com.recs.models.entities.account.Account;
import com.recs.models.entities.account.Agency;
import com.recs.models.entities.recsbusiness.AgencyRequest;
import com.recs.models.entities.recsbusiness.AssignJobStaff;
import com.recs.models.entities.recsbusiness.DealAssignMember;
import com.recs.models.enums.AgencyRequestStatus;
import com.recs.models.enums.DealAssignMemberStatus;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.time.Clock;
import java.util.List;
import java.util.UUID;

@Controller
@PreAuthorize("hasRole('ROLE_AGENCY')")
@RequestMapping("/agency")
@SessionAttributes(names = "LOGIN_USER")
public class AgencyController {

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

        List<AgencyRequestDTO> requestList = recsBusinessService.getDashBoardAgencyRequest(userInfo.getAgencyId());

        List<DealAssignMemberDTO> dealList = recsBusinessService.getAgencyDashboardDeal(userInfo.getAgencyId());

        // TODO() tự nhét vào
        String currentPage = "dashboard";
        model.addAttribute("name", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("handleList", requestList);
        model.addAttribute("dealList", dealList);
        return "agency/dashboard-agency";
    }

    /* FOR VIEW TEST ONLY - DELETE WHEN HAVE AGENCY CONTROLLER */
    @GetMapping({ "/marketplace" })
    public String marketplaceView(Model model, @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {

        List<RealEstateInfo> listings = realEstateService.getListing(userInfo.getAgencyId());

        String currentPage = "marketplace";
        model.addAttribute("name", userInfo.getFullName());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("propList", listings);
        model.addAttribute("agency", userInfo);
        return "agency/marketplace";
    }

    @GetMapping({ "/create-mem" })
    public String registerStaff(Model model, Authentication authentication) {
        String name = authentication.getName();
        Account account = accountService.getByUserName(name);
        String currentPage = "create-mem";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);

        return "agency/create-acc-mem";
    }

    @GetMapping({ "/assign-deal" })
    public String assignDealView(Authentication authentication, Model model,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        String name = authentication.getName();

        List<AgencyRequestDTO> handledList = recsBusinessService.getDashBoardAgencyRequest(userInfo.getAgencyId())
                .stream()
                .filter(row -> AgencyRequestStatus.ACCEPTED.getValue().equals(row.getStatus()))
                .toList();

        List<MemberDTO> members = accountService.getMembersByAgency(userInfo.getAgencyId());

        String currentPage = "assign-deal";
        model.addAttribute("name", name);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("handledList", handledList);
        model.addAttribute("memberList", members);
        return "agency/assign-deal";
    }

    @PostMapping("/agency-request")
    public String createAgencyRequest(
            @ModelAttribute(name = "request") AgencyRequestCreateDTO request,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        recsBusinessService.createAgencyRequest(request, userInfo.getAccountId());
        return "redirect:/agency/marketplace";
    }

    /*  */ /*
            * @PostMapping("/assign-deal")
            * public String createDeal(
            * 
            * @RequestBody String memberId,
            * 
            * @RequestBody String realEstateId,
            * 
            * @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
            * System.out.println("RealEstateID at controller: " + realEstateId);
            * System.out.println("MemberID at controller: " + memberId);
            * recsBusinessService.createDeal(realEstateId, memberId,
            * userInfo.getAgencyId());
            * return "redirect:/agency";
            * }
            */

    @PostMapping("/assign-deal")
    public String createDeal(
            @ModelAttribute(name = "request") AssignDealRequest request,
            @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
        System.out.println("RealEstateID at controller: " + request.getRealEstateId());
        System.out.println("MemberID at controller: " + request.getMemberId());
        recsBusinessService.createDeal(request.getRealEstateId(), request.getMemberId(), userInfo.getAgencyId());
        return "redirect:/agency";
    }
    /*
     * @PostMapping("/assign-deal")
     * public String assignDeal(
     * 
     * @ModelAttribute(name = "request") AssignDealRequest request,
     * 
     * @ModelAttribute(name = "LOGIN_USER") UserInfo userInfo) {
     * System.out.println(request);
     * DealAssignMember entity = new DealAssignMember(
     * UUID.randomUUID().toString(),
     * Clock.systemUTC().millis(),
     * 1,
     * DealAssignMemberStatus.ASSIGNED.getValue(),
     * userInfo.getAgencyId(),
     * request.getMemberId(),
     * request.getRealEstateId());
     * 
     * recsBusinessService.createAssignJobStaff(entity);
     * 
     * return "redirect:/manager";
     * }
     */
}
