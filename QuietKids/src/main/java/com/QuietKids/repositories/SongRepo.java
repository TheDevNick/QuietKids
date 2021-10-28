package com.QuietKids.repositories;

import org.springframework.data.repository.CrudRepository;

import com.QuietKids.models.Song;

public interface SongRepo extends CrudRepository<Song, Long> {
	Iterable<Song> findAllByOrderByLikesAsc();
	Iterable<Song> findAllByOrderByLikesDesc();
}
