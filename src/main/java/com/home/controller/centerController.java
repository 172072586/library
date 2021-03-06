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

    //修改密码页面
    @RequestMapping("/toAlterPwd")
    public ModelAndView toAlterPwd(Integer id){
        ModelAndView mv = new ModelAndView();
        mv.addObject("id",id);
        mv.setViewName("alterPwd");
        return mv;
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
            //System.out.println(admin);
            if(admin != null){
                session.setAttribute("admin",admin);
                mv.setViewName("index");
                return mv;
            }
        }else if(power == 1){//读者账号
            //验证账号是否存在
            Integer reader_id = Integer.valueOf(name);
            Reader reader = readerService.queryReader(reader_id, password);
            //System.out.println(reader);
            if(reader != null){
                session.setAttribute("reader",reader);
                mv.setViewName("index");
                return mv;
            }
        }
        //账号异常 暂时返回空字符串  new throw loginException
        session.setAttribute("error"," ");
        mv.setViewName("login");
        return mv;
    }

    //退出系统
    @RequestMapping("/logout")
    public ModelAndView toLogout(HttpSession session){
        session.removeAttribute("admin");
        session.removeAttribute("reader");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        return mv;
    }

    //修改读者密码
    @RequestMapping("/alterReaderPwd")
    public ModelAndView alterReaderPwd(Integer reader_id,String reader_name,String oldPwd,String newPwd){
        System.out.println(reader_id+"----"+reader_name+"-----"+oldPwd+"----"+newPwd);
        ModelAndView mv = new ModelAndView();
        //1.查询原密码是否正确
        Reader reader = readerService.queryOldPwd(reader_id,oldPwd);
        System.out.println(reader);
        if(reader != null){ //验证通过  可以修改密码
            //2.修改密码
            int result = readerService.editPwd(reader_id,reader_name, newPwd);
            if(result == 1){
                mv.addObject("msg","修改成功");
            }else{
                mv.addObject("msg","修改失败");
            }
        }
        mv.setViewName("alterPwd");
        return mv;
    }

    //修改管理员密码
    @RequestMapping("/alterAdminPwd")
    public ModelAndView alterAdminPwd(String name,String oldPwd,String newPwd){
        ModelAndView mv = new ModelAndView();
        //1.查询原密码是否正确
        Admin admin = adminService.queryOldPwd(name, oldPwd);
        if(admin != null){ //验证通过  可以修改密码
            //2.修改密码
            Integer id = admin.getId();
            int result = adminService.editPwd(id, name, newPwd);
            if(result == 1){
                mv.addObject("msg","修改成功");
            }else{
                mv.addObject("msg","修改失败");
            }
        }
        mv.setViewName("alterPwd");
        return mv;
    }


}
