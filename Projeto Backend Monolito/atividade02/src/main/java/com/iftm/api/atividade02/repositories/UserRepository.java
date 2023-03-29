package com.iftm.api.atividade02.repositories;

import com.iftm.api.atividade02.model.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<UserModel, Long> {
    UserModel getByFirstName(String firstName);
    List<UserModel> getByLastName(String lastName);
}
