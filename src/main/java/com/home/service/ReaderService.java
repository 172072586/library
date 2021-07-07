package com.home.service;

import com.home.entity.Reader;

public interface ReaderService {
    //注册用户
    int addReader(Reader reader);

    //验证账号是否存在
    Reader queryReader(String reader_id,String password);

}
