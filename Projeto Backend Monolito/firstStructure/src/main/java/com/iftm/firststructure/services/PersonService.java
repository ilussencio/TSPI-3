package com.iftm.firststructure.services;

import com.iftm.firststructure.repositories.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.iftm.firststructure.models.Person;

import java.util.List;
import java.util.Optional;

@Service
public class PersonService {
    @Autowired
    private PersonRepository repository;

    public List<Person> findAll(){
        return repository.findAll();
    }
    public Page<Person> findAllPage(Pageable pageable){
        return repository.findAll(pageable);
    }

    public Optional<Person> findById(Long id){
        return repository.findById(id);
    }

    public Person save(Person person){
        return (!person.getFirstName().isBlank() && !person.getFirstName().isEmpty())? repository.save(person):null;
    }

    public Person update(Person person){
        var dbPerson = repository.findById(person.getId());
        if(dbPerson != null)
            return repository.save(person);
        return null;
    }

    public String delete(Long id){
        var dbPerson = repository.findById(id);
        if(dbPerson != null){
            repository.deleteById(id);
            return "Person Id " +id+ " has be deleted";
        }
        return "Id "+id+" not found!";
    }


}
