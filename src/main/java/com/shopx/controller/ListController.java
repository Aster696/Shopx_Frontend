package com.shopx.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shopx.model.Game;
import com.shopx.model.User;
import com.shopx.service.GameService;
import com.shopx.service.UserService;

@Controller
@RequestMapping("/list")
public class ListController {

	@Autowired
	UserService userService;
	User user;
	@Autowired
	GameService gameService;
	Game game;
	
	@GetMapping("/userList")
	public ModelAndView userList() {
		List<User> user = userService.displayUsers();
		ModelAndView mv = new ModelAndView();
		mv.addObject("user",user);
		mv.setViewName("userList");
		return mv;
	}
	
	@GetMapping("/gameList")
	public ModelAndView gameList() {
		List<Game> game = gameService.displayGames();
		ModelAndView mv = new ModelAndView();
		mv.addObject("game",game);
		mv.setViewName("gameList");
		return mv;
	}
	
	@RequestMapping("/ManyToManyList")
	public String ManyToManyList() {
		return "ManyToManyList";
	}
	
}
