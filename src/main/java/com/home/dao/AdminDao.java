package com.home.dao;

import com.home.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {
    //验证管理员是否存在   查询原密码是否正确
    Admin selectAdmin(@Param("name") String name,@Param("password") String password);

    //修改密码
    int updateAdmin(@Param("id")Integer id,@Param("name") String name, @Param("password") String password);
}
