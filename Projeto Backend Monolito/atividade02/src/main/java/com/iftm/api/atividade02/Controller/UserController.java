package com.iftm.api.atividade02.Controller;

import com.iftm.api.atividade02.model.UserModel;
import com.iftm.api.atividade02.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/app/v1/user")
public class UserController {
    @Autowired
    private UserServices userServices;

    @GetMapping
    public List<UserModel> findAll(){
        return userServices.findAll();
    }

    @GetMapping("/{id}")
    public UserModel findById(@PathVariable Long id){
        Optional<UserModel> opt = userServices.findById(id);
        if(opt.isEmpty())
            return null;
        return opt.get();
    }

    @GetMapping("/lastname/{lastName}")
    public List<UserModel> findByLastName(@PathVariable String lastName){
        return userServices.findByLastName(lastName);
    }

    @PostMapping
    public UserModel save(@RequestBody UserModel user){
        System.out.println(user);
        return userServices.save(user);
    }

    @PutMapping
    public UserModel update(@RequestBody UserModel user){
        return userServices.update(user);
    }
    @DeleteMapping("/{id}")
    public String delete(@PathVariable Long id){
        return userServices.delete(id);
    }

}
