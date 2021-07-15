package com.home.service;

import com.home.entity.LendInfo;

import java.util.ArrayList;

public interface LendService {

    //查询图书
    int submitLendBook(String reader_name ,Integer book_id);

    //查询借阅记录
    ArrayList<LendInfo> queryLendInfo();

    //根据书名和借阅状态查询借阅记录
    ArrayList<LendInfo> findLendInfo(String book_name,String state);

    //根据书名查询借阅记录
    ArrayList<LendInfo> findLendName(String book_name);

    //根据借阅状态查询借阅记录
    ArrayList<LendInfo> findLendState(String state);

    //归还图书
    int backLendInfo(Integer book_id,String reader_name);

    //查询个人借阅记录
    ArrayList<LendInfo> findReaderLendInfo(String reader_name);
}
