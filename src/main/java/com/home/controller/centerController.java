package com.home.controller;

import com.home.entity.Admin;
import com.home.entity.Reader;
import com.home.service.AdminService;
import com.home.service.ReaderService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


@Controller
public class centerController {
    @Resource
    private ReaderService readerService;
    @Resource
    private AdminService adminService;

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
    public ModelAndView register(Reader reader){
        //调用service处理reader
        int result = readerService.addReader(reader);
        ModelAndView mv = new ModelAndView();
        if(result == 1){
            mv.addObject("msg"," ");
            mv.setViewName("login");
        }else{
            mv.addObject("msg","注册失败，请重新注册");
            mv.setViewName("register");
        }
        return mv;
    }

    //登录系统
    @RequestMapping("/index")
    public ModelAndView toIndex(@Param("name") String name, @Param("password") String password, @Param("access") String access, HttpSession session){
        //判断access是否为读者/管理员
        Integer power = Integer.valueOf(access);
        ModelAndView mv =new ModelAndView();
        if(power == 0){//管理员账号
            //验证账号是否存在
            Admin admin = adminService.queryAdmin(name, password);
            if(admin != null){
                session.setAttribute("admin",admin);
            }
        }else if(power == 1){//读者账号
            //验证账号是否存在
            Reader reader = readerService.queryReader(name, password);
            if(reader != null){
                session.setAttribute("reader",reader);
            }
        }
        mv.setViewName("index");
        return mv;
    }

    //退出系统
    @RequestMapping("logout")
    public ModelAndView toLogout(HttpSession session){
        session.removeAttribute("admin");
        session.removeAttribute("reader");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        return mv;
    }




}
