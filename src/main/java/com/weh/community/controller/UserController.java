package com.weh.community.controller;

import com.alibaba.fastjson.JSONObject;
import com.weh.community.model.SysUser;
import com.weh.community.model.dto.SysUserAddDTO;
import com.weh.community.model.dto.SysUserUpdateDTO;
import com.weh.community.service.ISysUserService;
import com.weh.community.utils.Constants;
import com.weh.community.utils.Result;
import com.weh.community.utils.SessionUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class UserController {
    @Autowired
    private ISysUserService sysUserService;
    @RequestMapping("/")
    public String doLogin(){
        return "redirect:/homePage";
    }

    @RequestMapping("/homePage")
    public String homePage(){
        return "homePage";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        //返回login页面
        return "login";
    }
    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }
    @RequestMapping(value = "/doLogin",method = RequestMethod.POST)
    @ResponseBody
    public Result<String> doLogin(@RequestBody JSONObject jsonObject, HttpServletRequest req){
        String  username = jsonObject.getString("username");
        String  password = jsonObject.getString("password");
        String  userType = jsonObject.getString("userType");
        SysUser sysUser = sysUserService.getByUserName(username);
//        System.out.println("password=="+password);
        if(null ==sysUser){
            return Result.error(Constants.ERROE_CODE,"请先注册！！");
        }
        if (!userType.equals(sysUser.getUserType())){
            return Result.error(Constants.ERROE_CODE,"用户类型不匹配");
        }else if (sysUser.getPassword().equals(password)){
            req.getSession().setAttribute("sessionUser",sysUser);
            req.getSession().setAttribute("userType",sysUser.getUserType());
            return Result.success(Constants.SUCCESS_CODE,"登录成功！");
        }else {
            return Result.error(Constants.ERROE_CODE,"账号或密码错误，请重新登录");
        }
    }

    //返回后台管理
    @RequestMapping(value = "/index")
    public String indexPage(HttpServletRequest req){
       SysUser  sysUser = SessionUser.getServerUser(req);
       if (null == sysUser){
           return "redirect:/homePage";
       }
        return "index";
    }

    @RequestMapping(value = "/user/delete",method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id") Integer id){
         sysUserService.delete(id);
         log.info("执行删除");
        return "redirect:/user/list";
    }
    @RequestMapping(value = "user/list")
    public String List(@RequestParam(value = "keywords",required = false) String keywords, HttpServletRequest req){
        List<SysUser> userList = new ArrayList<>();
        if (keywords!=null &&!keywords.equals("")){
            userList = sysUserService.findByList(keywords);
        }else {
            userList = sysUserService.findAll();
        }
        req.setAttribute("userList",userList);
        //返回到user目录下的userList页面
        return "/user/userList";
    }
    /**
     * 打开添加页面
     * @return
     */
    @RequestMapping(value = "/openUser")
    public String openUser(){
        return "/user/user_add";
    }


    /**
     * 添加
     * @return
     */
    @RequestMapping(value = "/add/user",method = RequestMethod.POST)
    @ResponseBody
    public Result<String> openUser(@RequestBody SysUserAddDTO sysUserAddDTO, HttpServletRequest req){
        SysUser user =new SysUser();
        String username = sysUserAddDTO.getUsername();
        SysUser u =sysUserService.getByUserName(username);
        if (null != u){
        return Result.error("500","该用户已存在，请勿重新添加!");
        }
        BeanUtils.copyProperties(sysUserAddDTO,user);
        sysUserService.insert(user);
        return Result.success();
    }

    @RequestMapping(value = "/user/register",method = RequestMethod.POST)
    @ResponseBody
    public Result<String> register(@RequestBody SysUserAddDTO sysUserAddDTO){
        SysUser user =new SysUser();
        String username = sysUserAddDTO.getUsername();
        SysUser u =sysUserService.getByUserName(username);
//        该语句设置可以注册管理员
//        if (sysUserAddDTO.getUserType().equals("0")){
//            return    Result.error("500","不可管理员用户");
        if (null != u){
            return Result.error("500","该用户已存在，请勿重新注册!");
        }
        BeanUtils.copyProperties(sysUserAddDTO,user);
        sysUserService.insert(user);
        return Result.success(Constants.SUCCESS_CODE,"注册成功!");
    }

//    打开修改页面
    @RequestMapping(value = "/user/openEdit")
    public String openEdit(@RequestParam("id") Integer id, HttpServletRequest req){
        SysUser sysUser  =  sysUserService.getById(id);
        req.setAttribute("sysUser",sysUser);
        return "/user/user_edit";
    }
    /**
     * 修改用户信息
     * @return
     */
    @RequestMapping(value = "/edit/user")
    @ResponseBody
    public Result<String> editUser(@RequestBody SysUserUpdateDTO sysUserUpdateDTO){
        SysUser user =new SysUser();
        BeanUtils.copyProperties(sysUserUpdateDTO,user);
        sysUserService.update(user);
        return Result.success();
    }



    @RequestMapping("/logout")
    public String logout(HttpServletRequest req){
        HttpSession session =req.getSession();
        if(null!=session){
            //将session设置为失效,解除绑定到它上面的任何对象
            session.invalidate();
        }
        return "homePage";
    }

    /**
     * 修改个人信息
     * @param id
     * @param req
     * @return
     */
    @RequestMapping("/user/openUpdate")
    public String openUpdate(@RequestParam("id")Integer id,HttpServletRequest req){
        SysUser updateUser = sysUserService.getById(id);
        req.setAttribute("updateUser",updateUser);
        return "/user/user_update";
    }

//    @RequestMapping("user/type")
//    public String doSerachUserType(HttpServletRequest req){
//        List<SysUser> UserType = sysUserService.findByType();
//        req.setAttribute("UserType",UserType);
//        return "/build/build_add";
//    }
}
