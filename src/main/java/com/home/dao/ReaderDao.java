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

    //按借阅号和读者名查询
    ArrayList<Reader> selectSomeReader(@Param("reader_id") Integer reader_id,@Param("reader_name") String reader_name);

    //按读者id查询
    ArrayList<Reader> selectIdReader(@Param("reader_id") Integer reader_id);

    //按借阅名查询
    ArrayList<Reader> selectNameReader(@Param("reader_name")String name_id);

    //修改读者
    int updateReader(Reader reader);


}
