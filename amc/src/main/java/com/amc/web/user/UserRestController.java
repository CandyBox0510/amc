package com.amc.web.user;

import java.net.URLEncoder;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amc.service.user.UserService;
import com.amc.service.SNSLogin.InstaService;
import com.amc.service.SNSLogin.KakaoService;
import com.amc.service.SNSLogin.NaverService;
import com.amc.service.domain.User;

//==> 회원관리 RestController
@RestController
@RequestMapping("/user/json/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@RequestMapping( value="getPhone", method=RequestMethod.POST)
	public String getPhone(  @RequestBody User user,
							 HttpSession session) throws Exception {

	  System.out.println("::::::::::::::::"+user);
	  
	  /*userService.getId(user);*/
	  
      /*return "forward:/user/main.jsp";*/
	  System.out.println("여기는 controller : "+userService.getPhone(user));
	  
	  return userService.getPhone(user);
	}
	
	@RequestMapping( value="getId", method=RequestMethod.POST)
	public User getId(  @RequestBody User user,
							 HttpSession session) throws Exception {

	  System.out.println(user);
	  
	  /*userService.getId(user);*/
	  
      /*return "forward:/user/main.jsp";*/
	  System.out.println("여기는 controller : "+userService.getId(user));
	  
	  return userService.getId(user);
	}
	
	@RequestMapping( value="getUser/{tempId}", method={RequestMethod.GET,RequestMethod.POST} )
	public User getUser( @PathVariable String tempId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		String userId = tempId.replace(",", ".");
		
		//Business Logic
		return userService.getUser(userId);
	}
	
	@RequestMapping( value="deleteCheck", method={RequestMethod.GET,RequestMethod.POST} )
	public String deleteCheck( @RequestBody User user, Model model,
										HttpSession session  ) throws Exception{
		System.out.println("/user/json/deleteCheck : POST");
		return userService.deleteCheck(user);
	}
	
	@RequestMapping( value="loginUser", method=RequestMethod.POST )
	public User loginUser(	@RequestBody User user, Model model,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/loginUser : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		/*System.out.println("dbUser.roll :" + dbUser.getRole());*/
		/*if(dbUser==null || dbUser.getRole() == "not"){*/
		if(dbUser==null || dbUser.getRole().equals("not")){
			System.out.println("널 값이다");
			System.out.println(dbUser);
			model.addAttribute("user", dbUser);
			return dbUser;
		}else if(!user.getPassword().equals(dbUser.getPassword())){
			return null;
		}else{
			if(user.getPassword().equals(dbUser.getPassword())){
				session.setAttribute("user", dbUser);
			}
		}
		
		System.out.println("dbUser : " + dbUser);
		
		return dbUser;
	}
	
/*	@RequestMapping( value="checkDuplication/{userId:.+}", method=RequestMethod.GET )*/
	@RequestMapping( value="checkDuplication/{tempId}", produces="application/json;charset=UTF-8", method=RequestMethod.GET )
	public boolean checkDuplication( @PathVariable String tempId ) throws Exception{
		System.out.println("중복확인 체크"+tempId);
		String userId = tempId.replace(",", ".");
		return userService.checkDuplication(userId);
	}
	
	@RequestMapping( value="kakaoLogin", method=RequestMethod.POST )
	public User kakaoJsLogin(	@RequestBody User user, Model model,
									HttpSession session ) throws Exception{
		System.out.println("/user/json/kakaoLogin : POST");
			System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if(dbUser==null || dbUser.getRole().equals("not")){
			System.out.println("널 값이다");
			System.out.println(dbUser);
			model.addAttribute("user", dbUser);
			return dbUser;
		}else if(!user.getPassword().equals(dbUser.getPassword())){
			return null;
		}else{
			System.out.println("UserRestController의 kakaoLogin메소드에서 User가 있을떄");
			session.setAttribute("user", dbUser);
			return dbUser;
		}
	}
	
/*	@RequestMapping( value="kakaoLogin", method=RequestMethod.POST )
	public User kakaoJsLogin(	@RequestBody User user,
									HttpSession session ) throws Exception{
		System.out.println("/user/json/kakaoLogin : POST");
			System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if(dbUser==null){
			System.out.println("널 값이다");
		}else{
			session.setAttribute("user", dbUser);
		}
		System.out.println("dbUser : " + dbUser);
		return dbUser;
	}*/


	@RequestMapping(value="/androidGetUser")
	public String androidGetUser(@RequestParam("email")String userId, 
									@RequestParam(value="password", defaultValue="")String password,
									@RequestParam(value="kakaoLogin", defaultValue="false")String kakaoLogin) throws Exception{
		
		if(kakaoLogin.equals("true")){
			System.out.println("안드로이드 카카오로그인 : userId : "+userId);
		}else{
			System.out.println("안드로이드 : userId : "+userId+" password :"+password);
		}
		
		String jsonString = "";
		
		User dbUser=userService.getUser(userId);
		
		if(dbUser==null){ //맞는 유저가 없음
			return jsonString;
		}else{ //맞는 유저가 있음(카카오 로그인이면 그냥통과, 아니라면 패스워드도 확인)
			if(kakaoLogin.equals("false")){
				if(dbUser.getPassword().equals(password)){
					System.out.println("안드로이드 유저 id,pw 맞음");
				}else{
					return jsonString;
				}
			}else{
				System.out.println("안드로이드 유저 id 맞음(카카오로그인)");
			}
		}
		
		System.out.println("dbUser : " + dbUser);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String temp = objectMapper.writeValueAsString(dbUser);
		
		jsonString = URLEncoder.encode(temp,"UTF-8");
		
		return jsonString;

	}
	
	@RequestMapping(value="/addUuid")
	public String addUuid(@RequestParam("token")String token, 
									@RequestParam("userId")String userId) throws Exception{
				
		System.out.println("안드로이드에서 온 토큰 token : "+token+" userId :"+userId);
		
		return userService.addUuid(token, userId);
	}
}
