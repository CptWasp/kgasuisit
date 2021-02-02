package com.maindirectory.repos;

import com.maindirectory.entitys.Message;
import com.maindirectory.entitys.User;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

public interface MessageRepo extends CrudRepository<Message, Long> {

    Page<Message> findAll(Pageable pageable);

    @Query("from Message m where m.author = :author")
    Page<Message> findByUser(Pageable pageable, @Param("author") User author);

//    Поиск по тегам не используется
//    Page<Message> findByTag(String tag, Pageable pageable);

}
