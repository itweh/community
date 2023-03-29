package com.weh.community.service.impl;

import com.weh.community.dao.SysUserMapper;
import com.weh.community.model.SysUser;
import com.weh.community.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class SysUserServiceImpl implements ISysUserService {
    @Autowired
    private SysUserMapper sysUserMapper;
    @Override
    public int insert(SysUser sysUser) {
        return sysUserMapper.insert(sysUser);
    }

    @Override
    public int update(SysUser sysUser) {
        return sysUserMapper.updateById(sysUser);
    }

    @Override
    public int delete(Integer id) {
        return sysUserMapper.deleteById(id);
    }

    @Override
    public List<SysUser> findAll() {
        Map mp =new HashMap();
        return sysUserMapper.selectByMap(mp);
    }

    @Override
    public List<SysUser> findByList(String keywords) {
        return sysUserMapper.findByList(keywords);
    }

    @Override
    public SysUser getById(Integer id) {
        return sysUserMapper.selectById(id);
    }

    @Override
    public SysUser getByUserName(String username) {
        return sysUserMapper.getByUserName(username);
    }

    @Override
    public List<SysUser> findByType() {
        return sysUserMapper.findByType();
    }
}
