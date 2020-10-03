package com.maindirectory.repos;

import com.maindirectory.entitys.Message;
import org.springframework.data.repository.CrudRepository;

public interface MessageRepo extends CrudRepository<Message, Long> {


}
