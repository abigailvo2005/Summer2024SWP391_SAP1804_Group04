package com.recs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "controllerSignIn")
public class SignInController {
    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    public String homePage(@RequestParam("username") String uname) {
        if (uname.equalsIgnoreCase("admin")) {
            return "redirect:/dashboard-admin";
        } else if (uname.equalsIgnoreCase("seller")) {
            return "redirect:/dashboard-seller";
        } else {
            return "redirect:/dashboard-man";
        }
    }

    @RequestMapping(value = "/dashboard-seller", method = RequestMethod.GET)
    public ModelAndView innerDashboard() {
        ModelAndView mav = new ModelAndView("/seller/dashboard-seller");
        mav.addObject("currentPage", "dashboard");
        mav.addObject("username", "user");
        return mav;
    }

    @RequestMapping(value = "/profile-seller", method = RequestMethod.GET)
    public ModelAndView viewProfile() {
        ModelAndView mav = new ModelAndView("/profile-seller");
        mav.addObject("currentPage", "profile");
        return mav;
    }

    @RequestMapping(value = "/create-property", method = RequestMethod.GET)
    public ModelAndView createProperty() {
        ModelAndView mav = new ModelAndView("/seller/create-property");
        mav.addObject("currentPage", "create-property");
        return mav;
    }

    @RequestMapping(value = "/history-seller", method = RequestMethod.GET)
    public ModelAndView historySeller() {
        ModelAndView mav = new ModelAndView("/seller/history-seller");
        mav.addObject("currentPage", "history");
        return mav;
    }
}
