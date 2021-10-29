package com.QuietKids.repositories;

import org.springframework.data.repository.CrudRepository;

import com.QuietKids.models.Comment;
import com.QuietKids.models.Song;
import com.QuietKids.models.User;

public interface CommentRepo extends CrudRepository<Comment, Long> {
	Comment findByUser(User user);
	Comment findBySong(Song song);
}
