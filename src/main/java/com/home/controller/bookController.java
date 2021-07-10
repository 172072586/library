package com.home.controller;

import com.home.entity.Book;
import com.home.entity.Category;
import com.home.service.BookService;
import com.home.service.CategoryService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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

    //修改图书页面
    @RequestMapping("/changeBook")
    public ModelAndView changeBook(Integer book_id){
        ModelAndView mv = new ModelAndView();
        mv.addObject("id",book_id);
        mv.setViewName("book/editBook");
        return mv;
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

    //修改图书类型界面(传入要修改的类型cid)
    @RequestMapping("/editBookType")
    public ModelAndView editbookType(String cid){
        ModelAndView mv = new ModelAndView();
        mv.addObject("cid",cid);
        mv.setViewName("type/editBookType");
        return mv;
    }

    //添加图书类型功能
    @RequestMapping("/addType")
    public ModelAndView addType(String cname){
        ModelAndView mv = new ModelAndView();
        int result = categoryService.addCname(cname);
        if(result != -1){
            mv.addObject("type"," ");
        }else{
            mv.addObject("type","添加失败");
        }
        mv.setViewName("type/addBookType");
        return mv;
    }

    //查询图书类别  返回数据到index页面
    @RequestMapping("/queryBookType")
    @ResponseBody
    public List<Category> queryBookType(){
        List<Category> categories = categoryService.queryType();
        System.out.println(categories);
        if(categories != null){
            return categories;
        }
        return null;//异常类
    }

    //修改图书类别
    @RequestMapping("/editType")
    public ModelAndView editType(Integer cid,String cname){
        System.out.println(cid+"==="+cname);
        ModelAndView mv = new ModelAndView();
        int result = categoryService.editType(cid, cname);
        System.out.println(result);
        if(result != -1){
            mv.addObject("tipsBookType","修改成功");
            mv.setViewName("type/editBookType");
            return mv;
        }else{
            mv.addObject("tipsBookType","修改失败");
        }
        mv.setViewName("type/editBookType");
        return mv;
    }

    //删除图书类别
    @RequestMapping("/removeType")
    public ModelAndView removeType(Integer cid){
        ModelAndView mv = new ModelAndView();
        int result = categoryService.removeType(cid);
        mv.addObject("category",result);
        mv.setViewName("book/bookType");
        return mv;
    }

    //查询所有图书类别功能  返回数据到图书类别页面
    @RequestMapping("/queryType")
    @ResponseBody//相应ajax请求返回json数据
    public List<Category> queryType(){
        List<Category> categories = categoryService.queryType();
        //System.out.println(categories);
        if(categories != null){
            return categories;
        }
        return null;//异常类
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

    //查询所有图书功能
    @RequestMapping("/findAllBook")
    @ResponseBody
    public ArrayList<Book> findAllBook(){
        ArrayList<Book> books = bookService.queryAllBook();
        System.out.println(books);
        if(books != null){
            System.out.println("执行了返回值判断?");
            return books;
        }
        return null;//未查询到图书异常
    }

    //修改图书功能
    @RequestMapping("/submitEditBook")
    public ModelAndView editBook(Integer book_id, double price, Integer stock){
        ModelAndView mv = new ModelAndView();
        int result = bookService.changeBook(book_id,price,stock);
        if(result == 1){
            mv.addObject("msg","修改成功");
        }else{
            mv.addObject("msg","修改失败");
        }
        mv.setViewName("book/editBook");
        return mv;
    }

    //删除图书功能
    @RequestMapping("/removeBook")
    public ModelAndView removeBook(Integer book_id){
        System.out.println(book_id);
        ModelAndView mv = new ModelAndView();
        int result = bookService.removeBook(book_id);

        return null;
    }
}
