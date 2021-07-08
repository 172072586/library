package com.home.controller;

import com.home.entity.Book;
import com.home.service.BookService;
import com.home.service.CategoryService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
public class bookController {

    @Resource
    private CategoryService categoryService;

    @Resource
    private BookService bookService;

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

    //添加图书类型界面
    @RequestMapping("/addBookType")
    public String addbookType(){
        return "type/addBookType";
    }

    //添加图书类型功能
    @RequestMapping("/addType")
    public ModelAndView addType(String cname){
        ModelAndView mv = new ModelAndView();
        int result = categoryService.addCname(cname);
        if(result != -1){
            mv.addObject("type"," ");
        }
        mv.setViewName("type/addBookType");
        return mv;
    }

    //查询所有图书类别功能     ------------------------先实现图书功能--------------
    @RequestMapping("/queryType")
    public ModelAndView queryType(){
        ModelAndView mv = new ModelAndView();


        return mv;
    }

    //添加图书功能
    @RequestMapping("/submitAddBook")
    public ModelAndView submitAddBook(Book book){
        ModelAndView mv = new ModelAndView();
        int result = bookService.addBook(book);
        mv.addObject("msg","添加成功");
        mv.setViewName("book/addBook");
        return mv;
    }
}
