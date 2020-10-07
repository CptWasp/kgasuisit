package com.maindirectory.controllers;

import com.maindirectory.entitys.RatingList;
import com.maindirectory.entitys.Teacher;
import com.maindirectory.entitys.User;
import com.maindirectory.repos.RatingListRepo;
import com.maindirectory.repos.TeacherRepo;
import com.maindirectory.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/teachers")
public class ListController {
    @Autowired
    private TeacherRepo teacherRepo;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private RatingListRepo ratingListRepo;

    @GetMapping
    public String showTeachers(Map<String, Object> model) {
        Iterable<Teacher> teachers = teacherRepo.findAll();
        model.put("teachers", teachers);
        return "teachers";
    }

    @GetMapping("{teacher}")
    public String userShownForm(@PathVariable Teacher teacher, Model model){

        model.addAttribute("ratings", ratingListRepo.findByTeacher(teacher));
        model.addAttribute("teacher", teacher);
        return "teacher";
    }



    @PostMapping
    public String teacherSetRating(@AuthenticationPrincipal User user,
                                   @RequestParam("teacherId") Teacher teacher,
                                   @RequestParam String rating, @RequestParam String ratingmessage,
                                   Map<String, Object> model){

        Double ratingInDouble = Double.parseDouble(rating);

        if (ratingListRepo.findByAuthorAndTeacher(user, teacher) == null && ratingInDouble<=5
                && ratingInDouble < 0) {

            RatingList ratingList = new RatingList(ratingmessage, ratingInDouble, user, teacher);
            ratingListRepo.save(ratingList);
        }
        return "redirect:/teachers";
    }


}
