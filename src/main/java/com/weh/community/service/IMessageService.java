package com.weh.community.service;

import com.weh.community.model.Message;

import java.util.List;

public interface IMessageService {
    public List<Message> findByList(String keywords);
    public List<Message> findAll();
    public int insert(Message message);
    Message findByMessageId( Integer id);
    List<Message> findAllList();
    public int delete(Integer id);
    public Message getById(Integer id);
    public int update(Message message);
    List<Message> findByUserName( String userName);
}
