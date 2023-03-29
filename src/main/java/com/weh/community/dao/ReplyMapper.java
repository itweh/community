package com.weh.community.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.weh.community.model.Reply;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;


@Mapper
public interface ReplyMapper extends BaseMapper<Reply> {
    @Select("select *from t_reply where message_id =#{id}")
    public List<Reply>getByMesageId(@Param("id") Integer id);
    @Delete("delete from t_reply where message_id =#{id}")
    public int deleteByMessageId(@Param("id") Integer id);
}
