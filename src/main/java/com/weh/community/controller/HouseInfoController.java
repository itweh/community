package com.weh.community.controller;

import com.weh.community.model.Build;
import com.weh.community.model.HouseInfo;
import com.weh.community.model.dto.HouseAddDTO;
import com.weh.community.model.dto.HouseUpdateDTO;
import com.weh.community.service.IBuildService;
import com.weh.community.service.IHouseInfoService;
import com.weh.community.utils.Constants;
import com.weh.community.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/houseInfo")
@Controller
@Slf4j
public class HouseInfoController {
    @Autowired
    private IHouseInfoService houseInfoService;
    @Autowired
    private IBuildService buildService;
    @RequestMapping("/list")
    public String List(@RequestParam(value = "keywords",required = false) String keywords, HttpServletRequest req){
        List<HouseInfo> houseInfoList =new ArrayList<>();
        if (keywords!=null &&!keywords.equals("")){
            houseInfoList = houseInfoService.findByList(keywords);
        }else {
            houseInfoList = houseInfoService.findAll();
        }
        req.setAttribute("houseInfoList",houseInfoList);
        return "/houseInfo/houseInfoList";
    }

    @RequestMapping(value = "/openHouseInfo",method = RequestMethod.GET)
    public String openUser(HttpServletRequest req){
        log.info("打开添加页面----");
        List<Build>buildList = buildService.findAll();
        req.setAttribute("buildList",buildList);
        return "houseInfo/houseInfo_add";
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public Result<String> openUser(@RequestBody HouseAddDTO houseAddDTO, HttpServletRequest req){
        HouseInfo houseInfo =new HouseInfo();
        String houseName = houseAddDTO.getHouseName();
        HouseInfo h = houseInfoService.getByHouseName(houseName);
        if (null != h){
            return Result.error(Constants.ERROE_CODE,"该房间已存在，请勿重新添加!");
        }
        BeanUtils.copyProperties(houseAddDTO,houseInfo);
        houseInfo.setCreateTime(new Date());
        houseInfoService.insert(houseInfo);
        log.info("执行添加");
        return Result.success();
    }


    @RequestMapping(value = "/openEdit")
    public String openEdit(@RequestParam("houseNo") String houseNo, HttpServletRequest req){
        log.info("打开修改页面----");
       HouseInfo houseInfo = houseInfoService.getById(houseNo);
        List<Build>buildList = buildService.findAll();
        req.setAttribute("buildList",buildList);
        req.setAttribute("houseInfo",houseInfo);
        return "/houseInfo/houseInfo_edit";
    }


    @RequestMapping(value = "/edit")
    @ResponseBody
    public Result<String> editAnnouncement(@RequestBody HouseUpdateDTO houseUpdateDTO){
        HouseInfo houseInfo =new HouseInfo();
        BeanUtils.copyProperties(houseUpdateDTO,houseInfo);
        log.info("houseInfo=="+houseInfo.toString());
        houseInfoService.update(houseInfo);
        log.info("执行修改");
        return Result.success();
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(@RequestParam(value = "houseNo") String houseNo){
        houseInfoService.delete(houseNo);
        return "redirect:/houseInfo/list";
    }
}
