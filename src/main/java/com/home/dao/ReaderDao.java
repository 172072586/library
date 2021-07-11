package com.home.dao;

import com.home.entity.Reader;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface ReaderDao {
    //注册读者
    int insertReaderDao(Reader reader);

    //验证读者是否存在
    Reader selectReaderDao(@Param("reader_id") Integer reader_id, @Param("password") String password);

    //管理员添加读者功能
    int submitAddReader(Reader reader);

    //查询所有的读者信息
    ArrayList<Reader> selectReader();

    //删除读者
    int deleteBook(Integer reader_id);
}
