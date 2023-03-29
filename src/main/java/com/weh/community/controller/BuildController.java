package com.weh.community.controller;

import com.weh.community.model.Build;
import com.weh.community.model.SysUser;
import com.weh.community.model.dto.BuildAddDTO;
import com.weh.community.model.dto.BuildUpdateDTO;
import com.weh.community.service.IBuildService;
import com.weh.community.service.IHouseInfoService;
import com.weh.community.service.ISysUserService;
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

@RequestMapping("/build")
@Controller
@Slf4j
public class BuildController {
    @Autowired
    private IBuildService buildService;
    @Autowired
    private ISysUserService sysUserService;
    @Autowired
    private IHouseInfoService houseInfoService;
    @RequestMapping("/list")
    public String List(@RequestParam(value = "keywords",required = false) String keywords, HttpServletRequest req){
        List<Build> buildList = new ArrayList<>();
        if (keywords!=null &&!keywords.equals("")){
            buildList = buildService.findByList(keywords);
        }else {
            buildList = buildService.findAll();
        }
        req.setAttribute("buildList",buildList);
        return "/build/buildList";
    }

    @RequestMapping(value = "/openBuild",method = RequestMethod.GET)
    public String openUser(HttpServletRequest req){
        log.info("打开添加页面");
        List<SysUser> UserTypeList = sysUserService.findByType();
        req.setAttribute("UserTypeList",UserTypeList);
//        System.out.println(UserTypeList);
        return "build/build_add";
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public Result<String> openUser(@RequestBody BuildAddDTO buildAddDTO, HttpServletRequest req){
        log.info("执行添加");
        Build build =new Build();
        String buildName = buildAddDTO.getBuildName();
        Build b = buildService.getByBuildName(buildName);
        if (null != b){
            return Result.error(Constants.ERROE_CODE,"该楼栋已存在，请勿重新添加!");
        }
        BeanUtils.copyProperties(buildAddDTO,build);
        build.setCreateTime(new Date());
        buildService.insert(build);
        return Result.success();
    }

    @RequestMapping(value = "/openEdit")
    public String openEdit(@RequestParam("buildNo") String buildNo, HttpServletRequest req){
        log.info("打开修改页面");
        Build build  =  buildService.getById(buildNo);
//        System.out.println(build);
        req.setAttribute("build",build);
        return "/build/build_edit";
    }

    @RequestMapping(value = "/edit")
    @ResponseBody
    public Result<String> editAnnouncement(@RequestBody BuildUpdateDTO buildUpdateDTO){
        log.info("执行修改");
        Build build =new Build();
        BeanUtils.copyProperties(buildUpdateDTO,build);
        log.info("build=="+build.toString());
        buildService.update(build);
        return Result.success();
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(@RequestParam(value = "buildNo") String buildNo){
        buildService.delete(buildNo);
        return "redirect:/build/list";
    }
}
