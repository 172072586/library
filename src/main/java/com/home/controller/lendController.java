package com.home.controller;

import com.home.entity.LendInfo;
import com.home.service.LendService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;

@Controller
public class lendController {
    @Resource
    private LendService lendService;

    //借阅管理页面(管理员)
    @RequestMapping("/listDisBackAdmin")
    public String listDisBackAdmin(){
        return "listDisBackAdmin";
    }

    //借阅记录页面(读者)
    @RequestMapping("/listDisBack")
    public String listDisBack(){
        return "listDisBack";
    }

    //借阅图书
    @RequestMapping("/lendBook")
    @ResponseBody
    public String lendBook(@Param("reader_name") String reader_name, @Param("book_id") Integer book_id){
        //借阅图书
        int i = lendService.submitLendBook(reader_name, book_id);
        String result = String.valueOf(i);
        return result;
    }

    //查询借阅记录
    @RequestMapping("/findLendInfo")
    @ResponseBody
    public ArrayList<LendInfo> findLendInfo(){
        ArrayList<LendInfo> lendInfos = lendService.queryLendInfo();
        return lendInfos;
    }

    //通过书名和借阅状态查询借阅记录
    @RequestMapping("/queryLendInfo")
    @ResponseBody
    public ArrayList<LendInfo> queryLendInfo(String book_name,String state){
        ArrayList<LendInfo> lendInfo = lendService.findLendInfo(book_name, state);
        return lendInfo;
    }

    //通过书名查询借阅记录
    @RequestMapping("/queryLendName")
    @ResponseBody
    public ArrayList<LendInfo> queryLendName(String book_name){
        ArrayList<LendInfo> lendInfo = lendService.findLendName(book_name);
        return lendInfo;
    }

    //通过借阅状态查询借阅记录
    @RequestMapping("/queryState")
    @ResponseBody
    public ArrayList<LendInfo> queryState(String state){
        //System.out.println(state);
        ArrayList<LendInfo> lendInfo = lendService.findLendState(state);
        return lendInfo;
    }
}
