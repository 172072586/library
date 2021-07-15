package com.home.service.impl;

import com.home.dao.AdminDao;
import com.home.entity.Admin;
import com.home.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminDao adminDao;

    @Override
    public Admin queryAdmin(String name, String password) {
        //验证管理员是否存在
        Admin admin = adminDao.selectAdmin(name, password);
        return admin;
    }

    //查询原密码是否正确
    @Override
    public Admin queryOldPwd(String name,String oldPwd) {
        String password = oldPwd;
        Admin admin = adminDao.selectAdmin(name, password);
        return admin;
    }

    //修改密码
    @Override
    public int editPwd(Integer id,String name, String newPwd) {
        String password = newPwd;
        int result = adminDao.updateAdmin(id,name, password);
        return result;
    }
}
