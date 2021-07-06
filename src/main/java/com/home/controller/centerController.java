package com.home.controller;

import com.home.entity.Reader;
import com.home.service.ReaderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;


@Controller
public class centerController {
    @Resource
    private ReaderService readerService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        //登录页面
        return "login";
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        //注册页面
        return "register";
    }

    //注册读者
    @RequestMapping("/register")
    @ResponseBody
    public ModelAndView register(Reader reader){
        //调用service处理reader
        int result = readerService.addReader(reader);
        return null;
    }

}
