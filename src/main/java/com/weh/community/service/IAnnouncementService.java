package com.weh.community.service;

import com.weh.community.model.Announcement;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IAnnouncementService {
    public int insert(Announcement announcement);
    public int update(Announcement announcement);
    public int delete(Integer announcementId);
    public List<Announcement> findAll();
    public List<Announcement> findByList(String keywords);
    public Announcement getById(@Param("id") Integer id);
    public Announcement getByTitle(@Param("title") String title);
}
