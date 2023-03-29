package com.weh.community.model;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;

@Data
public class BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    //创建时间
    private Date createTime;
    //操作人
    private String operatorUser;

}
