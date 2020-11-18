package com.shopx.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.swing.text.html.HTMLDocument.HTMLReader.IsindexAction;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shopx.mail.Email;
import com.shopx.model.User;
import com.shopx.model.UserCart;
import com.shopx.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	User user;
	
	@GetMapping("/signin")
	public String register(ModelMap map)
	{
		map.addAttribute("user",new User());
		return "register";
	}
	
	@PostMapping("/signin")
	public String addUser(@Valid @ModelAttribute("user") User user, BindingResult result)
	{	
		if(result.hasErrors()) {
			
			return "register";
		}else {
			userService.addUser(user);
			return "redirect:/user/login";	
		}
	}
	
	@RequestMapping("/login")
	public String Login() {
		
		return "login";
	}
	
	@GetMapping("/editUser/{id}")
	public String EditUser(@PathVariable("id") int id, ModelMap map) {
		User us = userService.displayUserById(id);
		map.addAttribute("us", us);
		
		return "register";
	}
	
	@PostMapping("/updateUser")
	public String UpdateUser(@ModelAttribute("us") User us) {
		userService.updateUser(us);
		return "redirect:/list/userList";
	}
	
	@RequestMapping("/deleteUser/{id}")
	public String DeleteUser(@PathVariable("id") int id) {
		
		userService.deleteUser(id);
		return "redirect:/list/userList";
	}
	
	@RequestMapping("/enterusername")
	public String EnterUsername() {
		
		return "enterusername";
	}
	
	@RequestMapping("/forgot")
	public String Frogot(@RequestParam("username") String username, ModelMap map) {
		user = userService.displayUserByName(username);
		Random rand = new Random();
		int otp = rand.nextInt(89999)+10000;
		
		Email email = new Email(user.getEmail(), "Password Reset", "OTP: "+otp);
		email.Sendmail();
		
		map.addAttribute("otp", otp);
		return "confirmotp";
	}
	
	@RequestMapping("/checkotp")
	public String CheckOTP(@RequestParam("userotp") int userotp, @RequestParam("otp") int otp) {
		
		if(userotp==otp){
			return "changepassword";
		}else{
			return "redirect:/user/login";
		}
	}
	
	@RequestMapping("/updatepassword")
	public String updatePassword(@RequestParam("password") String password, @RequestParam("cpassword") String cpassword){
		if(password.equals(cpassword)) {
			
			password = new BCryptPasswordEncoder().encode(password);
			user.setPassword(password);
			userService.updateUser(user);
			return "redirect:/user/login";
		}else {
			return "changepassword";
		}
	}
	
//	To set user to User and Admin depending on what their current authority is
	@RequestMapping("/setAuthority/{id}")
	public String setAthority(@PathVariable("id") int id) {
		User us = userService.displayUserById(id);
		String auth = us.getAuthority();
		if(auth.equals("admin")) {
			us.setAuthority("user");
			
		}else{
			us.setAuthority("admin");
		}
		userService.updateUser(us);
		return "redirect:/list/userList";
	}
	
//	To set user to Admin (This part is no longer needed)
//	@RequestMapping("/setAdmin/{id}")
//	public String setAdmin(@PathVariable("id") int id) {
//		User us = userService.displayUserById(id);
//		us.setAuthority("admin");
//		userService.updateUser(us);
//		return "redirect:/list/userList";
//	}
	
	@RequestMapping("/setStatus/{id}")
	public String setStatus(@PathVariable("id") int id) {
		User us = userService.displayUserById(id);
		boolean sta = us.isStatus();
		if(sta == true) {
			us.setStatus(false);
		
		}else{
			us.setStatus(true);
		}
		userService.updateUser(us);
		return "redirect:/list/userList";
	}
	
	@RequestMapping("/profile")
	public String Profile(@RequestParam("username") String username, ModelMap map) {
//		User us = new User();
		User user = userService.displayUserByName(username);
		map.addAttribute("user", user);
		return "redirect:/list/userList";
	}
	
	@RequestMapping("/searchUser")
	public String searchUser(@RequestParam("email") String email, ModelMap map) {
		
		List<User> user = new ArrayList<User>();
		for(User us:userService.searchUser(email)) {
			user.add(us);
		}
		map.addAttribute("user", user);
		return "userList";
	}
	
}
