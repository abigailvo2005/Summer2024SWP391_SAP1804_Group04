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

        /* tạo list mẫu trong controller chứa dữ liệu sample --> load list lên dashboard page bằng mav.addObject() gắn attribute sampleList */
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
    public ModelAndView historyAdmin() {
        ModelAndView mav = new ModelAndView("/admin/history-admin");
        mav.addObject("currentPage", "history");
        return mav;
    }

    @RequestMapping(value = "/tracking", method = RequestMethod.GET)
    public ModelAndView propertyTracking() {
        ModelAndView mav = new ModelAndView("/admin/property-tracking");
        mav.addObject("currentPage", "tracking");
        return mav;
    }

    @RequestMapping(value = "/create-account", method = RequestMethod.GET)
    public ModelAndView createAccount() {
        ModelAndView mav = new ModelAndView("/admin/create-account");
        mav.addObject("currentPage", "create-account");
        return mav;
    }
}
