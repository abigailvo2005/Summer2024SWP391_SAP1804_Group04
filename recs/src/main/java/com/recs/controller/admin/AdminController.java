package com.recs.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller(value = "controllerAdmin")
public class AdminController {
    @RequestMapping(value = "/dashboard-admin", method = RequestMethod.GET)
    public ModelAndView innerDashboard() throws JsonProcessingException {
        ModelAndView mav = new ModelAndView("/admin/dashboard-admin");

        // Tạo danh sách các đối tượng RegisterRequest
        List<RegisterRequest> registerRequestList = new ArrayList<>();
        registerRequestList.add(new RegisterRequest(1, "Hoàng Việt Hùng", "Staff", "20/05/2024", "Reviewing"));
        registerRequestList.add(new RegisterRequest(2, "Nguyễn Đình Long", "Member", "21/05/2024", "Approved"));
        registerRequestList.add(new RegisterRequest(3, "Trần Thị Hoa", "Staff", "22/05/2024", "Rejected"));

        // Tạo danh sách các đối tượng User
        List<User> userList = new ArrayList<>();
        userList.add(new User(1, "John Doe", "Admin", "Male", "Active"));
        userList.add(new User(2, "Jane Smith", "Member", "Female", "Inactive"));
        userList.add(new User(3, "Michael Johnson", "Staff", "Male", "Active"));

        // Truyền list of request thành 1 chuỗi JSON để popup parse ra và load list (thêm pom.xml và gradle)
        ObjectMapper mapper = new ObjectMapper();
        String reqListJSON = mapper.writeValueAsString(registerRequestList);

        mav.addObject("reqList", registerRequestList);
        mav.addObject("reqListJson", reqListJSON);
        mav.addObject("userList", userList);
        mav.addObject("currentPage", "dashboard");
        mav.addObject("username", "LongND");
        return mav;
    }

    // Lớp RegisterRequest
    public class RegisterRequest {
        private int id;
        private String name;
        private String role;
        private String dateCreated;
        private String status;

        // Constructor
        public RegisterRequest(int id, String name, String role, String dateCreated, String status) {
            this.id = id;
            this.name = name;
            this.role = role;
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

        public String getRole() {
            return role;
        }

        public void setRole(String role) {
            this.role = role;
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

    public class User {
        private int id;
        private String name;
        private String role;
        private String gender;
        private String status;

        public User(int id, String name, String role, String gender, String status) {
            this.id = id;
            this.name = name;
            this.role = role;
            this.gender = gender;
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

        public String getRole() {
            return role;
        }

        public void setRole(String role) {
            this.role = role;
        }

        public String getGender() {
            return gender;
        }

        public void setGender(String gender) {
            this.gender = gender;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }
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
