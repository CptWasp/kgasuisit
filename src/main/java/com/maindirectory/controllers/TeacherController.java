package com.maindirectory.controllers;

import com.maindirectory.entitys.Teacher;
import com.maindirectory.repos.TeacherRepo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class TeacherController {

    @Autowired
    private TeacherRepo teacherRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/teacher")
    public String showTeacherList(Map<String, Object> model){
        Iterable<Teacher> teachers = teacherRepo.findAll();
        model.put("teachers", teachers);

        return "teachersuploading";
    }


    @PostMapping("/teacher")
    public String uploadTeachersData(@RequestParam String num, Map<String, Object> model){


        System.out.println(num);

        JSONParser parser = new JSONParser();

        try {
            JSONArray a = (JSONArray) parser.parse(new FileReader("./30_01_2021/notesJson"+num+".json"));

            for (Object o : a)
            {
                JSONObject person = (JSONObject) o;

                String name = (String) person.get("name");
                System.out.println(name);

//                String link = (String) person.get("link");
//                System.out.println(link);


                String link = "./photos/" + name+".jpg";
                System.out.println(link);
                File file = new File(link);

                String resultFilename = file.getName();

                file = new File(uploadPath+"/"+resultFilename);







                Teacher teacher = new Teacher(name, resultFilename, 0.0);
                teacherRepo.save(teacher);

            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Iterable<Teacher> teachers = teacherRepo.findAll();
        model.put("teachers", teachers);

        return "teachersuploading";
    }



    @GetMapping("/teacherupdate")
    public String showUpdatableTeacherList(Map<String, Object> model){
        Iterable<Teacher> teachers = teacherRepo.findAll();
        model.put("teachers", teachers);

        return "teachersuploading";
    }


    @PostMapping("/teacherupdate")
    public String updateTeachersData(@RequestParam String num, Map<String, Object> model){

        System.out.println(num);

        JSONParser parser = new JSONParser();

        try {
            JSONArray a = (JSONArray) parser.parse(new FileReader("./jsons/notesJson"+num+".json"));

            for (Object o : a)
            {
                JSONObject person = (JSONObject) o;

                String name = (String) person.get("name");
                System.out.println(name);

                String link = (String) person.get("link");
                System.out.println(link);



                Teacher teacher = teacherRepo.findByTeachername(name);

                teacher.setImglink(link);
                teacherRepo.save(teacher);

            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Iterable<Teacher> teachers = teacherRepo.findAll();
        model.put("teachers", teachers);

        return "teachersuploading";
    }



}
