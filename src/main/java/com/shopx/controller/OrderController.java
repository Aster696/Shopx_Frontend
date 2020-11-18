package com.shopx.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopx.model.Game;
import com.shopx.service.GameService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	GameService gameService;
	
//	@GetMapping("/mycart")
//	public String myCart(@PathVariable("id") int id, ModelMap map) {
//		Game games = gameService.displayGameById(id);
//		map.addAttribute("games", games);
//		return "cart";
//	}
	
}
