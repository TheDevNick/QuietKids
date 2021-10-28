package com.QuietKids.repositories;

import org.springframework.data.repository.CrudRepository;

import com.QuietKids.models.Comment;

public interface CommentRepo extends CrudRepository<Comment, Long> {

}
