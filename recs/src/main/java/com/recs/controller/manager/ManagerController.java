package com.recs.controller.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "controllerManager")
public class ManagerController {
    @RequestMapping(value = "/dashboard-man", method = RequestMethod.GET)
    public ModelAndView innerDashboard() {
        ModelAndView mav = new ModelAndView("/manager/dashboard-man");

        mav.addObject("currentPage", "dashboard");
        mav.addObject("username", "LongND");
        return mav;
    }

    // Lớp RegisterRequest
    public class RegisterRequest {
        private int id;
        private String name;
        private String type;
        private String dateCreated;
        private String status;

        // Constructor
        public RegisterRequest(int id, String name, String type, String dateCreated, String status) {
            this.id = id;
            this.name = name;
            this.type = type;
            this.dateCreated = dateCreated;
            this.status = status;
        }

        // Getters and Setters
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }

        public String getDateCreated() {
            return dateCreated;
        }

        public void setDateCreated(String dateCreated) {
            this.dateCreated = dateCreated;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }
    }

    @RequestMapping(value = "/profile-man", method = RequestMethod.GET)
    public ModelAndView viewProfile() {
        ModelAndView mav = new ModelAndView("/manager/profile-man");
        mav.addObject("currentPage", "profile");
        return mav;
    }

    @RequestMapping(value = "/assign-job", method = RequestMethod.GET)
    public ModelAndView assignJob() {
        ModelAndView mav = new ModelAndView("/manager/assign-job");

        // Tạo danh sách các đối tượng RegisterRequest
        List<RegisterRequest> registerRequestList = new ArrayList<>();
        registerRequestList.add(new RegisterRequest(1, "Hoàng Việt Hùng", "Staff", "20/05/2024", "Reviewing"));
        registerRequestList.add(new RegisterRequest(2, "Nguyễn Đình Long", "Member", "21/05/2024", "Approved"));
        registerRequestList.add(new RegisterRequest(3, "Trần Thị Hoa", "Staff", "22/05/2024", "Rejected"));

        mav.addObject("reqList", registerRequestList);
        mav.addObject("currentPage", "assign-job");
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
