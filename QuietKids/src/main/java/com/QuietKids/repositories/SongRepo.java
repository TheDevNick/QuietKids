package com.QuietKids.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.QuietKids.models.Song;

public interface SongRepo extends CrudRepository<Song, Long> {
	Iterable<Song> findAllByOrderByLikesAsc();
	Iterable<Song> findAllByOrderByLikesDesc();
	List<Song> findByArtist(String artist);
//	Iterable<Song> findAllById();
	
}
