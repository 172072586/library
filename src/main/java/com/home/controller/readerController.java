package com.home.controller;

import com.home.entity.Reader;
import com.home.service.ReaderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;

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

    //修改读者页面
    @RequestMapping("/changeReader")
    public ModelAndView changeReader(Integer reader_id){
        ModelAndView mv = new ModelAndView();
        mv.addObject("reader_id",reader_id);
        mv.setViewName("reader/changeReader");
        return mv;
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

    //查询所有读者信息
    @RequestMapping("/findAllReader")
    @ResponseBody
    public ArrayList<Reader> queryReader(){
        ArrayList<Reader> reader = readerService.findReader();
        System.out.println(reader);
        return reader;
    }

    //删除读者信息
    @RequestMapping("/removeReader")
    @ResponseBody
    public ModelAndView removeBook(Integer reader_id){
        int result = readerService.loseBook(reader_id);
        System.out.println(result);
        return null;
    }

    //按借阅号和读者名查询
    @RequestMapping("/querySomeReader")
    @ResponseBody
    public ArrayList<Reader> querySomeReader(Integer reader_id,String reader_name){
        System.out.println(reader_name+"接收参数");
        ArrayList<Reader> readers = readerService.findSomeReader(reader_id, reader_name);
        System.out.println(readers);
        return readers;
    }

    //按读者id查询
    @RequestMapping("/queryIdReader")
    @ResponseBody
    public ArrayList<Reader> queryIdReader(Integer reader_id){
        System.out.println(reader_id+"接收参数");
        ArrayList<Reader> readers = readerService.findIdReader(reader_id);
        System.out.println(readers);
        return readers;
    }

    //按借阅名查询
    @RequestMapping("/queryNameReader")
    @ResponseBody
    public ArrayList<Reader> queryNameReader(String reader_name){
        System.out.println(reader_name+"接收参数");
        ArrayList<Reader> readers = readerService.findNameReader(reader_name);
        System.out.println(readers);
        return readers;
    }

    //修改读者信息
    @RequestMapping("/submitEditReader")
    @ResponseBody
    public ModelAndView submitEditReader(Reader reader){
        System.out.println(reader+"接收参数");
        readerService.editReader(reader);
        System.out.println();
        return null;
    }


}
