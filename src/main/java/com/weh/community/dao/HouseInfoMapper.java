package com.weh.community.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.weh.community.model.HouseInfo;
import com.weh.community.model.Build;
import org.apache.ibatis.annotations.*;
import java.io.Serializable;
import java.util.List;

@Mapper
public interface HouseInfoMapper extends BaseMapper<HouseInfo> {

    @Select("select *from `house_info` where house_name  like CONCAT('%',#{keywords},'%') or property =#{keywords} or user_name =#{keywords}")
    List<HouseInfo> findByList(@Param("keywords")String keywords);

    @Select("select *from `house_info` where house_name=#{houseName}")
    public HouseInfo getByHouseName(String houseName);

    @Select("select *,t1.create_time h_time  from house_info t1 left join t_build t2 on t1.build_no =t2.build_no")
    @Results({
            @Result(column ="house_no" ,property ="houseNo" ),
            @Result(column = "user_name",property = "userName"),
            @Result(column = "live_num",property ="liveNum" ),
            @Result(column = "property",property ="property" ),
            @Result(column = "register",property ="register" ),
            @Result(column = "h_time",property = "createTime"),
            @Result(column = "house_name",property = "houseName"),
            @Result(
                    property = "build",
                    column = "build_no",
                    javaType = Build.class,
                    one = @One(select = "com.weh.community.dao.BuildMapper.selectById")
            )
    })
    public List<HouseInfo>findList();

    @Override
    @Select("select *from house_info where house_no = #{id}")
    @Results({
            @Result(column ="house_no" ,property ="houseNo" ),
            @Result(column = "user_name",property = "userName"),
            @Result(column = "live_num",property ="liveNum" ),
            @Result(column = "property",property ="property" ),
            @Result(column = "register",property ="register" ),
            @Result(column = "create_time",property = "createTime"),
            @Result(column = "house_name",property = "houseName"),
            @Result(
                    property = "build",
                    column = "build_no",
                    javaType = Build.class,
                    one = @One(select = "com.weh.community.dao.BuildMapper.selectById")
            )
    })
    HouseInfo selectById(Serializable id);

}
