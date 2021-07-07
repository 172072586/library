package com.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class bookController {

    //添加图书页面
    @RequestMapping("/addBook")
    public String addBook(){
        return "book/addBook";
    }

    //图书类别页面
    @RequestMapping("/bookType")
    public String bookType(){
        return "book/bookType";
    }

    //图书列表页面
    @RequestMapping("/book")
    public String bookList(){
        return "index";
    }
}
