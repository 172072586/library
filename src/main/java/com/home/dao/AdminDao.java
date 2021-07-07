package com.home.dao;

import com.home.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {
    //验证管理员是否存在
    Admin selectAdmin(@Param("name") String name,@Param("password") String password);
}
