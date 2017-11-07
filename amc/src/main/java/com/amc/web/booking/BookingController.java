package com.amc.web.booking;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.amc.service.alarm.AlarmService;
import com.amc.service.booking.BookingService;
import com.amc.service.cinema.CinemaService;
import com.amc.service.domain.Booking;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;
import com.amc.service.domain.User;
import com.amc.service.movie.MovieService;
import com.amc.service.screen.ScreenService;
import com.amc.service.user.UserService;
import com.amc.web.cinema.HttpRequestToNode;

@Controller
@RequestMapping("/booking/*")
public class BookingController {
	
	///Field
	@Autowired
	@Qualifier("bookingServiceImpl")
	private BookingService bookingService;
	@Autowired
	@Qualifier("screenServiceImpl")
	private ScreenService screenService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	@Qualifier("cinemaServiceImpl")
	private CinemaService cinemaService;
	@Autowired
	@Qualifier("movieServiceImpl")
	private MovieService movieService;
	@Autowired
	@Qualifier("alarmServiceImpl")
	private AlarmService alarmService;
	
	///Constructor
	public BookingController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///Method
	//예매1단계(영화)
	@RequestMapping( value="getScreenMovieList", method=RequestMethod.GET)
	public String getScreenMovieList(Model model) throws Exception{
		
		System.out.println("/booking/getScreenMovieList : GET");
		
		List<Movie> movieList = bookingService.getScreenMovieList();
		model.addAttribute("movieList", movieList);
		
		return "forward:/booking/selectScreenMoive.jsp";
	}
	
	//예매1단계(시사회)
	@RequestMapping( value="getPreviewList", method=RequestMethod.GET)
	public String getPreviewList(Model model) throws Exception{
		
		System.out.println("/booking/getPreviewList : GET");
		
		List<ScreenContent> screenContentList = bookingService.getPreviewList();
		model.addAttribute("screenContentList", screenContentList);
		
		return "forward:/booking/selectPreview.jsp";
	}
	
	//예매2단계 : 랜덤 좌석선택
	@RequestMapping( value="selectRandomSeat", method=RequestMethod.GET)
	public String selectRandomSeat(@RequestParam("screenContentNo") String screenContentNo,
			@RequestParam("headCount") int headCount, Model model) throws Exception{
		
		System.out.println("/booking/selectRandomSeat : GET");
		ScreenContent screenContent = screenService.getScreenContent(Integer.parseInt(screenContentNo));
		model.addAttribute("screenContent",screenContent);
		model.addAttribute("headCount", headCount);

		return "forward:/booking/selectRandomSeat.jsp";
	}
	
	//예매2단계 :기본 좌석선택
	@RequestMapping( value="selectSeat", method=RequestMethod.GET)
	public String selectSeat(@RequestParam("screenContentNo") int screenContentNo,
															Model model) throws Exception{
		
		System.out.println("/booking/selectSeat : GET");
		
		ScreenContent screenContent = screenService.getScreenContent(screenContentNo);		
		Movie movie = movieService.getMovie(screenContent.getMovie().getMovieNo());
		
		model.addAttribute("screenContent",screenContent);
		model.addAttribute("movie", movie);

		return "forward:/booking/selectSeat.jsp";
	}

	//예매3단계 (결제완료) QR보내기
	@RequestMapping( value="addBooking", method=RequestMethod.POST)
	public String addBooking(@ModelAttribute("booking") Booking booking,
							 @RequestParam("displaySeat") String displaySeat,
							 HttpSession session, Model model) throws Exception{	
		System.out.println("/booking/requestPay : POST");
		
		ScreenContent screenContent = screenService.getScreenContent(booking.getScreenContentNo());		
		Movie movie = movieService.getMovie(screenContent.getMovie().getMovieNo());
		
		booking.setMovie(movie);
		booking.setScreenContent(screenContent);
		
		//1. ADD booking
		System.out.println("insert하려는 booking : "+booking);
		bookingService.addBooking(booking);
		
		//2. GET booking
		booking = bookingService.getBookingByInfo(booking);
		System.out.println("add 후 no까지 포함된 booking : " + booking);
		
		//3. ADD statistic
		User user = (User) session.getAttribute("user");
		bookingService.updateStatistic(user, booking);
		
		model.addAttribute("booking",booking);		
		model.addAttribute("displaySeat", displaySeat);
		return "forward:/booking/addBooking.jsp";
	}
	
	
	//예매상세조회
	@RequestMapping( value="getBooking", method=RequestMethod.GET)
	public String getBooking(@RequestParam("bookingNo") String bookingNo, 
												Model model) throws Exception{

		System.out.println("/booking/getBooking : GET");
		
		Booking booking = bookingService.getBooking(bookingNo); 
		model.addAttribute("booking", booking);
		
		return "forward:/booking/getBooking.jsp";
	}
	
	//예매취소
	@RequestMapping( value="deleteBooking", method=RequestMethod.GET)
	public String deleteBooking(@RequestParam("bookingNo") String bookingNo,
								HttpSession session, Model model) throws Exception{
		System.out.println("/booking/deleteBooking : GET");
		
		//1. 환불조치 성공시
		Booking booking = bookingService.getBooking(bookingNo);
		int screenContentNo = booking.getScreenContentNo();
		String alarmSeats = booking.getBookingSeatNo();	

		//2. 예매통계 업데이트하기 
		User user = (User) session.getAttribute("user");
		booking.setHeadCount(booking.getHeadCount()*(-1));
		bookingService.updateStatistic(user,booking);
		System.out.println("2. 예매 통계 롤백 완료");
		
		//3. 몽고DB 삭제  & 오라클DB 삭제 
		if(bookingService.deleteBooking(bookingNo) ==1){
			System.out.println("3. 예매 내역삭제, 좌석현황 롤백 완료");
		}else{
			System.out.println("3. 예매 내역, 좌석현황 롤백 실패");
		}
		
		//4. 취소표 알리미 발송하기	
		int length = (alarmSeats.split(",").length)/2;
		for(int i=0;i<length;i+=2){						
			String seat = alarmSeats.substring(i, i+2);
			alarmService.smsPush("cancelAlarm", screenContentNo+"", user.getUserId(),seat);
		}		
		
		return "redirect:/booking/getAdminBookingList";			
	}
	
	//관리자 예매목록조회
	@RequestMapping( value="getAdminBookingList")
	public String getAdminBookingList(@ModelAttribute("Search") Search search,
												Model model) throws Exception{
		System.out.println("/booking/getAdminBookingList : GET");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
			
		Map<String, Object> map= bookingService.getBookingList(search); 
		
		Page resultPage = new Page( search.getCurrentPage(), 
				((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
	
		return "forward:/booking/listBookingAdmin.jsp";
	}
	
	//회원용 예매목록조회
	@RequestMapping( value="getBookingList", method=RequestMethod.GET)
	public String getBookingList(@ModelAttribute("Search")Search search,HttpSession session,Model model) throws Exception {
		
		Map<String,Object> tempMap = new HashMap<String,Object>();
		
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		User user = (User)session.getAttribute("user");
		
		tempMap.put("search", search);
		tempMap.put("user", user);
		
		Map<String, Object> map = bookingService.getUserBookingList(tempMap);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
						pageUnit, pageSize);
		
		model.addAttribute("search",search);
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("list", map.get("list"));
		
	    return "forward:/booking/listBooking.jsp";
	}
	
	
	@RequestMapping( value="testCode", method=RequestMethod.GET)
	public String testCode(HttpSession session) throws Exception {
		
		String screenContentNo = "10303";
		String seats = "2,8,9,10";
		
		String urlStr = "http://localhost:52273/deleteResv";
		String body = "screencontent_no="+screenContentNo+"&seat="+seats;
		HttpRequestToNode.httpRequest(urlStr, body);
	    
	    return "redirect:/booking/getPreviewList";
	}
	
	@RequestMapping(value="sendEmailQR", method=RequestMethod.GET)
	public String sendEmailQR(@RequestParam("bookingNo") String bookingNo, 
						@RequestParam("userEmailAddr") String userEmailAddr, Model model) throws Exception{			

		
		Booking booking = bookingService.getBooking(bookingNo);

    	String subject = "AMC에서 예매하신 내역입니다.";	
    	StringBuilder sb = new StringBuilder();        
        sb.append("회원님의 예매정보가 있는 QR코드입니다.<br/>" );
        sb.append("<a href=http://127.0.0.1:8080/user/addUser?email="+userEmailAddr+">");
        sb.append("<img src='"+booking.getQrUrl()+"'/></a>");        
        
        userService.send(subject, sb.toString(), "bitcampamc@gmail.com", userEmailAddr, null);
		
		return  "forward:/index.jsp";
	}
	
}
