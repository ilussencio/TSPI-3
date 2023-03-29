package com.iftm.api.atividade02.Controller;

import com.iftm.api.atividade02.model.EmailModel;
import com.iftm.api.atividade02.model.UserModel;
import com.iftm.api.atividade02.services.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/app/v1/email")
public class EmailController {
    @Autowired
    private EmailService emailService;

    @GetMapping
    public List<EmailModel> findAll(){
        return emailService.findAll();
    }

    @GetMapping("/{id}")
    public EmailModel findById(@PathVariable Long id){
        Optional<EmailModel> opt = emailService.findById(id);
        if(opt.isEmpty())
            return null;
        return opt.get();
    }

    @PostMapping
    public EmailModel save(@RequestBody EmailModel email){
        return emailService.save(email);
    }

    @PutMapping
    public EmailModel update(@RequestBody EmailModel email){
        return emailService.update(email);
    }

    @DeleteMapping("/{id}")
    public String delete(@PathVariable Long id){
        return emailService.delete(id);
    }

}
