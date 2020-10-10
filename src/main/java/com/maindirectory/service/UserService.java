package com.maindirectory.service;

import com.maindirectory.entitys.Role;
import com.maindirectory.entitys.User;
import com.maindirectory.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private MailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }


    public boolean addingUser(User user){
        User userFromDB = userRepo.findByUsername(user.getUsername());

        if(userFromDB != null){
            return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());


        userRepo.save(user);


        if(!StringUtils.isEmpty(user.getEmail())){
            String message = String.format("Приветствую, %s!\n" +
                    "Добро пожаловать на наш скромный сайт. Для активации перейди по ссылке: \n" +
                    "http://localhost:8080/activate/%s", user.getUsername(), user.getActivationCode());





            mailSender.send(user.getEmail(), "Активация аккаунта", message);
        }



        return true;
    }

    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);

        if(user == null){
            return false;
        }

        user.setActivationCode(null);
        userRepo.save(user);

        return true;
    }
}
