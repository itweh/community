package com.weh.community.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


@Data
@TableName("t_approval")
public class Approval implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String applyUser;
    private String reason;
    private Date createTime;
    private Date approvalTime;
    private Integer status;
    private String approvalReason;
    private String approvalUser;
}
