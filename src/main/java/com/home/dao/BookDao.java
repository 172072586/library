package com.home.dao;

import com.home.entity.Book;
import com.home.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface BookDao {
    //添加图书
    int insertBook(Book book);

    //查询所有图书
    ArrayList<Book> selectAllBook();

    //修改图书
    int updateBook(@Param("book_id") Integer book_id,@Param("price") double price,@Param("stock") Integer stock);

    //删除图书
    int deleteBook(@Param("book_id") Integer book_id);
}
