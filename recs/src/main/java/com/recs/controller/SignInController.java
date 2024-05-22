package com.recs.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "controllerSignIn")
public class SignInController {
    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    public ModelAndView homePage() {
        ModelAndView mav = new ModelAndView("/seller/dashboard-seller");
        return mav;
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView innerDashboard() {
        ModelAndView mav = new ModelAndView("/seller/dashboard-seller");
        return mav;
    }
}
