package com.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class lendController {
    //借阅管理页面(管理员)
    @RequestMapping("listDisBackAdmin")
    public String listDisBackAdmin(){
        return "listDisBackAdmin";
    }

    //借阅记录页面(读者)
    @RequestMapping("listDisBack")
    public String listDisBack(){
        return "listDisBack";
    }

}
