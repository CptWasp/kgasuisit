package com.maindirectory.controllers;


import com.maindirectory.entitys.Role;
import com.maindirectory.entitys.User;
import com.maindirectory.entitys.dto.CaptchaResponseDto;
import com.maindirectory.repos.UserRepo;
import com.maindirectory.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    private final static String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private UserService userService;

    @Value("${recaptcha.secret}")
    private String secret;

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }


    @PostMapping("/registration")
    public String addingUser(
            @RequestParam("password2") String passwordConfirmation,
            @RequestParam("g-recaptcha-response") String captchaResponse,
            @Valid User user, BindingResult bindingResult, Model model){

        String url = String.format(CAPTCHA_URL, secret, captchaResponse);
        CaptchaResponseDto response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

        if(!response.isSuccess()){
            model.addAttribute("captchaError", "Заполните каптчу");
        }

        boolean isConfirmationEmpty = StringUtils.isEmpty(passwordConfirmation);
        if(isConfirmationEmpty){
            model.addAttribute("password2Error","Confirmation Пароль не может быть пустым");
        }

        if(user.getPassword() != null && !user.getPassword().equals(passwordConfirmation)){
            model.addAttribute("passwordError", "Пароли отличаются!");
        }

        if(isConfirmationEmpty || bindingResult.hasErrors() || !response.isSuccess()){
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);
            return "registration";
        }


        if (!userService.addingUser(user)){
            model.addAttribute("usernameError", "Пользователь уже существует!");
            return "registration";
        }


        model.addAttribute("message", "Пользователь создан");

        return "redirect:/login";
    }


    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code){

        boolean isActivated = userService.activateUser(code);

        if(isActivated){
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "Аккаунт активирован!");
        }else{
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Проблемы с активацией аккаунта");
        }



        return "login";
    }


}
