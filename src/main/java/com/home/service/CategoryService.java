package com.home.service;

import com.home.entity.Category;


import java.util.ArrayList;

public interface CategoryService {
    //增加图书类别
    int addCname(String cname);

    //查询所有图书类别
    ArrayList<Category> queryType();

    //修改图书类别
    int editType(Integer cid, String cname);

    //删除类别
    int removeType(Integer cid);
}
