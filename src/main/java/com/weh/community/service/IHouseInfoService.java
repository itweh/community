package com.weh.community.service;

import com.weh.community.model.HouseInfo;

import java.util.List;

public interface IHouseInfoService {
    public int insert(HouseInfo houseInfo);
    public int update(HouseInfo houseInfo);
    public int delete(String houseNo);
    public List<HouseInfo> findAll();
    public List<HouseInfo> findByList(String keywords);
    public HouseInfo getById(String houseNo);
    public HouseInfo getByHouseName(String houseName);
}
