package com.maindirectory.controllers;

import com.maindirectory.entitys.RatingList;
import com.maindirectory.entitys.Teacher;
import com.maindirectory.entitys.User;
import com.maindirectory.repos.RatingListRepo;
import com.maindirectory.repos.TeacherRepo;
import com.maindirectory.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/teachers")
@PreAuthorize("hasAuthority('USER')")

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

        Iterable<RatingList> ratingsList = ratingListRepo.findByTeacher(teacher);

        int ratCount = 0;
        Double middleDouble = 0.0;
        Double summOfRatings = 0.0;

        for (RatingList rat : ratingsList){
            ratCount += 1;
            summOfRatings += rat.getRating();
        }

        middleDouble = (Double)summOfRatings/ratCount;

        model.addAttribute("middle", middleDouble);
        model.addAttribute("count", ratCount);
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

        if (ratingListRepo.findByAuthorAndTeacher(user, teacher) == null) {

            RatingList ratingList = new RatingList(ratingmessage, ratingInDouble, user, teacher);
            ratingListRepo.save(ratingList);
        }
        return "redirect:/teachers";
    }


}
