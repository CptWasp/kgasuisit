package com.maindirectory.controllers;

import com.maindirectory.entitys.Teacher;
import com.maindirectory.entitys.User;
import com.maindirectory.repos.TeacherRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/teachers")
public class ListController {
    @Autowired
    private TeacherRepo teacherRepo;

    @GetMapping
    public String showTeachers(Map<String, Object> model) {
        Iterable<Teacher> teachers = teacherRepo.findAll();
        model.put("teachers", teachers);
        return "teachers";
    }

    @GetMapping("{teacher}")
    public String userShownForm(@PathVariable Teacher teacher, Model model){

        model.addAttribute("teacher", teacher);

        return "teacher";
    }

}
