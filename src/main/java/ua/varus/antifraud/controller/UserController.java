package ua.varus.antifraud.controller;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ua.varus.antifraud.service.UserValidator;
import ua.varus.antifraud.domain.User;
import ua.varus.antifraud.service.UserDetailsServiceImpl;
import ua.varus.antifraud.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.concurrent.TimeUnit;


@RestController
public class UserController {

	@Autowired
	private UserDetailsServiceImpl userDetailsService;

	@Autowired
	private UserService userService;

	@Autowired
	private UserValidator userValidator;

	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		return new ModelAndView("redirect:login");
	}

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public ModelAndView users(){
		return new ModelAndView("users");
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard(){
		return new ModelAndView("dashboard");
	}


	private volatile Cache<String, byte[]> cache = CacheBuilder.newBuilder()
			.concurrencyLevel(30)
			.expireAfterWrite(7, TimeUnit.HOURS)
			.initialCapacity(500)
			.maximumSize(3000).softValues().build();

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/admin/ajax/getOnlineUsers",  method = RequestMethod.POST,  produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<User> getOnlineUsers(){
        System.out.println(userService.getOnlineUsers());
		return  userService.getOnlineUsers();
	}


	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/admin/ajax/createUser",  method = RequestMethod.POST,  produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public User createUser(@RequestBody User user, BindingResult bindingResult){
		userValidator.validate(user, bindingResult);
		if(bindingResult.hasErrors()){
			System.out.println(bindingResult.getAllErrors());
			System.out.println("ERROR");
			return null;
		}
		return  userService.createUser(user);
	}

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/admin/ajax/deleteUser",  method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE )
	@ResponseBody
	public boolean deleteEmployee(@RequestBody User user){
		return userService.deleteUser(user);
	}

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/admin/ajax/editUser",  method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public User editUser(@RequestBody User user){
		return userService.editUser(user);
	}
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/admin/ajax/uploadUserImage", headers = "content-type=multipart/*",  method = RequestMethod.POST)
	public @ResponseBody
	boolean uploadFileHandler(@RequestParam("file") MultipartFile multipartFile, Authentication authentication) {
		String user = authentication.getName();
		cache.invalidate(user);
		return userService.uploadUserImage(multipartFile, user);
	}
	@Secured({"ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value = "/admin/getAvatar/{userName}", method=RequestMethod.GET)
	@ResponseBody
	public byte[] getAvatar(@PathVariable String userName, HttpServletResponse response) {

		response.setHeader("Cache-Control", "max-age=604800, only-if-cached");
		response.setHeader("Pragma", "cache");
		response.setHeader("User-Cache-Control", "max-age=604800");
		response.setDateHeader("Expires", System.currentTimeMillis() + 604800000L);
		byte[] byteCache = cache.getIfPresent(userName);
		if(byteCache != null){
			return byteCache;
		}
		byte[] imageBytes = userService.getAvatar(userName);
		if(imageBytes!=null){
			cache.put(userName, imageBytes);
		}

		return imageBytes;
	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage(Authentication auth) {
		User user = userDetailsService.getUser(((UserDetails)auth.getPrincipal()).getUsername());
		ModelAndView model = new ModelAndView();
		model.addObject("login", user.getUsername());
		model.addObject("firstname", user.getFirstname());
		model.addObject("lastname", user.getLastname());
		model.addObject("position", user.getPosition());

		return model;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logoutPage (HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/login?logout");
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}

}