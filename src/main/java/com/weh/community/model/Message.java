package com.weh.community.model;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


@Data
@TableName(value = "t_message")
public class Message implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String content;
    private String  userName;
    private Date createTime;
    private Integer status;
    @TableField(exist = false)
    private List<Reply> replyList;

}
