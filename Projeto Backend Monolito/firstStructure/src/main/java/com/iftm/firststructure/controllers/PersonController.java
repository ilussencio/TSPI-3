package com.iftm.firststructure.controllers;

import com.iftm.firststructure.models.Person;
import com.iftm.firststructure.services.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("api")
public class PersonController {
    @Autowired
    private PersonService service;
    //CRUD
    // Read - http get
    @GetMapping("persons")
    public List<Person> findAll(){
        return service.findAll();
    }

    @GetMapping("person/{id}")
    public Person findById(@PathVariable Long id){
        Optional<Person> opt = service.findById(id);
        if(opt.isEmpty()){
            return null;
        }
        return opt.get();
    }
    // Create - http post
    @PostMapping("person")
    public Person save(@RequestBody Person person){
        return service.save(person);
    }
    // Update - http put
    @PutMapping("person")
    public Person update(@RequestBody Person person){
        return service.update(person);
    }
    // Delete - http delete
    @DeleteMapping("person/{id}")
    public String delete(@PathVariable Long id){
        return service.delete(id);
    }


}
