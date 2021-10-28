package com.QuietKids.models;

import java.util.*;

import javax.persistence.*;

@Entity
@Table(name = "songlikes")
public class SongLikes {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "song_id")
	private Song song;
	
    @OneToMany(fetch=FetchType.LAZY, mappedBy="user")
    private List<Comment> comments;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(
		name="likedSongs",
		joinColumns = @JoinColumn(name="user_id"),
		inverseJoinColumns = @JoinColumn(name="song_id")
	)
    private List<Song> songs;
}