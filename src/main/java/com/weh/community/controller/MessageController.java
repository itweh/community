package com.weh.community.controller;

import com.alibaba.fastjson.JSONObject;
import com.weh.community.model.Message;
import com.weh.community.model.Reply;
import com.weh.community.model.SysUser;
import com.weh.community.service.IMessageService;
import com.weh.community.service.IReplyService;
import com.weh.community.utils.Constants;
import com.weh.community.utils.Result;
import com.weh.community.utils.SessionUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/message")
@Controller
@Slf4j
public class MessageController {

    @Autowired
    private IMessageService messageService;
    @Autowired
    private IReplyService replyService;

    @RequestMapping("/list")
    public String List(@RequestParam(value = "keywords",required = false) String keywords, HttpServletRequest req){
        List<Message> messageList =new ArrayList<>();
        if (keywords!=null &&!keywords.equals("")){
            messageList = messageService.findByList(keywords);
        }else {
            messageList = messageService.findAllList();
        }
        req.setAttribute("messageList",messageList);
        return "/message/messageList";
    }

    @RequestMapping("/openReply")
    public String openReply(@RequestParam("id")Integer id,HttpServletRequest req){
        log.info("打开回复页面");
       Message message = messageService.findByMessageId(id);
//        System.out.println(message);
       req.setAttribute("message",message);
        return "/message/reply";
    }

    @RequestMapping("/reply")
    @ResponseBody
    public Result<String> reply(@RequestBody JSONObject jsonObject,HttpServletRequest req){
        SysUser sysUser  = SessionUser.getServerUser(req);
        Reply reply = new Reply();
        String replyContent = jsonObject.getString("replyContent");
        Integer messageId = jsonObject.getInteger("messageId");
        reply.setReplyContent(replyContent);
        reply.setReplyTime(new Date());
        reply.setMessageId(messageId);
        reply.setUserName(sysUser.getUsername());
        replyService.insert(reply);
        return Result.success(Constants.SUCCESS_CODE,"回复成功!");
    }

    @RequestMapping("/add")
    @ResponseBody
    public Result<String> add(@RequestBody JSONObject jsonObject,HttpServletRequest request){
        String content = jsonObject.getString("content");
        Message message =new Message();
        SysUser sysUser = request.getSession().getAttribute("sessionUser")==null?null:(SysUser)request.getSession().getAttribute("sessionUser");
        if (null == sysUser){
            return  Result.error(Constants.ERROE_CODE,"请先登录!");
        }
        message.setContent(content);
        message.setCreateTime(new Date());
        SysUser user = SessionUser.getServerUser(request);
        message.setUserName(user.getUsername());
        messageService.insert(message);
        return Result.success(Constants.SUCCESS_CODE,"留言成功!");
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id") Integer id){
        messageService.delete(id);
        return "redirect:/message/list";
    }
    @RequestMapping(value = "/updateStatus",method = RequestMethod.GET)
    public String updateStatus(@RequestParam(value = "id") Integer id){
        Message  message =  messageService.getById(id);

        if (message.getStatus().intValue() ==1){
            message.setStatus(2);
        }if (message.getStatus().intValue()==3){
            message.setStatus(3);
        }if (message.getStatus().intValue()==0){
            message.setStatus(1);
        }

        messageService.update(message);
        return "redirect:/message/list";
    }
    @RequestMapping("/getMessage")
    @ResponseBody
    public Result<List<Message>>getByUserName(HttpServletRequest req){
       SysUser sysUser = SessionUser.getServerUser(req);
       if (null ==sysUser){
           return Result.error(Constants.ERROE_CODE,"请先登录!");
       }
       List<Message> messageList =  messageService.findAllList();
       if (null ==messageList || messageList.size()<=0){
           return Result.error(Constants.ERROE_CODE,"查询成功，但无数据!");
       }
       return Result.success(messageList);
    }
}
