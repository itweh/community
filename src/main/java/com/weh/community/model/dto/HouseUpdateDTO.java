package com.weh.community.model.dto;

import lombok.Data;
import java.io.Serializable;

@Data
public class HouseUpdateDTO implements Serializable {
    private String houseNo;
    private String userName;
    private Integer liveNum;
    private String property;
    private String register;
    private String buildNo;
    private String houseName;
}
