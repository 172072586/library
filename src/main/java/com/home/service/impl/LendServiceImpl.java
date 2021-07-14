package com.home.service.impl;

import com.home.dao.LendInfoDao;
import com.home.entity.Book;
import com.home.entity.LendInfo;
import com.home.service.LendService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

@Service
public class LendServiceImpl implements LendService {
    @Resource
    private LendInfoDao lendInfoDao;

    //根据书名和借阅状态查询借阅记录
    @Override
    public ArrayList<LendInfo> findLendInfo(String book_name, String state) {
        ArrayList<LendInfo> lendInfos = lendInfoDao.selectInfo(book_name, state);
        return lendInfos;
    }

    //根据书名查询借阅记录
    @Override
    public ArrayList<LendInfo> findLendName(String book_name) {
        ArrayList<LendInfo> lendInfos = lendInfoDao.selectLendName(book_name);
        return lendInfos;
    }

    //根据借阅状态查询借阅记录
    @Override
    public ArrayList<LendInfo> findLendState(String state) {
        ArrayList<LendInfo> lendInfos = lendInfoDao.selectLendState(state);
        return lendInfos;
    }

    //查询借阅记录
    @Override
    public ArrayList<LendInfo> queryLendInfo() {
        ArrayList<LendInfo> lendInfos = lendInfoDao.selectLendInfo();
        return lendInfos;
    }


    //借阅图书  默认事务异常回滚
    @Override
    public int submitLendBook(String reader_name, Integer book_id) {
        String book_name = "";
        //通过id获取书名
        ArrayList<Book> bookList = lendInfoDao.lendIdBook(book_id);
        book_name = bookList.get(0).getBook_name();

        //获取当前时间
        Date now = new Date();
        //借阅时间   转为需要的****-**-**格式
        String lend_date = new SimpleDateFormat("yyyy-MM-dd").format(now);

        //借阅状态  已借阅  已归还：
        String state = "";

        //通过读者和书id查询借阅状态
        LendInfo lendInfo = lendInfoDao.selectReaderBook(reader_name, book_id);
        if (lendInfo == null) {
            //添加借阅记录
            state = "已借阅";
            int result = lendInfoDao.insertLendInfoDao(reader_name, book_id, book_name, lend_date, state);
            return result;
        } else if (lendInfo.getState() == "已归还") {
            //添加借阅记录
            state = "已借阅";
            int result = lendInfoDao.insertLendInfoDao(reader_name, book_id, book_name, lend_date, state);
            return result;
        }
        return 3;
    }
}