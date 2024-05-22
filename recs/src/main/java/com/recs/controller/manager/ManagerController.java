package com.recs.controller.manager;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "controllerManager")
public class ManagerController {
    @RequestMapping(value = "/dashboard-man", method = RequestMethod.GET)
    public ModelAndView innerDashboard() {
        ModelAndView mav = new ModelAndView("/manager/dashboard-manager");
        mav.addObject("currentPage", "dashboard");
        mav.addObject("username", "LongND");
        return mav;
    }

    @RequestMapping(value = "/profile-man", method = RequestMethod.GET)
    public ModelAndView viewProfile() {
        ModelAndView mav = new ModelAndView("/profile-man");
        mav.addObject("currentPage", "profile");
        return mav;
    }

    @RequestMapping(value = "/assign-job", method = RequestMethod.GET)
    public ModelAndView assignJob() {
        ModelAndView mav = new ModelAndView("/manager/assign-job");
        mav.addObject("currentPage", "createProperty");
        return mav;
    }

    @RequestMapping(value = "/history-man", method = RequestMethod.GET)
    public ModelAndView historyMan() {
        ModelAndView mav = new ModelAndView("/manager/history-man");
        mav.addObject("currentPage", "history");
        return mav;
    }

    @RequestMapping(value = "/register-acc-man", method = RequestMethod.GET)
    public ModelAndView registerAccMan() {
        ModelAndView mav = new ModelAndView("/manager/register-acc-man");
        mav.addObject("currentPage", "register");
        return mav;
    }

    @RequestMapping(value = "/requests-man", method = RequestMethod.GET)
    public ModelAndView historySeller() {
        ModelAndView mav = new ModelAndView("/manager/requests-man");
        mav.addObject("currentPage", "requests");
        return mav;
    }
}
