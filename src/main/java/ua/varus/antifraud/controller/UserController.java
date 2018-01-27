package ua.varus.antifraud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import ua.varus.antifraud.domain.User;
import ua.varus.antifraud.service.UserDetailsServiceImpl;


@RestController
public class UserController {

	@Autowired
	private UserDetailsServiceImpl userDetailsService;

	@RequestMapping(value = {"/","/welcome"}, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!");
		model.setViewName("hello");
		return model;

	}


	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage(Authentication auth) {
		User user = userDetailsService.getUser(((UserDetails)auth.getPrincipal()).getUsername());
		ModelAndView model = new ModelAndView();
//		User user = (User) userDetailsService.loadUserByUsername(auth.getName());
//		model.setViewName("admin");
//
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