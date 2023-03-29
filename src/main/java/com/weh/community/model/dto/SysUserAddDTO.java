package com.weh.community.model.dto;

import lombok.Data;
import java.io.Serializable;

@Data
public class SysUserAddDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private String username;    //帐号
    private String password;    //密码
    private String realName;        //姓名
    private String userType;        //姓名
}
