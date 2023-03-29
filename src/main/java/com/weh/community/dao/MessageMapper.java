package com.weh.community.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.weh.community.model.Message;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface MessageMapper extends BaseMapper<Message> {

    @Select("select *from `t_message` where content  like CONCAT('%',#{keywords},'%') or user_name =#{keywords}")
    List<Message> findByList(@Param("keywords")String keywords);

   @Select("select *from t_message")
   @Results(
           {
                   @Result(column ="id" ,property ="id" ),
                   @Result(column = "content",property = "content"),
                   @Result(column = "create_time",property ="createTime" ),
                   @Result(column = "user_name",property ="userName" ),
                   @Result(column = "status",property ="status" ),
                   @Result(
                           property = "replyList",
                           column = "id",
                           javaType = java.util.List.class,
                           many = @Many(select = "com.weh.community.dao.ReplyMapper.getByMesageId")
                   )
           }
   )
    List<Message>findAllList();
    @Select("select *from t_message where id =#{id}")
    @Results(
            {
                    @Result(column ="id" ,property ="id" ),
                    @Result(column = "content",property = "content"),
                    @Result(column = "create_time",property ="createTime" ),
                    @Result(column = "user_name",property ="userName" ),
                    @Result(column = "status",property ="status" ),
                    @Result(
                            property = "replyList",
                            column = "id",
                            javaType = java.util.List.class,
                            many = @Many(select = "com.weh.community.dao.ReplyMapper.getByMesageId")
                    )
            }
    )
   Message findByMessageId(@Param("id") Integer id);


    @Select("select *from t_message where user_name =#{userName}")
    @Results(
            {
                    @Result(column ="id" ,property ="id" ),
                    @Result(column = "content",property = "content"),
                    @Result(column = "create_time",property ="createTime" ),
                    @Result(column = "user_name",property ="userName" ),
                    @Result(column = "status",property ="status" ),
                    @Result(
                            property = "replyList",
                            column = "id",
                            javaType = java.util.List.class,
                            many = @Many(select = "com.weh.community.dao.ReplyMapper.getByMesageId")
                    )
            }
    )
    List<Message> findByUserName(@Param("userName") String userName);

}
