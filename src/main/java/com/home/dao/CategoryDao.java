package com.home.dao;

import com.home.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;


public interface CategoryDao {
    //增加图书类别
    int insertCname(@Param("cname")String cname);

    //查询所有图书类别
    ArrayList<Category> selectType();

    //修改图书类别
    int updateType(@Param("cid") Integer cid,@Param("cname") String cname);

    //删除类别
    int deleteType(@Param("cid") Integer cid);
}
