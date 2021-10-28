package com.QuietKids.services;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.QuietKids.models.Comment;
import com.QuietKids.models.Song;
import com.QuietKids.models.User;
import com.QuietKids.repositories.CommentRepo;
import com.QuietKids.repositories.SongRepo;

@Service
public class SongService {
private final SongRepo songRepo;
@Autowired
private CommentRepo commentRepo;

    
    public SongService (SongRepo songRepo) {
        this.songRepo = songRepo;
    }
    public Iterable<Song> allSongs() {
        return songRepo.findAll();
    }

    public Iterable<Song> allSongsHighest() {
        return songRepo.findAllByOrderByLikesDesc();
    }
    public Iterable<Song> allSongsLowest() {
        return songRepo.findAllByOrderByLikesAsc();
    }
    public Song findSong (Long id) {
        Optional<Song> optionalSong = songRepo.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
    }
    
    public Song createSong(Song s) {
        return songRepo.save(s);
    }
    
//    comments
	public void comment(User user, Song song, String comment) {
		this.commentRepo.save(new Comment(user, song, comment));
	}
    
    
    
    public Song updateSong(Song USong ) {
        Optional<Song> optionalSong = songRepo.findById(USong.getId());
        if(optionalSong.isPresent()) {
            Song i= optionalSong.get();
            i.setTitle(USong.getTitle());
            i.setArtist(USong.getArtist());
            i.setAlbum(USong.getAlbum());
            i.setCreatedBy(USong.getCreatedBy());
            i.setLikes(USong.getLikes());
            i.setUsers(USong.getUsers());
            return songRepo.save(i);  
        } else {
            return null;
        }
        
    }

    //Delete
    public  void deleteSong(Long id) {
    	songRepo.deleteById(id);
    	
    }
}

