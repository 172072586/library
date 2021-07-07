package com.home.service;

import com.home.entity.Admin;

public interface AdminService {
    //验证管理员账号是否存在
    Admin queryAdmin(String name,String password);
}
