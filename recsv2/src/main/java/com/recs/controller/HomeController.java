package com.recs.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Set;

@Controller
public class HomeController {

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
    public String SignInView(){
        return "sign-in";
    }

    @GetMapping("/login/forget")
    public String forgetPasswordView() {
        return "home";
    }

    @GetMapping("/login/reset")
    public String resetPasswordView(
            @RequestParam String token,
            Model model
    ) {
        model.addAttribute("token", token);
        return "home";
    }

    @PostMapping("/login/reset")
    public String resetPassword(
            @RequestParam String token,
            @RequestParam String newPassword
    ) {
        return "redirect:/login";
    }
}
