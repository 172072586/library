package com.home.dao;

import com.home.entity.Reader;
import org.apache.ibatis.annotations.Param;

public interface ReaderDao {
    //注册读者
    int insertReaderDao(Reader reader);

    //验证读者是否存在
    Reader selectReaderDao(@Param("reader_id") String reader_id, @Param("password") String password);

    //管理员添加读者功能
    int submitAddReader(Reader reader);
}
