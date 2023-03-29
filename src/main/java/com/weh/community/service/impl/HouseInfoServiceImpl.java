package com.weh.community.service.impl;

import com.weh.community.dao.HouseInfoMapper;
import com.weh.community.model.HouseInfo;
import com.weh.community.service.IHouseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class HouseInfoServiceImpl implements IHouseInfoService {
    @Autowired
    private HouseInfoMapper houseInfoMapper;
    @Override
    public int insert(HouseInfo houseInfo) {
        return houseInfoMapper.insert(houseInfo);
    }

    @Override
    public int update(HouseInfo houseInfo) {
        return houseInfoMapper.updateById(houseInfo);
    }

    @Override
    public int delete(String houseNo) {
        return houseInfoMapper.deleteById(houseNo);
    }

    @Override
    public List<HouseInfo> findAll() {
        return houseInfoMapper.findList();
    }

    @Override
    public List<HouseInfo> findByList(String keywords) {
        return houseInfoMapper.findByList(keywords);
    }

    @Override
    public HouseInfo getById(String houseNo) {
        return houseInfoMapper.selectById(houseNo);
    }

    @Override
    public HouseInfo getByHouseName(String houseName) {
        return houseInfoMapper.getByHouseName(houseName);
    }
}
