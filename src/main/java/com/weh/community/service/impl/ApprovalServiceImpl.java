package com.weh.community.service.impl;

import com.weh.community.dao.ApprovalMapper;
import com.weh.community.model.Approval;
import com.weh.community.model.SysUser;
import com.weh.community.service.IApprovalService;
import com.weh.community.utils.SessionUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Service
public class ApprovalServiceImpl implements IApprovalService {
    @Autowired
    private ApprovalMapper approvalMapper;
    @Override
    public int insert(Approval approval) {
        return approvalMapper.insert(approval);
    }

    @Override
    public int update(Approval approval) {
        return approvalMapper.updateById(approval);
    }

    @Override
    public int delete(Integer id) {
        return approvalMapper.deleteById(id);
    }

    @Override
    public List<Approval> getApprovalList() {
        return approvalMapper.getApprovalList();
    }

    @Override
    public List<Approval> getByApprovalList(String keywords) {
        return approvalMapper.getByApprovalList(keywords);
    }

    @Override
    public List<Approval> getByList(String keywords,HttpServletRequest req) {
        SysUser sysUser = SessionUser.getServerUser(req);
        return approvalMapper.getByList(keywords,sysUser.getUsername());
    }

    @Override
    public List<Approval> findAll() {
        return approvalMapper.selectByMap(new HashMap<>());
    }

    @Override
    public Approval getById(Integer id) {
        return approvalMapper.selectById(id);
    }

    @Override
    public List<Approval> findAllApplys( HttpServletRequest req) {
         SysUser sysUser = SessionUser.getServerUser(req);
        return  approvalMapper.findAllApplys(sysUser.getUsername());
    }
}
