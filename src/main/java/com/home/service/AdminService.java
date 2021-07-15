package com.home.service;

import com.home.entity.Admin;

public interface AdminService {
    //验证管理员账号是否存在
    Admin queryAdmin(String name,String password);

    //查询原密码是否正确
    Admin queryOldPwd(String name,String oldPwd);

    //修改密码
    int editPwd(Integer id,String name,String newPwd);

}
