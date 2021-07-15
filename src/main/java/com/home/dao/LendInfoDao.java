package com.home.dao;

import com.home.entity.Book;
import com.home.entity.LendInfo;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface LendInfoDao {

    //通过id获取书名
    ArrayList<Book> lendIdBook(Integer book_id);

    //添加借阅记录
    int insertLendInfoDao(@Param("reader_name") String reader_name, @Param("book_id") Integer book_id, @Param("book_name")String book_name, @Param("lend_date")String lend_date, @Param("state")String state);

    //查询所有借阅记录
    ArrayList<LendInfo> selectLendInfo();

    //根据书名和借阅状态查询借阅记录
    ArrayList<LendInfo> selectInfo(@Param("book_name") String book_name,@Param("state") String state);

    //根据书名查询借阅记录
    ArrayList<LendInfo> selectLendName(@Param("book_name")String book_name);

    //根据借阅状态查询借阅记录
    ArrayList<LendInfo> selectLendState(@Param("state")String state);

    //通过读者和书id查询借阅状态
    LendInfo selectReaderBook(@Param("reader_name") String reader_name,@Param("book_id") Integer book_id);

    //修改借阅状态为：已借阅
    int updateLendInfo(@Param("reader_name") String reader_name, @Param("book_name")String book_name, @Param("lend_date")String lend_date, @Param("state")String state);

    //归还图书
    int updateBackInfo(@Param("book_id") Integer book_id,@Param("reader_name") String reader_name,@Param("back_date")String back_date, @Param("state")String state);

    //查询个人借阅记录
    ArrayList<LendInfo> selectReaderLendInfo(@Param("reader_name") String reader_name);
}
