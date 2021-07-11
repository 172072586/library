package com.home.service;

import com.home.entity.Book;
import com.home.entity.Category;

import java.util.ArrayList;
import java.util.List;

public interface BookService {
    //添加图书
    int addBook(Book book);

    //查询所有图书
    ArrayList<Book> queryAllBook();

    //修改图书
    int changeBook(Integer book_id,double price,Integer stock);

    //删除图书
    int removeBook(Integer book_id);

    //通过图书名字查询图书
    ArrayList<Book> queryBookName(String book_name);

    //通过作者查询图书
    ArrayList<Book> queryAuthor(String author);

    //通过图书名字和作者查询图书
    List<Book> queryAuthorBookName(String book_name,String author);
}
