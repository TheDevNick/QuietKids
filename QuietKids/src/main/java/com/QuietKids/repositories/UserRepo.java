package com.QuietKids.repositories;

import org.springframework.data.repository.CrudRepository;

import com.QuietKids.models.User;

public interface UserRepo extends CrudRepository<User,Long> {

}
