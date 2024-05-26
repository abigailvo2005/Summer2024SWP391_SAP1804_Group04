package com.recs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "ControllerLogout")
public class LogoutController {
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView signinPage() {
        ModelAndView mav = new ModelAndView("sign-in");
        return mav;
    }   
}