package com.weh.community.service;

import com.weh.community.model.Approval;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IApprovalService {
    public int insert(Approval approval);
    public int update(Approval approval);
    public int delete(Integer id);
    List<Approval> getApprovalList();
    List<Approval>getByApprovalList( String keywords);
    List<Approval>getByList( String keywords,HttpServletRequest req);
    List<Approval>findAll( );
    Approval getById(Integer id);
    List<Approval>findAllApplys(HttpServletRequest req);

}
