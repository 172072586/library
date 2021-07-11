package com.home.dao;

import com.home.entity.Book;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface BookDao {
    //添加图书
    int insertBook(Book book);

    //查询所有图书
    ArrayList<Book> selectAllBook();

    //修改图书
    int updateBook(@Param("book_id") Integer book_id,@Param("price") double price,@Param("stock") Integer stock);

    //删除图书
    int deleteBook(@Param("book_id") Integer book_id);

    //通过图书名字查询图书
    ArrayList<Book> selectBookName(@Param("book_name") String book_name);

    //通过作者查询图书
    ArrayList<Book> selectAuthor(String author);

    //通过图书名字和作者查询图书
    List<Book> selectAuthorBookName(@Param("book_name")String book_name,@Param("author")String author);
}
