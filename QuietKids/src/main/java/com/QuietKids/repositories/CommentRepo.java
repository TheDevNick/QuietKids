package com.QuietKids.repositories;

import org.springframework.data.repository.CrudRepository;

import com.QuietKids.models.Comments;

public interface CommentRepo extends CrudRepository<Comments, Long> {

}
