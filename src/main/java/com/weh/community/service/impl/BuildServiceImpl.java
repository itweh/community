package com.weh.community.service.impl;

import com.weh.community.dao.BuildMapper;
import com.weh.community.model.Build;
import com.weh.community.service.IBuildService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


@Service
public class BuildServiceImpl implements IBuildService {
    @Autowired
    private BuildMapper buildMapper;
    @Override
    public int insert(Build build) {
        return buildMapper.insert(build);
    }

    @Override
    public int update(Build build) {
        return buildMapper.updateById(build);
    }

    @Override
    public int delete(String buildNo) {
        return buildMapper.deleteById(buildNo);
    }

    @Override
    public List<Build> findAll() {
        return buildMapper.selectByMap(new HashMap<>());
    }

    @Override
    public List<Build> findByList(String keywords) {
        return buildMapper.findByList(keywords);
    }

    @Override
    public Build getById(String buildNo) {
        return (Build) buildMapper.selectById(buildNo);
    }

    @Override
    public Build getByBuildName(String buildName) {
        return buildMapper.getByBuildName(buildName);
    }

}
