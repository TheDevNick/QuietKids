package com.QuietKids.models;

import java.util.*;

import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
@Table(name = "songs")
public class Song {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Size(min = 3, message = "content must be greater than 3 characters")
	private String title;

	@Size(min = 3, message = "content must be greater than 3 characters")
	private String artist;
	
	@Size(min = 3, message = "content must be greater than 3 characters")
	private String album;
	private String description;
	private String createdBy;
	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;

	private int likes;
	
	public Song() {
	}
	
    public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

    public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="song")
	private List<Comment> comments;
	 
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
    
    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(
		name="SongLikes",
		joinColumns = @JoinColumn(name="idea_id"),
		inverseJoinColumns = @JoinColumn(name="user_id")
	)
    private List<User> users;

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	
}
