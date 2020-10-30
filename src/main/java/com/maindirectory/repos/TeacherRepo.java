package com.maindirectory.repos;

import com.maindirectory.entitys.Teacher;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface TeacherRepo extends CrudRepository<Teacher, Long> {
    Teacher findByTeachername(String teachername);
}
