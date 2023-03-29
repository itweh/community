package com.weh.community.service;

import com.weh.community.model.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ISysUserService {
    public int insert(SysUser sysUser);
    public int update(SysUser sysUser);
    public int delete(Integer id);
    public List<SysUser> findAll();
    public List<SysUser> findByList(String keywords);
    public SysUser getById(@Param("id") Integer id);
    public SysUser getByUserName(@Param("username") String username);
    public List<SysUser> findByType();
}
