package com.weh.community.service.impl;

import com.weh.community.dao.AnnouncementMapper;
import com.weh.community.model.Announcement;
import com.weh.community.service.IAnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


@Service
public class AnnouncementServiceImpl implements IAnnouncementService {
    @Autowired
    private AnnouncementMapper announcementMapper;
    @Override
    public int insert(Announcement announcement) {
        return announcementMapper.insert(announcement);
    }

    @Override
    public int update(Announcement announcement) {
        return announcementMapper.updateById(announcement);
    }

    @Override
    public int delete(Integer id) {
        return announcementMapper.deleteById(id);
    }

    @Override
    public List<Announcement> findAll() {
        return announcementMapper.selectByMap(new HashMap<>());
    }

    @Override
    public List<Announcement> findByList(String keywords) {
        return announcementMapper.findByList(keywords);
    }

    @Override
    public Announcement getById(Integer id) {
        return announcementMapper.selectById(id);
    }

    @Override
    public Announcement getByTitle(String title) {
        return announcementMapper.getByTitle(title);
    }
}
