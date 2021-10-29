package com.QuietKids.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.QuietKids.models.Song;
import com.QuietKids.models.User;
import com.QuietKids.services.SongService;
import com.QuietKids.services.UserService;

@Controller
public class SongController {

	private SongService songService;
	public SongController(SongService songService) {
		this.songService = songService;

	}
	
	@Autowired
	private  UserService userService;
	
	public Long userSessionId(HttpSession session) {
		if(session.getAttribute("userId") == null)
			return null;
		return (Long)session.getAttribute("userId");
	}
	
	@RequestMapping("/songs/new")
	public String createForm(Model model, @ModelAttribute("song") Song song) {
		return "new.jsp";

	}
	
	@RequestMapping(value = "/songs/new", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("idea") Song song, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "new.jsp";
		}
		Long uID = (Long) session.getAttribute("userId");
		String userName = userService.findById(uID).getName();
		song.setCreatedBy(userName);
		song.setLikes(0);
		songService.createSong(song);
		return "redirect:/songs";
	}
	
	// show Song
	@RequestMapping(value = "/songs/{id}")
	public String show(@PathVariable("id") Long id, Model model, HttpSession session) {
		Song song = songService.findSong(id);
		Long uID = (Long) session.getAttribute("userId");
		User user = userService.findById(uID);
		model.addAttribute("user", user);
		model.addAttribute("song", song);
		return "show.jsp";
	}
	
	@RequestMapping(value = "/songs/{id}/delete", method = RequestMethod.POST)
	public String delete(@PathVariable("id") Long id) {
		songService.deleteSong(id);
		return "redirect:/songs";
	}
	
	@RequestMapping(value = "/songs/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Song song = songService.findSong(id);
		model.addAttribute("song", song);
		return "edit.jsp";
	}
	
	@RequestMapping(value = "/songs/{id}/edit", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("song") Song song, BindingResult result, HttpSession session, @PathVariable("id") Long id) {
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			Song song1 = songService.findSong(id);
			Long uID = (Long) session.getAttribute("userId");
			String userName = userService.findById(uID).getName();
			if (! song1.getCreatedBy().equals(userName))
				return "redirect:/ideas";
			song1.setTitle(song.getTitle());
			songService.updateSong(song1);
			return "redirect:/songs/" + song1.getId();
		}
		
	}
	
	@RequestMapping(value = "/songs/{id}/like")
	public String like(@PathVariable("id") Long id, Model model,HttpSession session) {
		Song song = songService.findSong(id);
		Long UID=(Long) session.getAttribute("userId");
		User user = userService.findById(UID);
    	List<User> users =song.getUsers();
    	song.setLikes(song.getLikes()+1);
    	users.add(user);
    	song.setUsers(users);
		songService.updateSong(song);
		return "redirect:/songs";
		}
	
	@RequestMapping(value = "/songs/{id}/Unlike")
	public String Unlike(@PathVariable("id") Long id, Model model,HttpSession session) {
		Song song = songService.findSong(id);
		User user = userService.findById((Long) session.getAttribute("userId"));
    	List<User> users =song.getUsers();
    	song.setLikes(song.getLikes()-1);
    	users.remove(user);
    	song.setUsers(users);
		songService.updateSong(song);
		return "redirect:/songs";
		}
	
	//comment
	@PostMapping("/songs/{id}/comment")
	public String Comment(@PathVariable("id") Long id, @RequestParam("comment") String comment, RedirectAttributes redirs, HttpSession session) {
		Long userId = this.userSessionId(session);
		if(userId == null)
			return "redirect:/";
		if(comment.equals("")) {
			redirs.addFlashAttribute("error", "Comment must not be blank");
			return "redirect:/songs" ;
		}
		Song song = this.songService.findSong(id);
		User user = this.userService.findById(userId);
		this.songService.comment(user, song, comment);
		return "redirect:/songs";
	}
}

