package com.home.service;

import com.home.entity.Book;
import com.home.entity.Category;

import java.util.ArrayList;

public interface BookService {
    //添加图书
    int addBook(Book book);

    //查询所有图书
    ArrayList<Book> queryAllBook();

    //修改图书
    int changeBook(Integer book_id,double price,Integer stock);

    //删除图书
    int removeBook(Integer book_id);
}
