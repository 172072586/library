package com.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class readerController {
    //读者页面
    @RequestMapping("readerIndex")
    public String leaderIndex(){
        return "readerIndex";
    }



}
