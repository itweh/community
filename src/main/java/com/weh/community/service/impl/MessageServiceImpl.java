package com.weh.community.service.impl;

import com.weh.community.dao.MessageMapper;
import com.weh.community.dao.ReplyMapper;
import com.weh.community.model.Message;
import com.weh.community.service.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class MessageServiceImpl implements IMessageService {
    @Autowired
    private MessageMapper messageMapper;
    @Autowired
    private ReplyMapper replyMapper;
    @Override
    public List<Message> findByList(String keywords) {
        return messageMapper.findByList(keywords);
    }

    @Override
    public List<Message> findAll() {
        return messageMapper.findAllList();
    }

    @Override
    public int insert(Message message) {
        return messageMapper.insert(message);
    }

    @Override
    public Message findByMessageId(Integer id) {
        return messageMapper.findByMessageId(id);
    }

    @Override
    public List<Message> findAllList() {
        return messageMapper.findAllList();
    }

    @Override
    public int delete(Integer id) {
        replyMapper.deleteByMessageId(id);
        return messageMapper.deleteById(id);
    }

    @Override
    public Message getById(Integer id) {
        return messageMapper.selectById(id);
    }

    @Override
    public int update(Message message) {
        return messageMapper.updateById(message);
    }

    @Override
    public List<Message> findByUserName(String userName) {
        return messageMapper.findByUserName(userName);
    }
}
