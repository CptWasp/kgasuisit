package com.maindirectory.controllers;


import com.maindirectory.entitys.Role;
import com.maindirectory.entitys.User;
import com.maindirectory.repos.UserRepo;
import com.maindirectory.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    private UserService userService;


    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }


    @PostMapping("/registration")
    public String addingUser(User user, Map<String, Object> model){


        if (!userService.addingUser(user)){
            model.put("message", "Пользователь уже существует!");
            return "registration";
        }


        model.put("message", "Пользователь создан");

        return "redirect:/login";
    }


    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code){

        boolean isActivated = userService.activateUser(code);

        if(isActivated){
            model.addAttribute("message", "Аккаунт активирован!");
        }else{
            model.addAttribute("message", "Проблемы с активацией аккаунта");
        }



        return "login";
    }


}
