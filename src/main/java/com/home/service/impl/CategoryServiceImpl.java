package com.home.service.impl;

import com.home.dao.CategoryDao;
import com.home.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Resource
    private CategoryDao categoryDao;

    @Override
    public int addCname(String cname) {
        //增加图书类别
        categoryDao.insertCname(cname);
        return 0;
    }
}
