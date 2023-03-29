package com.weh.community.service;

import com.weh.community.model.Build;

import java.util.List;


public interface IBuildService {
    public int insert(Build build);
    public int update(Build build);
    public int delete(String buildNo);
    public List<Build> findAll();
    public List<Build> findByList(String keywords);
    public Build getById(String buildNo);
    public Build getByBuildName(String buildName);
}
