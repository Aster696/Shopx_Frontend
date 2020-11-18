package com.shopx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shopx.model.Game;
import com.shopx.model.User;
import com.shopx.model.UserCart;
import com.shopx.service.GameService;
import com.shopx.service.UserCartService;
import com.shopx.service.UserService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	UserCartService userCartService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	GameService gameService;
	
	@RequestMapping("/addToCart/{id}")
	public String addToCart(@PathVariable("id") int id) {
		Game ga = new Game();
		String username;
//		int usid;
		ga.setId(id);
//		usid = ga.getId();
		ga = gameService.displayGameById(ga.getId());
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal instanceof UserDetails) {
			UserDetails user = ((UserDetails)principal);
			User us = new User();
			username = user.getUsername();
			us = userService.displayUserByName(username);
			UserCart uc = new UserCart();
			uc.setGamename(ga.getGame_name());
			uc.setPlatform(ga.getPlatform());
			uc.setRating(ga.getRating());
			uc.setCategory(ga.getCategory());
			uc.setPrice(ga.getPrice());
			uc.setUser(us);
			uc.setGame(ga);
			
			userCartService.addCart(uc);
		}
		return "redirect:/cart/myCart";
	}
	
	@RequestMapping("/myCart")
	public ModelAndView myCart() {
		ModelAndView mv = new ModelAndView();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal instanceof UserDetails) {
			UserDetails userDetails = ((UserDetails)principal);
			User us = new User();
//			us.setUsername(userDetails.getUsername());
			us=userService.displayUserByName(userDetails.getUsername());
			List<UserCart> userCart = userCartService.displayCartByUserId(us);
			mv.addObject("userCart",userCart);
			mv.setViewName("cart");
//			map.addAttribute("userCart",userCart);
		}else {
			System.out.println("User not found in cart");
		}
		return mv;
	}
	
	@RequestMapping("/deleteCart/{cartId}")
	public String deleteCart(@PathVariable("cartId") int cartId) {
		
		userCartService.deleteCart(cartId);
		return "redirect:/cart/myCart";
		
	}
	
}
