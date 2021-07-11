package com.home.service;

import com.home.entity.Reader;

import java.util.ArrayList;

public interface ReaderService {
    //注册用户
    int addReader(Reader reader);

    //验证账号是否存在
    Reader queryReader(Integer reader_id,String password);

    //管理员添加读者功能
    int submitAddReader(Reader reader);

    //查询所有读者信息
    ArrayList<Reader> findReader();

    //删除读者
    int loseBook(Integer reader_id);
}
