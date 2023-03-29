package com.weh.community.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.weh.community.model.Approval;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ApprovalMapper extends BaseMapper<Approval> {
    /**
     * 获取审核信息
     * @return
     */
    @Select("select *from t_approval where status =1")
    List<Approval>getApprovalList();
    @Select("select *from t_approval where status =1 and (reason like CONCAT('%',#{keywords},'%') or  approval_reason like CONCAT('%',#{keywords},'%')  or apply_user =#{keywords}   or approval_user =#{keywords} )")
    List<Approval>getByApprovalList(@Param("keywords") String keywords);
    @Select("select * from t_approval where apply_user =#{applyUser} and  (reason like CONCAT('%',#{keywords},'%') or  approval_reason like CONCAT('%',#{keywords},'%')  or apply_user =#{keywords}   or approval_user =#{keywords})   ")
    List<Approval>getByList( @Param("keywords") String keywords,@Param("applyUser")String applyUser );
    @Select("select *from t_approval where  apply_user =#{applyUser}")
    List<Approval>findAllApplys(@Param("applyUser") String applyUser);
}
