package com.weh.community.controller;

import com.alibaba.fastjson.JSONObject;
import com.weh.community.model.Approval;
import com.weh.community.model.SysUser;
import com.weh.community.service.IApprovalService;
import com.weh.community.utils.Constants;
import com.weh.community.utils.Result;
import com.weh.community.utils.SessionUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Slf4j
public class ApprovalController {

    @Autowired
    private IApprovalService approvalService;
    @RequestMapping("/apply/list")
    public String List(@RequestParam(value = "keywords",required = false) String keywords, HttpServletRequest req){
        List<Approval> applyList =new ArrayList<>();
        //管理员查询申请
        if (keywords!=null &&!keywords.equals("")){
            applyList = approvalService.getByList(keywords,req);
        }else {
            applyList = approvalService.findAllApplys(req);
        }
        req.setAttribute("applyList",applyList);
        return "/apply/applyList";
    }
    @RequestMapping("/approval/list")
    public String approvalList(@RequestParam(value = "keywords",required = false) String keywords, HttpServletRequest req){
        List<Approval> approvalList =new ArrayList<>();
        //普通用户查询申请
        if (keywords!=null &&!keywords.equals("")){
            approvalList = approvalService.getByApprovalList(keywords);
        }else {
            approvalList = approvalService.getApprovalList();
        }
        req.setAttribute("approvalList",approvalList);
        return "/approval/approvalList";
    }


    /**
     * 打开申请添加页面
     * @return
     */
    @RequestMapping("/apply/openApply")
    public String openApply(){
        return "/apply/apply_add";
    }

    /**
     * 添加申请
     * @param jsonObject
     * @param req
     * @return
     */
    @RequestMapping("/apply/add")
    @ResponseBody
    public Result<String> apply(@RequestBody JSONObject jsonObject, HttpServletRequest req){
        Approval approval =new Approval();
        //获取字段强转为String类型
        String reason = jsonObject.getString("reason");
        SysUser sysUser = SessionUser.getServerUser(req);
        approval.setApplyUser(sysUser.getUsername());
        approval.setReason(reason);
        approval.setCreateTime(new Date());
        approvalService.insert(approval);
        return Result.success();
    }

    /**
     * 提交申请
     * @param id
     * @return
     */
    @RequestMapping("/apply/submit")
    public String submit(@RequestParam("id") Integer id){
        Approval approval = approvalService.getById(id);
        if (approval.getStatus().intValue() ==0){
            approval.setStatus(1);
        }
        approvalService.update(approval);
        return "redirect:/apply/list";
    }

    @RequestMapping("/apply/openEdit")
    public String openEdit(@RequestParam("id") Integer id,HttpServletRequest req){
        Approval apply = approvalService.getById(id);
        req.setAttribute("apply",apply);
        return "/apply/apply_edit";
    }

    /**
     * 修改申请
     * @param jsonObject
     * @return
     */
    @RequestMapping("/apply/edit")
    @ResponseBody
    public Result<String> updateApply(@RequestBody JSONObject jsonObject){
        Integer id = jsonObject.getIntValue("id");
        String reason = jsonObject.getString("reason");
        Approval approval = approvalService.getById(id);
        approval.setReason(reason);
        //审核中
        if(approval.getStatus().intValue() ==1
                ||approval.getStatus().intValue() ==2
        ){
            return Result.error(Constants.ERROE_CODE,"该状态下，不可修改");
        }
        //审核完毕
        if (approval.getStatus().intValue()==3){
            approval.setStatus(1);
        }
        approvalService.update(approval);
        return Result.success(Constants.SUCCESS_CODE,"修改成功!");
    }

    /**
     * 打开审核页面
     * @param id
     * @param req
     * @return
     */
    @RequestMapping("/approval/openApproval")
    public String openApproval(@RequestParam("id")Integer id,HttpServletRequest req){
        Approval approval = approvalService.getById(id);
        req.setAttribute("approval",approval);
        return "/approval/approval";
    }
    /**
     * 管理员审核申请
     * @param jsonObject
     * @param req
     * @return
     */
    @RequestMapping("/approval/update")
    @ResponseBody
    public Result<String> updateApproval(@RequestBody JSONObject jsonObject,HttpServletRequest req){
        SysUser sysUser = SessionUser.getServerUser(req);
        Integer id = jsonObject.getIntValue("id");
        Integer status = jsonObject.getInteger("status");
        String approvalReason = jsonObject.getString("approvalReason");
        Approval approval = approvalService.getById(id);
        approval.setApprovalUser(sysUser.getUsername());
        approval.setStatus(status);
        approval.setApprovalTime(new Date());
        approval.setApprovalReason(approvalReason);
        approvalService.update(approval);
        return Result.success(Constants.SUCCESS_CODE,"审核成功!");
    }

    @RequestMapping("/apply/delete")
    public String deleteApply(@RequestParam("id") Integer id){
        Approval approval = approvalService.getById(id);
        System.out.println(approval.getStatus().intValue());
            approvalService.delete(id);
        return "redirect:/apply/list";
    }
   /* @RequestMapping("/apply/edit")
    @ResponseBody
    public Result<String> openEdit(@RequestBody JSONObject jsonObject){
        Integer id = jsonObject.getIntValue("id");
        String reason =jsonObject.getString("reason");
        Approval apply = approvalService.getById(id);
        apply.setReason(reason);
        approvalService.update(apply);
        return Result.success(Constants.SUCCESS_CODE,"修改成功!");
    }*/

}
