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

    //按借阅号和读者名查询
    ArrayList<Reader> findSomeReader(Integer reader_id,String reader_name);

    //按读者id查询
    ArrayList<Reader> findIdReader(Integer reader_id);

    //按借阅名查询
    ArrayList<Reader> findNameReader(String reader_name);

    //修改读者信息
    int editReader(Reader reader);

    //验证读者原密码
    Reader queryOldPwd(Integer reader_id,  String oldPwd);

    //修改读者密码
    int editPwd(Integer reader_id,String reader_name, String newPwd);
}
