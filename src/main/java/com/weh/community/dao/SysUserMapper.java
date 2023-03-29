package com.weh.community.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.weh.community.model.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {
    @Select("SELECT *  FROM `sys_user` where username = #{username} ")
    SysUser getByUserName(@Param("username") String username);
    @Select("select *from `sys_user` where username  like CONCAT('%', #{keywords},'%') or real_name like CONCAT('%', #{keywords},'%') ")
    List<SysUser>findByList(@Param("keywords")String keywords);
    @Select("select * from `sys_user` where user_type = 0")
    List<SysUser>findByType();
}
