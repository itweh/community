package com.weh.community.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.weh.community.model.Build;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;


@Mapper
public interface BuildMapper extends BaseMapper<Build> {
    @Select("select *from `t_build` where build_name  like CONCAT('%',#{keywords},'%') or telephone =#{keywords} or address like CONCAT('%',#{keywords},'%') ")
    List<Build> findByList(@Param("keywords")String keywords);

    @Select("select *from `t_build` where build_name=#{buildName}")
    public Build getByBuildName(String buildName);
}
