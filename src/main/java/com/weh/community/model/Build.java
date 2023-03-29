package com.weh.community.model;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;


@Data
@TableName(value = "t_build")
public class Build implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.ASSIGN_UUID)
    private String buildNo;
    private String buildName;
    private String address;
    private String responsiblePerson;
    private String telephone;
    private Date createTime;
}
