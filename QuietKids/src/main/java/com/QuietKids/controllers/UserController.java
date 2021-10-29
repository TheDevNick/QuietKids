package com.QuietKids.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.QuietKids.models.Song;
import com.QuietKids.models.User;
import com.QuietKids.services.SongService;
import com.QuietKids.services.UserService;
import com.QuietKids.validator.UserValidator;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserValidator validator;
	@Autowired
	private SongService songService;
	
	public Long userSessionId(HttpSession session) {
		if(session.getAttribute("userId") == null)
			return null;
		return (Long)session.getAttribute("userId");
	}
	
	@GetMapping("/")
	public String Index(@ModelAttribute("registration") User user, Model model) {
	
		return "login-register.jsp";
	}
	
	@PostMapping("/")
	public String Register(@Valid @ModelAttribute("registration") User user, BindingResult result, HttpSession session) {
		validator.validate(user, result);
		if(result.hasErrors())
			return "login-register.jsp";
		
		User newUser = this.userService.registerUser(user);
		session.setAttribute("userId", newUser.getId());
		return "redirect:/songs";
	}
	
	@PostMapping("/login")
	public String Login(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, RedirectAttributes redirs) {
		if(this.userService.authenticateUser(email, password)) {
			User user = this.userService.getUserByEmail(email);
			session.setAttribute("userId", user.getId());
			return "redirect:/songs";
		}
		redirs.addFlashAttribute("error", "Invalid Email/Password");
		return "redirect:/";
	}
	
	@RequestMapping("/songs")
	public String home(HttpSession session, Model model) {
		Long uID = (Long) session.getAttribute("userId");
		User user = this.userService.findById(uID);
		Long userId = this.userSessionId(session);
		if(userId == 0)
			return "redirect:/";
		Iterable<Song> songs = songService.allSongs();
		model.addAttribute("songs", songs);
		model.addAttribute("user", user);
		model.addAttribute("userId", userId);
		return "index.jsp";

	}
	
	@RequestMapping("/songs/lowest")
	public String homeL(HttpSession session, Model model) {
		Long uID = (Long) session.getAttribute("userId");
		User user = userService.findById(uID);
		Iterable<Song> songs = songService.allSongsLowest();
		model.addAttribute("songs", songs);
		model.addAttribute("user", user);
		return "index.jsp";

	}
	
	@RequestMapping("/songs/highest")
	public String homeH(HttpSession session, Model model) {
		Long uID = (Long) session.getAttribute("userId");
		User user = userService.findById(uID);
		Iterable<Song> songs = songService.allSongsHighest();
		model.addAttribute("songs", songs);
		model.addAttribute("user", user);
		return "index.jsp";

	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
