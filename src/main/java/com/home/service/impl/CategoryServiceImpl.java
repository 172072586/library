package com.home.service.impl;

import com.home.dao.CategoryDao;
import com.home.entity.Category;
import com.home.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Resource
    private CategoryDao categoryDao;

    @Override
    public int addCname(String cname) {
        //增加图书类别
        int result = categoryDao.insertCname(cname);
        return result;
    }

    //查询所有图书类别
    @Override
    public ArrayList<Category> queryType() {
        ArrayList<Category> categories = categoryDao.selectType();
        return categories;
    }

    //删除类别
    @Override
    public int removeType(Integer cid) {
        int result = categoryDao.deleteType(cid);
        return result;
    }

    //修改图书类别
    @Override
    public int editType(Integer cid, String cname) {
        int result = categoryDao.updateType(cid,cname);
        return result;
    }
}
