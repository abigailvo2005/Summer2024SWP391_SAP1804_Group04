package com.recs.controller;

import com.recs.services.accountsvc.AccountService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Set;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class HomeController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/")
    public String home(Authentication authentication) {
        if (authentication != null) {
            if (authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
                return "redirect:/admin";
            }  else if (authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_MANAGER"))) {
                return "redirect:/manager";
            } else if (authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_STAFF"))) {
                return "redirect:/staff";
            } else if (authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_AGENCY"))) {
                return "redirect:/agency";
            }
        }
        return "redirect:/login";
    }
    
    @GetMapping(value = "/login")
    public String login(
            @RequestParam(value = "error", required = false) String error,
            HttpServletRequest request,
            Model model) {
        if (error != null) {
            String errorMessage = (String) request.getSession().getAttribute("LOGIN_ERROR_MESSAGE");
            model.addAttribute("errorMessage", errorMessage);
            request.getSession().removeAttribute("LOGIN_ERROR_MESSAGE");
        }
        return "sign-in";
    }

    @GetMapping("/login/forget")
    public String forgetPasswordView() {
        return "search-username";
    }

    @PostMapping("/login/forget")
    public String forgetPassword(@RequestParam String username, RedirectAttributes redirectAttributes) {
        try {
            accountService.forgetPassword(username);
            redirectAttributes
                    .addFlashAttribute("message", "We have sent a reset password link to your email. Please check.");
        } catch (UsernameNotFoundException e) {
            redirectAttributes
                    .addFlashAttribute("error", "Username not found.");
            return "redirect:/login/forget";
        } catch (Exception e) {
            redirectAttributes
                    .addFlashAttribute("error", "An error occurred while processing your request.");
            return "redirect:/login/forget";
        }

        return "redirect:/login";
    }
    

    @GetMapping("/login/reset")
    public String resetPasswordView(
            @RequestParam String token,
            Model model
    ) {
        model.addAttribute("token", token);
        return "reset-password";
    }

    @PostMapping("/login/reset")
    public String resetPassword(
            @RequestParam String token,
            @RequestParam String newPassword,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        try {
            accountService.resetPassword(token,newPassword);
            redirectAttributes.addFlashAttribute("messageReset", "Password is reset. Please input username and password to login!");
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Account not found. Make sure you access this via link sent from email.");
            model.addAttribute("token", token);
            return "reset-password";
        }
        return "redirect:/login";
    }
}
