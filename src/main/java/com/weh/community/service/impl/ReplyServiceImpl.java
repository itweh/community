package com.weh.community.service.impl;

import com.weh.community.dao.ReplyMapper;
import com.weh.community.model.Reply;
import com.weh.community.service.IReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements IReplyService {
    @Autowired
    private ReplyMapper replyMapper;
    @Override
    public int insert(Reply reply) {
        return replyMapper.insert(reply);
    }
}
