package com.maindirectory.service;

import com.maindirectory.entitys.Message;
import com.maindirectory.entitys.User;
import com.maindirectory.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
    @Autowired
    private MessageRepo messageRepo;

    public Page<Message> messageList(Pageable pageable, String filter){

//        Если бы у нас был поиск по тегу
//        if(filter != null && !filter.isEmpty){
//            page = messageRepo.findByTag(filter, pageable);
//        }else {
//            page = messageRepo.findAll(pageable);
//        }

        return null;
    }

    public Page<Message> messageListForUser(Pageable pageable, User currentUser, User author) {
        return messageRepo.findByUser(pageable, author);
    }
}
