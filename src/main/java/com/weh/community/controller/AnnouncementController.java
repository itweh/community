package com.weh.community.controller;

import com.weh.community.model.Announcement;
import com.weh.community.model.SysUser;
import com.weh.community.model.dto.AnnouncementAddDTO;
import com.weh.community.model.dto.AnnouncementUpdateDTO;
import com.weh.community.service.IAnnouncementService;
import com.weh.community.utils.Constants;
import com.weh.community.utils.Result;
import com.weh.community.utils.SessionUser;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@RequestMapping("/announcement")//注释一个类
@Controller
@Slf4j
public class AnnouncementController {
    @Autowired
    private IAnnouncementService announcementService;

    /**
     * 获取公告列表
     * @param keywords
     * @param req
     * @return
     */
    @RequestMapping("/list")
    public String List(@RequestParam(value = "keywords",required = false) String keywords, HttpServletRequest req){
        List<Announcement> announcementList = new ArrayList<>();
        if (keywords!=null &&!keywords.equals("")){
            announcementList = announcementService.findByList(keywords);
        }else {
            announcementList = announcementService.findAll();
        }
        req.setAttribute("announcementList",announcementList);
        return "/announcement/announcementList";
    }


    /**
     * 首页展示公告
     * @return
     */
    @RequestMapping(value = "/dataList",method = RequestMethod.GET)
    @ResponseBody
    public Result<List<Announcement>> getDataList(){
        List<Announcement> announcementList = announcementService.findAll();
        if (null== announcementList ||announcementList.size()<=0){
            return Result.error(Constants.ERROE_CODE,"查询成功，无数据");
        }
      return   Result.success(announcementList);
    }

    /**
     * 打开添加页面
     * @return
     */
    @RequestMapping(value = "/openAnnouncement",method = RequestMethod.GET)
    public String openUser(){
        log.info("打开添加页面----");
        return "announcement/announcement_add";
    }

    /**
     * 添加公告
     * @return
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Result<String> openUser(@RequestBody AnnouncementAddDTO announcementAddDTO,HttpServletRequest req){
        Announcement announcement =new Announcement();
        String title = announcementAddDTO.getTitle();
        Announcement a =announcementService.getByTitle(title);
        if (null != a){
            return Result.error(Constants.ERROE_CODE,"该公告已存在，请勿重新添加!");
        }
        BeanUtils.copyProperties(announcementAddDTO,announcement);
        announcement.setCreateTime(new Date());
        SysUser sysUser = SessionUser.getServerUser(req);
        if (null !=sysUser){
            announcement.setUserName(sysUser.getRealName());
        }
        announcementService.insert(announcement);
        return Result.success();
    }

    //打开修改页面
    @RequestMapping(value = "/openEdit")
    public String openEdit(@RequestParam("announcementId") Integer announcementId, HttpServletRequest req){
        log.info("打开修改页面----");
        Announcement announcement  =  announcementService.getById(announcementId);
        req.setAttribute("announcement",announcement);
        return "/announcement/announcement_edit";
    }

    /**
     * 更新公告信息
     * @param announcementUpdateDTO
     * @return
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Result<String> editAnnouncement(@RequestBody AnnouncementUpdateDTO announcementUpdateDTO,HttpServletRequest req){
        log.info("执行修改");
        Announcement announcement =new Announcement();
        BeanUtils.copyProperties(announcementUpdateDTO,announcement);
        log.info("user=="+announcement.toString());
        announcementService.update(announcement);
        return Result.success();
    }

    /**
     * 删除公告信息
     * @param announcementId
     * @return
     */
    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(@RequestParam(value = "announcementId") Integer announcementId){
        announcementService.delete(announcementId);
        log.info("id==="+announcementId);
        log.info("执行删除");
        return "redirect:/announcement/list";
    }
}
