package com.recs.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "controllerAdmin")
public class AdminController {
    @RequestMapping(value = "/dashboard-admin", method = RequestMethod.GET)
    public ModelAndView innerDashboard() {
        ModelAndView mav = new ModelAndView("/admin/dashboard-admin");
        mav.addObject("currentPage", "dashboard");
        mav.addObject("username", "LongND");
        return mav;
    }

    @RequestMapping(value = "/profile-admin", method = RequestMethod.GET)
    public ModelAndView viewProfile() {
        ModelAndView mav = new ModelAndView("/admin/profile-admin");
        mav.addObject("currentPage", "profile");
        return mav;
    }

    @RequestMapping(value = "/history-admin", method = RequestMethod.GET)
    public ModelAndView historyMan() {
        ModelAndView mav = new ModelAndView("/admin/history-admin");
        mav.addObject("currentPage", "history");
        return mav;
    }

    @RequestMapping(value = "/tracking", method = RequestMethod.GET)
    public ModelAndView historySeller() {
        ModelAndView mav = new ModelAndView("/admin/property-tracking");
        mav.addObject("currentPage", "tracking");
        return mav;
    }
}
