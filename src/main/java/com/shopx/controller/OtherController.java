package com.shopx.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shopx.model.Game;
import com.shopx.service.GameService;

@Controller
@RequestMapping("/other")
public class OtherController extends GamesController{

	@Autowired
	GameService gameService;
	Game game;
	
	@RequestMapping("/search")
	public String search(@RequestParam("search") String search,ModelMap map)
	{
		List<Game> games=new ArrayList<Game>();
		for(Game ga:gameService.search(search))
		{
			List<String> im = gameService.displayImage(ga.getGame_name());
			if(!im.isEmpty())
				ga.setGameimage(im.get(0));	
			games.add(ga);
		}
		map.addAttribute("games",games);
		return "games";
	}
	
	@RequestMapping("/HighToLow")
	public String HighToLow(ModelMap map) {
		List<Game> games = new ArrayList<Game>();
		for(Game ga:gameService.displayHighToLow()) {
			List<String> im = gameService.displayImage(ga.getGame_name());
			if(!im.isEmpty())
				ga.setGameimage(im.get(0));
			games.add(ga);
		}
		map.addAttribute("games", games);
		return "games";
	}
	
	@RequestMapping("/LowToHigh")
	public String LowToHigh(ModelMap map) {
		List<Game> games = new ArrayList<Game>();
		for(Game ga:gameService.displayLowToHigh()) {
			List<String> im = gameService.displayImage(ga.getGame_name());
			if(!im.isEmpty())
				ga.setGameimage(im.get(0));
			games.add(ga);
		}
		map.addAttribute("games", games);
		return "games";
	}
	
//	to advertise game  redirect to displayAds form
	@GetMapping("/AdGame")
	public String adGame(ModelMap map) {
		map.addAttribute("game", new Game());
		return "displayAds";
	}
	
	@PostMapping("/AdGame")
	public String adGame(@ModelAttribute("game") Game ga, @RequestParam("image") MultipartFile gameimage, ModelMap map) {
		
		String path = "C:\\Users\\Aster\\eclipse-workspace\\Shopx_Frontend\\src\\main\\webapp\\WEB-INF\\images\\";
		Path p = Paths.get(path+ga.getGame_name());
		if(!Files.exists(p)) {
			try {
				Files.createDirectories(p);
				System.out.println("File Directory created");
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		List<String> file = gameService.displayImage(ga.getGame_name());
		path = String.valueOf(p.toString())+"\\"+(file.size()+1)+".jpg";
		System.out.println(path);
		File imagefile = new File(path);
		
		if(!gameimage.isEmpty()) {
			try {
				byte buffer[] = gameimage.getBytes();
				FileOutputStream fos = new FileOutputStream(imagefile);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(buffer);
				bos.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		gameService.advertiseGame(ga);
		return "redirect:/game/games";
	}
	
}
