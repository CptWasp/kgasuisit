package com.maindirectory.repos;

import com.maindirectory.entitys.Message;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.domain.Pageable;

public interface MessageRepo extends CrudRepository<Message, Long> {

    Page<Message> findAll(Pageable pageable);

//    Поиск по тегам не используется
//    Page<Message> findByTag(String tag, Pageable pageable);

}
