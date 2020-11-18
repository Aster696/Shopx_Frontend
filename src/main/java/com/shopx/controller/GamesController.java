package com.shopx.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shopx.mail.Email;
import com.shopx.model.Game;
import com.shopx.service.GameService;


@Controller
@RequestMapping("/game")
public class GamesController{

	@Autowired
	GameService gameService;
	
	@GetMapping("/addGame")
	public String addGame(ModelMap map) {
		map.addAttribute("game", new Game());
		return "addgame";
	}
	
	@PostMapping("/addGame")
	public String addGame(@ModelAttribute("game") Game ga, @RequestParam("image") MultipartFile gameImage, ModelMap map) {
		
		String path = "C:\\Users\\Aster\\eclipse-workspace\\Shopx_Frontend\\src\\main\\webapp\\WEB-INF\\images\\";
		Path p = Paths.get(path+ga.getGame_name());
		if(!Files.exists(p)) {
			try {
				Files.createDirectory(p);
				System.out.println("Directory created");
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		List<String> files = gameService.displayImage(ga.getGame_name());
		
		path = String.valueOf(p.toString())+"\\"+(files.size()+1)+".jpg";
		System.out.println(path);
		File imageFile = new File(path);
		
		if(!gameImage.isEmpty()) {
			try {
				byte buffer[] = gameImage.getBytes();
				FileOutputStream fos = new FileOutputStream(imageFile);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(buffer);
				bos.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
//		gameService.addGame(ga);
//		map.addAttribute("msg","Game added sucessfully");
//		map.addAttribute("type","Sucess");
//		map.addAttribute("pagename","/game/games");
//		return "popup";
		gameService.addGame(ga);

//Sending Email		
//		Email email = new Email(ga.getEmail(), "Product Added", ga.getGame_name()+" game as been added successfully");
//		email.Sendmail();
//		System.out.println("mail to -> "+ga.getEmail());
		return "redirect:/game/games"; 
	}

//Image part is in the back end project
//	public List<String> displayImage(String game_name){
//		
//		List<String> images = new ArrayList();
//		
//		try {
//			String path = "C:\\Users\\Aster\\eclipse-workspace\\Shopx_Frontend\\src\\main\\webapp\\WEB-INF\\images\\";
//			Path p = Paths.get(path+game_name);
//			DirectoryStream<Path> files=Files.newDirectoryStream(p,"*.*");
//			
//			for(Path file:files)
//			{
////				FileInputStream fis=new FileInputStream(file.toString());
////				byte[] arr=new byte[fis.available()];
////				fis.read(arr);
//				
//				images.add(file.getFileName().toString());
//			}
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//		return images;
//	}
	
	@GetMapping("/games")
	public String displayGame(ModelMap map) {
		List<Game> games = new ArrayList<Game>();
		for(Game ga:gameService.displayGames()){
			List<String> im = gameService.displayImage(ga.getGame_name());
			if(!im.isEmpty())
			ga.setGameimage(im.get(0));
			games.add(ga);
		}
		map.addAttribute("games", games);
		return "games";
	}
	
	@GetMapping("/games/{id}")
	public String displaGameById(@PathVariable("id") int id, ModelMap map) {
		Game ga = gameService.displayGameById(id);
		List<String> im = gameService.displayImage(ga.getGame_name());
		ga.setGameimage(im.get(0));
		map.addAttribute("ga", ga);
		return "gamedisplay";
	}
	
	@RequestMapping("/deletegame/{id}")
	public String deleteGame(@PathVariable("id") int id) throws IOException {
		
		Game ga = gameService.displayGameById(id);
//	getting image folder name
		String imgname = ga.getGame_name();
		System.out.println("Image folder name : "+imgname);
		File file = new File("C:\\Users\\Aster\\eclipse-workspace\\Shopx_Frontend\\src\\main\\webapp\\WEB-INF\\images\\"+imgname);
//	deleting image folder
		FileUtils.deleteDirectory(file);
		System.out.println(file+"\n image deleted Sucess");
		
		gameService.deleteGame(id);
		
//	this will send mail to the user product deleted
//		Email email = new Email(ga.getEmail(), "Product Deleted", ga.getGame_name()+" game as been deleted successfully");
//		email.Sendmail();
//		System.out.println("mail to -> "+ga.getEmail());
		
		return "redirect:/game/games";
	}
	
	@GetMapping("/editgame/{id}")
	public String editGame(@PathVariable("id") int id, ModelMap map) {
		Game ga  = gameService.displayGameById(id);
		map.addAttribute("ga", ga);
		return "addgame";
	}
	
	@PostMapping("/updategame/{id}")
	public String updateGame(@ModelAttribute("ga") Game ga, @RequestParam("image") MultipartFile gameImage, @PathVariable("id") int id, ModelMap map) {
		
		Game oldid = gameService.displayGameById(id);
		String oldname = oldid.getGame_name();
		String newname = ga.getGame_name();
		String path = "C:\\Users\\Aster\\eclipse-workspace\\Shopx_Frontend\\src\\main\\webapp\\WEB-INF\\images\\";
		Path pa = Paths.get(path+oldname);
		Path p = Paths.get(path+newname);
		
		System.out.println("old name -> "+oldname);
		System.out.println("new name -> "+newname);
		
		if(Files.exists(pa)) {
			try {
				if(oldname.equals(newname)) {
					File deleteFolder = new File("C:\\Users\\Aster\\eclipse-workspace\\Shopx_Frontend\\src\\main\\webapp\\WEB-INF\\images\\"+oldname);
					FileUtils.deleteDirectory(deleteFolder);
					Files.createDirectories(pa);
					System.out.println("Old name is used same name directory created");
					
					List<String> files = gameService.displayImage(ga.getGame_name());
					path = String.valueOf(pa.toString())+"\\"+(files.size()+1)+".jpg";
					System.out.println("New Path "+path);
					File imageFile = new File(path);
					
					if(!gameImage.isEmpty()) {
						try {
							byte buffer[]= gameImage.getBytes();
							FileOutputStream fos = new FileOutputStream(imageFile);
							BufferedOutputStream bos = new BufferedOutputStream(fos);
							bos.write(buffer);
							bos.close();
								
						} catch (Exception e) {
							System.out.println(e);
						}
						
					}
				}else {
					File deleteFolder = new File("C:\\Users\\Aster\\eclipse-workspace\\Shopx_Frontend\\src\\main\\webapp\\WEB-INF\\images\\"+oldname);
					FileUtils.deleteDirectory(deleteFolder);
					Files.createDirectories(p);
					System.out.println("New name is used new name directory created");
					
					List<String> files = gameService.displayImage(ga.getGame_name());
					path = String.valueOf(p.toString())+"\\"+(files.size()+1)+".jpg";
					System.out.println("New Path "+path);
					File imageFile = new File(path);
					
					if(!gameImage.isEmpty()) {
						try {
							byte buffer[]= gameImage.getBytes();
							FileOutputStream fos = new FileOutputStream(imageFile);
							BufferedOutputStream bos = new BufferedOutputStream(fos);
							bos.write(buffer);
							bos.close();
								
						} catch (Exception e) {
							System.out.println(e);
						}
						
					}
				}
				
//				System.out.println("New file -> "+p);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
//		List<String> files = gameService.displayImage(ga.getGame_name());
//		path = String.valueOf(p.toString())+"\\"+(files.size()+1)+".jpg";
//		System.out.println("New Path "+path);
//		File imageFile = new File(path);
//		
//		if(!gameImage.isEmpty()) {
//			try {
//				byte buffer[]= gameImage.getBytes();
//				FileOutputStream fos = new FileOutputStream(imageFile);
//				BufferedOutputStream bos = new BufferedOutputStream(fos);
//				bos.write(buffer);
//				bos.close();
//					
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//			
//		}
		
		gameService.updateGame(ga);
		
//		Email email = new Email(ga.getEmail(), "Product Added", ga.getGame_name()+" game as been added successfully with image");
//		email.Sendmail();
//		System.out.println("mail to -> "+ga.getEmail());
		
		return "redirect:/game/games";
	}
	
//	To Add Advertisement 
	@RequestMapping("/addAd/{id}")
	public String adAd(@PathVariable("id") int id) {
		Game ga = gameService.displayGameById(id);
		String adAuth = ga.getAdauthority();
		if(adAuth.equals("notpayed")) { 
			ga.setAdauthority("payed");	
			
		}else { 
			ga.setAdauthority("notpayed");
		}
		gameService.updateGame(ga);
		return "redirect:/list/gameList";
	}
	
////	To Remove Advertisement
//	@RequestMapping("/removeAd/{id}")
//	public String removeAd(@PathVariable("id") int id) {
//		Game ga = gameService.displayGameById(id);
//		ga.setAdauthority("notpayed");
//		gameService.updateGame(ga);
//		return "redirect:/game/games";
//	}
	
}
