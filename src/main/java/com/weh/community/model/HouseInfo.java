package com.weh.community.model;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;

@Data
public class HouseInfo implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.ASSIGN_UUID)
    private String houseNo;
    private String userName;
    private Integer liveNum;
    private String property;
    private String register;
    private Build build;
    private String buildNo;
    private Date createTime;
    private String houseName;
}
