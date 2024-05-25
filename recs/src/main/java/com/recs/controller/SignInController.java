package com.recs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "controllerSignIn")
public class SignInController {
    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    public ModelAndView homePage(@RequestParam("username") String uname) {
        ModelAndView mav = null;
        if (uname.equalsIgnoreCase("man")) {
            mav = new ModelAndView("/manager/dashboard-man");
        } else if (uname.equalsIgnoreCase("admin")) {
            mav = new ModelAndView("/admin/dashboard-admin");
        } else if (uname.equalsIgnoreCase("seller")) {
            mav = new ModelAndView("/seller/dashboard-seller");
        } else {
            mav = new ModelAndView("/seller/dashboard-seller");
        }

        mav.addObject("currentPage", "dashboard");
        mav.addObject("username", "user");
        return mav;
    }

    @RequestMapping(value = "/dashboard-seller", method = RequestMethod.GET)
    public ModelAndView innerDashboard() {
        ModelAndView mav = new ModelAndView("/seller/dashboard-seller");
<<<<<<< HEAD
        mav.addObject("currentPage", "/dashboard");
=======
        mav.addObject("currentPage", "dashboard");
>>>>>>> a332012 (Fix)
        mav.addObject("username", "user");
        return mav;
    }

<<<<<<< HEAD
    @RequestMapping(value = "/profil-seller", method = RequestMethod.GET)
    public ModelAndView viewProfile() {
        ModelAndView mav = new ModelAndView("/profile-seller");
=======
    @RequestMapping(value = "/profile-seller", method = RequestMethod.GET)
    public ModelAndView viewProfile() {
        ModelAndView mav = new ModelAndView("/seller/profile-seller");
>>>>>>> a332012 (Fix)
        mav.addObject("currentPage", "profile");
        return mav;
    }

    @RequestMapping(value = "/createProperty", method = RequestMethod.GET)
    public ModelAndView createProperty() {
        ModelAndView mav = new ModelAndView("/seller/create-property");
        mav.addObject("currentPage", "createProperty");
        return mav;
    }

    @RequestMapping(value = "/history-seller", method = RequestMethod.GET)
    public ModelAndView historySeller() {
        ModelAndView mav = new ModelAndView("/seller/history-seller");
        mav.addObject("currentPage", "history");
        return mav;
    }
}
