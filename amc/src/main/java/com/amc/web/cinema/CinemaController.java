package com.amc.web.cinema;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.cinema.CinemaService;
import com.amc.service.domain.User;
import com.amc.service.movie.MovieService;

@Controller
@RequestMapping("/cinema/*")
public class CinemaController {

	@Autowired
	@Qualifier("cinemaServiceImpl")
	private CinemaService cinemaService;
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 10}")
	int pageSize;
	
	public CinemaController(){
		System.out.println("cinemaController() default Constructor");
	}
	
	
	@RequestMapping(value="unifiedSearch", method=RequestMethod.POST) //POST로 바뀌어야함
	public String unifiedSearch(@ModelAttribute("Search")Search search, Model model) throws Exception{
		
		String searchKeyword = search.getSearchKeyword();
		
		System.out.println("통합검색 서치키워드 : " + searchKeyword);
		
		model.addAttribute("unifiedSearch",cinemaService.unifiedSearch(searchKeyword));
		
		return "forward:/cinema/unifiedSearch.jsp";
	}
	
	@RequestMapping(value="index", method=RequestMethod.GET)
	public String index(Model model) throws Exception{
		
		model.addAttribute("indexList",cinemaService.index());
		
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value="mobileKakaoPay", method=RequestMethod.GET)
	public String mobileKakaoPay(Model model, @RequestParam("title")String title,
			@RequestParam("screenOpenTime")String screenOpenTime,@RequestParam("theater")String theater,
			@RequestParam("bookingSeatNo")String bookingSeatNo,@RequestParam("headCount")String headCount,
			@RequestParam("totalTicketPrice")String totalTicketPrice,@RequestParam("screenContentNo")String screenContentNo,
			HttpServletRequest request) throws Exception{

		System.out.println("■■■■모바일 카카오페이■■■■ : "+screenContentNo);
		title=new String(title.getBytes("8859_1"),"UTF-8");
		model.addAttribute("title", title);
				
		return "forward:/cinema/mobileKakaoPay.jsp";
	}
	
	@RequestMapping(value="completePay", method=RequestMethod.GET)
	public String completePay(Model model,@RequestParam("impUid")String impUid) throws Exception{
		
		model.addAttribute("impUid",impUid);
		
		return "forward:/cinema/completePay.jsp";
	}
}