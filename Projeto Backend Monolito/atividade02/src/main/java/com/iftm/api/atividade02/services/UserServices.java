package com.iftm.api.atividade02.services;

import com.iftm.api.atividade02.model.UserModel;
import com.iftm.api.atividade02.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServices {
    @Autowired
    private UserRepository userRepository;

    public List<UserModel> findAll() {
        return userRepository.findAll();
    }
    public List<UserModel> findByLastName(String lastName) {
        return userRepository.getByLastName(lastName);
    }

    public Optional<UserModel> findById(Long id) {
        return userRepository.findById(id);
    }

    public UserModel save(UserModel user) {
        if(userRepository.getByFirstName(user.getFirstName()) == null)
            return userRepository.save(user);

        return null;
    }

    public UserModel update(UserModel user) {
        var dbUser = userRepository.findById(user.getId());
        if(dbUser.isPresent())
            return userRepository.save(user);
        return null;
    }

    public String delete(Long id) {
        var dbUser = userRepository.findById(id);
        if(dbUser.isPresent()){
            userRepository.deleteById(id);
            return "User deleted";
        }
        return "User not found";
    }
}
