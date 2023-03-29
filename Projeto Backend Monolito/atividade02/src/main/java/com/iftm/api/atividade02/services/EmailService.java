package com.iftm.api.atividade02.services;

import com.iftm.api.atividade02.model.EmailModel;
import com.iftm.api.atividade02.model.UserModel;
import com.iftm.api.atividade02.repositories.EmailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmailService {

    @Autowired
    private EmailRepository repository;

    public List<EmailModel> findAll(){
        return repository.findAll();
    }

    public Optional<EmailModel> findById(Long id){
        return repository.findById(id);
    }

    public EmailModel save(EmailModel email){
        if(!email.getFrom().isEmpty() && !email.getFrom().isBlank()){
            return repository.save(email);
        }
        return null;
    }

    public EmailModel update(EmailModel emailModel){
        var dbEmail = repository.findById(emailModel.getId());
        if(dbEmail.isPresent())
            return repository.save(emailModel);
        return null;
    }

    public String delete(Long id){
        var dbEmail = repository.findById(id);
        if(dbEmail.isPresent()){
            repository.deleteById(id);
            return "Email deleted";
        }
        return "Email not found";
    }
}
