package com.home.service.impl;

import com.home.dao.BookDao;
import com.home.entity.Book;
import com.home.entity.Category;
import com.home.service.BookService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class BookServiceImpl implements BookService {

    @Resource
    private BookDao bookDao;

    //删除图书
    @Override
    public int removeBook(Integer book_id) {
        int result = bookDao.deleteBook(book_id);
        return result;
    }

    //修改图书
    @Override
    public int changeBook(Integer book_id,double price,Integer stock) {
        System.out.println("============"+book_id+"--------"+price+"|||||||||||||||||"+stock);
        int result = bookDao.updateBook(book_id,price,stock);
        return result;
    }

    //查询所有图书
    @Override
    public ArrayList<Book> queryAllBook() {
        ArrayList<Book> books = bookDao.selectAllBook();
        return books;
    }

    //添加图书
    @Override
    public int addBook(Book book) {
        int result = bookDao.insertBook(book);
        return result;
    }


}
