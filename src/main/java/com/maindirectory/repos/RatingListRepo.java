package com.maindirectory.repos;

import com.maindirectory.entitys.RatingList;
import com.maindirectory.entitys.Teacher;
import com.maindirectory.entitys.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RatingListRepo extends CrudRepository<RatingList, Long> {

    List<RatingList> findByTeacher(Teacher teacher);

    RatingList findByAuthorAndTeacher(User author, Teacher teacher);

}
