package com.home.controller;

import com.home.entity.Reader;
import com.home.service.ReaderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
public class readerController {

    @Resource
    private ReaderService readerService;

    //读者页面
    @RequestMapping("/readerIndex")
    public String leaderIndex(){
        return "readerIndex";
    }

    //添加读者页面
    @RequestMapping("/addReader")
    public String addReader(){
        return "reader/addReader";
    }

    //管理员添加读者功能
    @RequestMapping("/submitAddReader")
    public ModelAndView submitAddReader(Reader reader){
        ModelAndView mv = new ModelAndView();
        int result = readerService.submitAddReader(reader);
        if(result == 1){
            mv.addObject("msg","添加成功");
        }else{
            mv.addObject("msg","添加失败");
        }
        mv.setViewName("reader/addReader");
        return mv;
    }


}
