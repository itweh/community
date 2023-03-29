package com.weh.community.utils;

import com.weh.community.model.SysUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class SessionUser {
    public static SysUser getServerUser(HttpServletRequest req){
        HttpSession session = req.getSession();
       SysUser sysUser = (SysUser) session.getAttribute("sessionUser");
       if (null == sysUser){
           return  null;
       }
       return  sysUser;
    }
}
