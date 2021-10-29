package com.QuietKids.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.QuietKids.models.Comment;
import com.QuietKids.models.User;
import com.QuietKids.repositories.CommentRepo;

@Service
public class CommentService {
	@Autowired
	private CommentRepo commentRepo;
	public Comment findByUser(User user) {
		return this.commentRepo.findByUser(user);
	}
	
	
	
	
}
