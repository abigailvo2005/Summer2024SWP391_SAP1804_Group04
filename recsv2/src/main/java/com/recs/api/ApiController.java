package com.recs.api;

import com.recs.models.dto.account.CreateAccountRequestDTO;
import com.recs.models.dto.account.UserInfo;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.dto.recsbusiness.AgencyRequestDTO;
import com.recs.models.dto.recsbusiness.BuyerRequestDTO;
import com.recs.models.dto.recsbusiness.DealAssignMemberDTO;
import com.recs.models.dto.recsbusiness.ValidationJobInfo;
import com.recs.models.entities.account.Account;
import com.recs.services.accountsvc.AccountService;
import com.recs.services.businesssvc.RecsBusinessService;
import com.recs.services.realestaesvc.RealEstateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController()
@RequestMapping("/api")
public class ApiController {

    private AccountService accountService;

    private RealEstateService realEstateService;

    private RecsBusinessService recsBusinessService;

    @Autowired
    public ApiController(
            AccountService accountService,
            RealEstateService realEstateService,
            RecsBusinessService recsBusinessService) {
        this.accountService = accountService;
        this.realEstateService = realEstateService;
        this.recsBusinessService = recsBusinessService;
    }

    @PostMapping("/user/new")
    public String addNewAccount(@RequestBody Account account) {
        accountService.create(account);
        return "check database!!!";
    }

    @GetMapping(path = "/user/{id}", produces = "application/json")
    public ResponseEntity<UserInfo> getUserInfo(@PathVariable(name = "id") String id) {
        UserInfo user = accountService.getUserInfo(Integer.parseInt(id));
        return ResponseEntity.ok(user);
    }

    @GetMapping(path = "/real-estate/{id}", produces = "application/json")
    public ResponseEntity<RealEstateInfo> getRealEstateInfo(@PathVariable(name = "id") String id) {
        return ResponseEntity.ok(realEstateService.getRealEstateInfo(id));
    }

    @GetMapping(path = "/job/validation/{id}", produces = "application/json")
    public ResponseEntity<ValidationJobInfo> getValidationJobInfo(@PathVariable(name = "id") String id) {
        return ResponseEntity.ok(recsBusinessService.getValidationJobInfo(id));
    }

    @GetMapping(path = "/deal/{id}", produces = "application/json")
    public ResponseEntity<DealAssignMemberDTO> getDeal(@PathVariable(name = "id") String id) {
        return ResponseEntity.ok(recsBusinessService.getDealInfo(id));
    }

    @GetMapping(path = "/agency-request/{id}", produces = "application/json")
    public ResponseEntity<AgencyRequestDTO> getAgencyRequest(@PathVariable(name = "id") String id) {
        return ResponseEntity.ok(recsBusinessService.getAgencyRequest(id));
    }

    @PostMapping("/account/create")
    public ResponseEntity<String> createAccount(@RequestBody CreateAccountRequestDTO request) {
        accountService.registerAccount(request);
        return ResponseEntity.ok("check db");
    }

    @GetMapping(value = "/buyer-request/{id}", produces = "application/json")
    public ResponseEntity<BuyerRequestDTO> getBuyerRequest(@PathVariable(name = "id") String id) {
        return ResponseEntity.ok(recsBusinessService.getBuyerRequest(id));
    }

    @PostMapping(value = "password/check", produces = "application/json")
    public ResponseEntity<Map<String, Boolean>> checkPassword(
            @RequestParam String accountId,
            @RequestParam String password) {
        return ResponseEntity.ok(Map.of("result", accountService.checkPassword(accountId, password)));
    }

    @PostMapping(value = "/mail/check")
    public ResponseEntity<Map<String, Boolean>> checkEmail(
            @RequestParam String email) {
        return ResponseEntity.ok(Map.of("isExist", accountService.checkExistedMail(email)));
    }
}
