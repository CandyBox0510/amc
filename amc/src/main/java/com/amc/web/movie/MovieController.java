package com.amc.web.movie;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.junit.internal.matchers.SubstringMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.common.util.CommonUtil;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;
import com.amc.service.domain.User;
import com.amc.service.domain.WishList;
import com.amc.service.movie.MovieService;
import com.amc.service.screen.ScreenService;

import sun.print.resources.serviceui;

//==> 영화관리  Controller
@Controller
@RequestMapping("/movie/*")
public class MovieController {
	
	///Field
	@Autowired
	@Qualifier("movieServiceImpl")
	private MovieService movieService;
	/// Field 해림추가
	@Autowired
	@Qualifier("screenServiceImpl")
	private ScreenService screenService;
	
	//setter Method 구현 않음
	
	public MovieController() {
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	

	@RequestMapping( value="getMovieList")
	public String getMovieList( @ModelAttribute("search") Search search,								
								  Model model , HttpSession session,
								  HttpServletRequest request) 
								  throws Exception{
		
		System.out.println("/getMovieList  GET ");
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(search.getCurrentPage() ==0 ){			
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		User user = (User)session.getAttribute("user");		
		
		System.out.println("pagesize " + search.getPageSize());
		System.out.println("search " + search);
		
		System.out.println("menu :" + request.getParameter("menu"));
		
		
		if(request.getParameter("menu").equals("manage")) {
			
			search.setSearchKeyword2("manage");
			search.setSearchKeyword3("manage");
			
		
			//System.out.println("search.setSearchKeyword2 [[manage]]" + search.getSearchKeyword2());
		} else {
			// 현재 상영 영화인 경우 로직
			if((request.getParameter("menu").equals("movie")) || (request.getParameter("menu").equals("search")))  {
				
				System.out.println("현재 상영 영화 콜 !!!!");
				
				search.setSearchKeyword2("4");				
				
				if (search.getSearchKeyword() != null) {				
					search.setSearchCondition("1");					
				}
			}
			
			// 현재 상영 예정 영화인  경우 로직
			if(request.getParameter("menu").equals("commingsoon")) {
				search.setSearchKeyword2("5");
				
				System.out.println("상영 예정 영화 콜 !!!!");
				
				if (search.getSearchKeyword() != null) {				
					search.setSearchCondition("1");	
				}
			}	
		}
		
			
		if (user != null) {
			System.out.println("User not null ....");
			
			Map<String,Object> tempMap = new HashMap<String,Object>();		
			
			tempMap.put("search", search);
			tempMap.put("user", user);
			
			Map<String, Object> map2 = movieService.getWishList(tempMap);	
			List<WishList> listWish = ((List<WishList>)movieService.getWishList(tempMap).get("listWish"));
			
			System.out.println("listWish  length::" + listWish.size()  + "listWish  :: " + listWish);
		
			Map<String , Object> map= movieService.getMovieList(search);
			List<Movie> movieList = (List) map.get("list");	
			System.out.println("listMovie length::" + movieList.size() + "listMovie :: " + movieList);
			
			for (int i = 0 ; i < movieList.size(); i++) {			
				for (int j = 0; j < listWish.size() ; j++) {				
						if (movieList.get(i).getMovieNo() == listWish.get(j).getMovie().getMovieNo()) {
							movieList.get(i).setWishList(listWish.get(j));
							System.out.println("movieList wishList exists (WishNo) :" + movieList.get(i).getWishList().getWishNo());
						}
				  }
			}
		
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);		
			
			System.out.println("search condition :: " + search.getSearchCondition());
			
			// Model 과 View 연결
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			System.out.println("list show ::"  + map.get("list"));
			
		} else {
			Map<String , Object> map= movieService.getMovieList(search);
			List<Movie> movieList = (List) map.get("list");	
			System.out.println("listMovie length::" + movieList.size() + "listMovie :: " + movieList);
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);	
			
			System.out.println("search condition :: " + search.getSearchCondition());
			
			// Model 과 View 연결
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			System.out.println("list show ::"  + map.get("list"));
		}
		
		
		// Business logic 수행
		// 관리자 검색인지 일반인 검색인지 확인하기 위한 조건 
		// "searchCondtion=7" 은 일반인 검색에  해당됨 		
		
		if(request.getParameter("menu").equals("movie")) {
			System.out.println("listMovie.jsp called");
			//modelAndView.setViewName("/movie/listMovie.jsp"); 
			return "forward:/movie/listMovie.jsp";
			// return modelAndView;
		}
		else  if(request.getParameter("menu").equals("manage")) {
			System.out.println("listMovieManage.jsp called");
			//modelAndView.setViewName("/movie/listMovieManage.jsp");
			return "forward:/movie/listMovieManage.jsp";
		}
		else  if(request.getParameter("menu").equals("calendar")) {
			System.out.println("calendar.jsp called");
			//modelAndView.setViewName("/movie/calendar.jsp");
			return "forward:/movie/calendar.jsp";
		}
		else if (request.getParameter("menu").equals("commingsoon")) {
			//modelAndView.setViewName("/movie/listCommingSoon.jsp");
			return "forward:/movie/listCommingSoon.jsp";
		}
		else if (request.getParameter("menu").equals("preview")) {
			//modelAndView.setViewName("/movie/listMoviePreview.jsp");
			return "forward:/movie/listMoviePreview.jsp";
		}
		else if (request.getParameter("menu").equals("search")) {
			//modelAndView.setViewName("/movie/listMovie.jsp");
			return "forward:/movie/listMovie.jsp";
		}
		else if (request.getParameter("menu").equals("voiceRegniiton")) {
			//modelAndView.setViewName("/movie/listMovie.jsp");
			return "forward:/movie/speechMovie.jsp";
		}
	
		return "forward:/movie/listMovie.jsp";
	}

	@RequestMapping(value = "getMovie")
	public String getMovie(@RequestParam(value = "menu", required = true) String menu,
			@RequestParam(value = "movieNo", required = true) Integer movieNo, @ModelAttribute Search search, Model model) throws Exception {

		System.out.println("/getMovie : GET");
		// Business Logic
		System.out.println("movieNo ::" + movieNo);

		Movie movie = movieService.getMovie(movieNo);
		//System.out.println(search+"searchhhhh");

		// System.out.println("Date format before :: openDate :: " +
		// movie.getOpenDt());

		// SimpleDateFormat dt = new SimpleDateFormat("yyyyy-mm-dd");
		// Date opendate = dt.parse(movie.getOpenDt().toString());
		// Date enddate = dt.parse(movie.getEndDt().toString());

		String steelCuts = movie.getSteelCut();
		System.out.println("steelCut" + steelCuts);

		steelCuts = CommonUtil.null2str(steelCuts);
		System.out.println("steelCuts null converted :: what ??" + steelCuts);

		if (!steelCuts.isEmpty()) {
			List<String> steelCutList = Arrays.asList(steelCuts.split(","));

			System.out.println("steelCutList length :: " + steelCutList.size());
			System.out.println("steelCutList isEmpty() :: " + steelCutList.isEmpty());

			if (!steelCutList.isEmpty()) {
				if (steelCutList.size() == 1) {
					String steelCut1 = steelCutList.get(0).toString();
					movie.setSteelCut1(steelCut1);
				} else if (steelCutList.size() == 2) {
					String steelCut1 = steelCutList.get(0).toString();
					movie.setSteelCut1(steelCut1);
					String steelCut2 = steelCutList.get(1).toString();
					movie.setSteelCut2(steelCut2);
				} else if (steelCutList.size() == 3) {
					String steelCut1 = steelCutList.get(0).toString();
					movie.setSteelCut1(steelCut1);
					String steelCut2 = steelCutList.get(1).toString();
					movie.setSteelCut2(steelCut2);
					String steelCut3 = steelCutList.get(2).toString();
					movie.setSteelCut3(steelCut3);
				}
			}

			System.out.println("Movie domain steelCut1 :" + movie.getSteelCut1());
			System.out.println("Movie domain steelCut2 :" + movie.getSteelCut2());
			System.out.println("Movie domain steelCut3 :" + movie.getSteelCut3());

		}

		// String convertOpenDate = dt.format(opendate).substring(1,11);
		// String convertEndDate = dt.format(enddate).substring(1,11);

		// movie.setOpenDt(convertOpenDate);
		// movie.setEndDt(convertEndDate);

		System.out.println("Date format check :: openDate :: " + movie.getOpenDt());

		// Model 과 View 연결
		model.addAttribute("movie", movie);
		model.addAttribute("search", search);

		if (menu.equals("manage")) {
			System.out.println("updateMovie.jsp called");
			System.out.println(movie + "겟무비액션");
			return "forward:/movie/updateMovie.jsp";
			
			
		} else {
			System.out.println(movie + "겟무비액션");
			// modelAndView.setViewName("/movie/getMovie.jsp");

			return "forward:/movie/getMovieCommentList/" + movieNo;
		}
	}
	
	//private final String PATH = "C:/Users/jeung/git/amc/amc/WebContent/images/movie/";
	//private final String PATH = "http://127.0.0.1:8080/images/movie/";
	//private final String PATH = "C:/amcPoster/";
	
	@RequestMapping (value ="updateMovie", method=RequestMethod.POST)
	public String updateMovie( 						
									 @ModelAttribute("movie") Movie movie,
									 MultipartHttpServletRequest multiPartRequest,
									 HttpServletRequest httpReq,												
									 Model model,
									 HttpSession session									
								   ) throws Exception {
		
		
		// Tomcat 서버가 실제 구동되는 위치 파일 
		// D:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp2\wtpwebapps\amc\images\movie
		
		String PATH = session.getServletContext().getRealPath("/")+"\\images\\movie\\";
		
		/**
		 * Upload Multi-files using Spring Controller
		 * 
		 * 테스트 용도로 로컬 경로로 지정했다가, 실제 Deploy할때는 서버 경로로 변경할 것
		 */
		System.out.println(movie);
		System.out.println("상대경로 : " + this.getClass().getResource("").getPath()); // 현재 자신의 절대 경로
		System.out.println("절대경로 : " + this.getClass().getResource("/").getPath()); // classes 폴더의 최상위 경로
		// System.out.println(this.getClass().getResource("/com/amc/config/config.properties").getPath()); 
		
		/**
		 * 실제 배포시 comment를 풀어야 함.
		 * 		
		 */
		//String uploadFiles = session.getServletContext().getRealPath("/images/movie");
		//System.out.println("session of getRealPath :"+session.getServletContext().getRealPath("/images/movie"));
		
		System.out.println("updateMovie Controller Start ===>>> ");
	
		
		ModelAndView modelAndView = new ModelAndView();
		
		Iterator<String> itr =  multiPartRequest.getFileNames();
	
		System.out.println("request.getFileNames() :" + multiPartRequest.getFileNames().toString());
		String dbFileNames = "";
		
        if(itr.hasNext()) {
        	List<MultipartFile> mpf = multiPartRequest.getFiles(itr.next());
                       
            for(int i = 0; i < mpf.size(); i++) {
            	
            	System.out.println("mpf.size()" + mpf.size());
            	
            	String fileNames = mpf.get(i).getOriginalFilename();
   
            	/**
        		 * 실제 배포시 comment를 풀어야 함.        		
        		 */
            	
            	//String fullPath = uploadFiles + "\\" + fileNames;
        		//System.out.println("fullPath"+fullPath);
        		
            	String delimeter = ",";
            	

            	fileNames = new String(fileNames.getBytes("8859_1"),"utf-8");
            	
            	        	
            	dbFileNames += fileNames + delimeter;
            	          	
                // File file = new File(PATH + mpf.get(i).getOriginalFilename());
                
            	//한글꺠짐 방지
            	/**
        		 * 실제 배포시 comment를 풀어야 함.        		
        		 */
               	//File file = new File(fullPath);
                
             	File file = new File(PATH + fileNames);
             	
                if(file.exists())
                {
                	System.out.println("file delete execute...");
                    file.delete();

                } else {
                
                // logger.info(file.getAbsolutePath());
                mpf.get(i).transferTo(file);
                
                System.out.println("fileName :: " + fileNames);
                }
            }
          
        System.out.println("dbFileNames testing....  " + dbFileNames);
   
        System.out.println("dirctor  : "  + movie.getDirector());
        System.out.println("actor    : "  + movie.getActors());
        System.out.println("genre    : "  + movie.getGenres());
        System.out.println("rating   : "  + movie.getWatchGradeNm());
        System.out.println("openDate : "  + movie.getOpenDt());
        System.out.println("RunningTime :"  + movie.getShowTm());
        System.out.println("EndDate : "  + movie.getEndDt());
        System.out.println("PostUrl : "  + movie.getPostUrl());
        
        System.out.println("synopsis :" + movie.getSynopsis());
        System.out.println("trailer  :" + movie.getTrailer());
           
        
		movie.setSteelCut(dbFileNames);
		
		System.out.println("fileName :" + movie.getSteelCut());
		
		
					
		movieService.updateMovie(movie);	
		
		//modelAndView.setViewName("/movie/updateMovie.jsp");
		//return modelAndView;
		
		return "forward:/movie/getMovieList?menu=manage";
		
	}
        return "forward:/movie/getMovieList?menu=manage";
  }

	@RequestMapping( value="deleteMovie", method=RequestMethod.POST)
	public String deleteMovie(@RequestParam(value="movieNo", required=true) Integer movieNo , 
								    Model model ) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/deleteMovie : GET");
		//Business Logic
		System.out.println("movieNo ::" + movieNo);
			
		int rtn = movieService.deleteMovie(movieNo);
		
		System.out.println("return value :" + rtn);
		
		//modelAndView.setViewName("/movie/listMovieManage.jsp");
		//return modelAndView;
		
		return "/movie/listMovieManage.jsp";
		
	}

	// 해림
	@RequestMapping(value = "getMovieCommentList/{movieNo}")
	public String getMovieCommentList(@ModelAttribute("search") Search search,
			@PathVariable(value = "movieNo") int movieNo, Model model) throws Exception {

		System.out.println("MovieController의 getMovieCommentList메소드 시작");

		System.out.println("1. movieNo ==> " + movieNo);
		System.out.println("2. search ==> " + search);
		
		ScreenContent screenContent = new ScreenContent();
		
		screenContent.setMovie(new Movie());
		screenContent.getMovie().setMovieNo(movieNo);
		
		System.out.println("#. screenContent --> "+ screenContent);
		
		int screenContentNo = screenService.checkScreenDupPreview(screenContent);
		if(screenContentNo != 0 ){
			screenContent.setScreenContentNo(screenContentNo);
		}
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		System.out.println("2-1. search ==> " + search);

		Map<String, Object> map = movieService.getMovieCommentList(search, movieNo);

		System.out.println("3. map ==> " + map);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		System.out.println("4. resultPage ==> " + resultPage);
		System.out.println("5. previewCheck ==> "+ screenContentNo);
		
		model.addAttribute("search", map.get("search"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("screenContent", screenContent);

		System.out.println("MovieController의 getMovieCommentList메소드 끝");

		return "forward:/movie/getMovie.jsp";
	}
	
	@RequestMapping( value="getWishList", method=RequestMethod.GET)
	public String getWishList(@ModelAttribute("Search")Search search, 
										HttpSession session,Model model) throws Exception {
		
		Map<String,Object> tempMap = new HashMap<String,Object>();
		
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		User user = (User)session.getAttribute("user");
		
		tempMap.put("search", search);
		tempMap.put("user", user);
		
		Map<String, Object> map = movieService.getWishList(tempMap);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
						pageUnit, pageSize);
		
		System.out.println("■■■위시리스트 확인■■■ : "+map.get("list"));
		
		model.addAttribute("search",search);
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("list", map.get("list"));
		
	    return "forward:/booking/listWishList.jsp";
	}

}

	
