package com.home.dao;

import org.apache.ibatis.annotations.Param;

public interface CategoryDao {
    //增加图书类别
    int insertCname(@Param("cname")String cname);
}
