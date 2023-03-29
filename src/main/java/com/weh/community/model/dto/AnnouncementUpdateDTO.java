package com.weh.community.model.dto;

import lombok.Data;

@Data
public class AnnouncementUpdateDTO {
    private Integer announcementId;
    private String title;
    private String content;
}
