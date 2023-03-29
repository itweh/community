package com.weh.community.model;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;
import java.io.Serializable;
import java.util.Date;

@Data
@TableName("t_reply")
public class Reply implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String userName;
    private String replyContent;
    private Date replyTime;
   /* private Message message;*/
    private Integer messageId;
}
