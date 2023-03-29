package com.weh.community.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.weh.community.model.Announcement;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import java.util.List;

@Mapper
public interface AnnouncementMapper extends BaseMapper<Announcement> {
    @Select("select *from `t_announcement` where title =#{keywords} or content =#{keywords}")
    List<Announcement> findByList(@Param("keywords")String keywords);
    @Select("SELECT *  FROM `t_announcement` where title = #{title} ")
    Announcement getByTitle(@Param("title") String title);
}
