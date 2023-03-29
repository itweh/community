package com.weh.community.model.dto;

import lombok.Data;

@Data
public class BuildUpdateDTO {
    private String buildNo;
    private String buildName;
    private String address;
    private String responsiblePerson;
    private String telephone;
}
