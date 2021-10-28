package com.QuietKids.repositories;

import org.springframework.data.repository.CrudRepository;

import com.QuietKids.models.SongLikes;

public interface SongLikeRepo extends CrudRepository<SongLikes, Long> {

}
