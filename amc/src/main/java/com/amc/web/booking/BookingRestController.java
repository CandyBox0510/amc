package com.amc.web.booking;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.booking.BookingService;
import com.amc.service.cinema.CinemaService;
import com.amc.service.domain.Booking;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;
import com.amc.service.domain.User;
import com.amc.service.screen.ScreenService;
import com.amc.service.user.UserService;
import com.amc.web.cinema.HttpRequestToNode;

@RestController
@RequestMapping("/booking/*")
public class BookingRestController {
	
		///Field
		@Autowired
		@Qualifier("bookingServiceImpl")
		private BookingService bookingService;
		
		///Field
		@Autowired
		@Qualifier("screenServiceImpl")
		private ScreenService screenService;
		
		///Field
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		@Autowired
		@Qualifier("cinemaServiceImpl")
		private CinemaService cinemaService;
		//setter Method ���� ����
		
		@Value("#{commonProperties['pageUnit']}")
		// @Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;

		@Value("#{commonProperties['pageSize']}")
		// @Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		ObjectMapper objMapper = new ObjectMapper();
		
		public BookingRestController() {
			System.out.println(this.getClass());
		}
		
		//�ȵ���̵忡 ���� JSONData�� ������ִ� method
		public String toJSONString(Object obj) throws Exception{
									
			String jsonList = objMapper.writeValueAsString(obj);			
			
			return new String(jsonList.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		//�ȵ���̵� �׽�Ʈ��
		@RequestMapping( value="json/testAndroid",  method=RequestMethod.POST)
		public String testAndroid() throws Exception{
			
			System.out.println("json/booking/testAndroid : GET");
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("name", "yena");
			jsonObj.put("subject", "computer");
			String sendJson = jsonObj.toString();			
			
			return sendJson;
		}
		
		//[Android] ����1�ܰ� : ��ȭ����
		@RequestMapping( value="json/getScreenMovieList", method=RequestMethod.POST)
		public String getScreenMovieList(Model model) throws Exception{
			
			System.out.println("json/booking/getScreenMovieList : GET");
			
			List<Movie> movieList = bookingService.getScreenMovieList();			
			
			return this.toJSONString(movieList);
		}
		
		//[Android] ����1�ܰ� : ��¥����
		@RequestMapping(value="json/getScreenDateJSON/{movieNo}/{flag}", method=RequestMethod.GET)
		public String getScreenDateJSON(@PathVariable("movieNo") int movieNo, 
											@PathVariable("flag") String flag, 
													Model model) throws Exception{

	        Calendar calendar = Calendar.getInstance();
	        String today =  new SimpleDateFormat("yy/MM/dd").format(calendar.getTime());
	  
	        Search search = new Search();
	        search.setSearchCondition(flag);
	        search.setSearchKeyword(today);
	        System.out.println(":::::::movieNo : "+movieNo);
	        List<ScreenContent> list = screenService.getScreenContentList2(search, movieNo);
			
	        return this.toJSONString(bookingService.getScreenDateList(list));
		}
		
		//[Android] ����1�ܰ� : �ð� ����
		@RequestMapping(value="json/getScreenTimeJSON/{screenDate}", method=RequestMethod.GET)
		public String getScreenTimeJSON(@PathVariable("screenDate") String screenDate, 
													Model model) throws Exception{			
			return this.toJSONString(bookingService.getScreenTimeList(screenDate));
		}
		
		//����1�ܰ� ��¥����
		@RequestMapping(value="json/getScreenDate/{movieNo}/{flag}", method=RequestMethod.GET)
		public List<String> getScreenDate(@PathVariable("movieNo") int movieNo, 
											@PathVariable("flag") String flag, 
													Model model) throws Exception{

	        Calendar calendar = Calendar.getInstance();
	        String today =  new SimpleDateFormat("yy/MM/dd").format(calendar.getTime());
	  
	        Search search = new Search();
	        search.setSearchCondition(flag);
	        search.setSearchKeyword(today);
	        System.out.println(":::::::movieNo : "+movieNo);
	        List<ScreenContent> list = screenService.getScreenContentList2(search, movieNo);

			return bookingService.getScreenDateList(list);
		}
		
		//����1�ܰ� �ð�����
		@RequestMapping(value="json/getScreenTime/{screenDate}", method=RequestMethod.GET)
		public List<ScreenContent> getScreenTime(@PathVariable("screenDate") String screenDate, 
													Model model) throws Exception{			
			return bookingService.getScreenTimeList(screenDate);
		}
		
		@RequestMapping(value="json/getDisplaySeatNo/{seatNo}/{ticketPrice}", method=RequestMethod.GET)
		public String getSeatNo(@PathVariable("seatNo") String seatNo, 
								@PathVariable("ticketPrice") int ticketPrice, Model model) throws Exception{		
			String[] strArray = seatNo.split(",");
			String displaySeat = "";
			int k=0;
	        for(int i=0;i<(strArray.length/2);i++){	        	
	            // �ƽ�Ű �ڵ带 ���������� ��ȯ
	        	int no = Integer.parseInt(strArray[k])+65;	        	
	            String displaySeatNo = Character.toString ((char) no);
	            displaySeat += displaySeatNo + strArray[k+1]+" ";
	            System.out.println("k : "+k+", displaySeat : "+displaySeat);
	            k+=2;
	        }
	        int headCount = (StringUtils.countOccurrencesOf(seatNo, ",")+1)/2;
	        
	        JSONObject jsonObj = new JSONObject();
	        jsonObj.put("seatNo", displaySeat);
	        jsonObj.put("headCount", headCount);
	        jsonObj.put("totalPrice",ticketPrice*headCount);
	        
			return (jsonObj.toString());
		}

		@RequestMapping(value="/json/confirmSeat/{clientId}", method=RequestMethod.GET)
		public int confirmSeat(@PathVariable("clientId") String clientId, Model model) throws Exception{
			
	
			String urlStr = "http://localhost:52273/confirmSeat";
			String body = "clientId="+clientId;
			
			try {
				int responseCode = HttpRequestToNode.httpRequest(urlStr, body);
				if(responseCode ==200){
					System.out.println("����DB���� ����Ȯ���� �����Ͽ����ϴ�.");
					return 1;
				}else{
					System.out.println("����DB���� ����Ȯ���� �����Ͽ����ϴ�.");
					return -1;
				}				
			} catch (Exception e) {
				System.out.println("����DB�� �����ֳ����ϴ�!");
				return -1;
			}
		}
		
		@RequestMapping(value="json/rollbackSeat/{screenContentNo}/{seatNo}/{clientId}", method=RequestMethod.GET)
		public int rollbackSeat(@PathVariable("screenContentNo") int screenContentNo, 
								@PathVariable("seatNo") String seatNo, 
								@PathVariable("clientId") String clientId, Model model) throws Exception{
			
	
			String urlStr = "http://localhost:52273/deleteResv";
			String body = "screenNo="+screenContentNo+"&seat="+seatNo+"&clientId="+clientId;
			
			try {
				int responseCode = HttpRequestToNode.httpRequest(urlStr, body);
				if(responseCode ==200){
					System.out.println("����DB���� ���� ��Ҹ� �����Ͽ����ϴ�.");
					return 1;
				}else{
					System.out.println("����DB���� ���� ��Ҹ� �����Ͽ����ϴ�.");
					return -1;
				}				
			} catch (Exception e) {
				System.out.println("����DB�� �����ֳ����ϴ�!");
				return -1;
			}
		
		}
		
		@RequestMapping(value="/json/refundBooking/{bookingNo}", method=RequestMethod.GET)
		public String refundBooking(@PathVariable("bookingNo") String bookingNo, Model model) throws Exception{
			
			Booking booking = bookingService.getBooking(bookingNo);
			String status = cinemaService.cancelPay(booking.getImpId());
			if(status.equals("cancelled")){			
				System.out.println("1. ȯ�� �Ϸ�");
				return "refunded";
			}else{
				return "failRefund";
			}

		}
		
		//ȸ���� ���Ÿ����ȸ
		@SuppressWarnings("unchecked")
		@RequestMapping(value="/json/getBookingList")
		public Map<String,Object> getBookingList(@ModelAttribute("Search")Search search,HttpSession session,
										@RequestBody String jsonString, Model model) throws Exception {
			
			Map<String,Object> tempMap = new HashMap<String,Object>();
			
			JSONObject jo = (JSONObject)JSONValue.parse(jsonString);
			System.out.println((Long)(jo.get("currentPage")));
			System.out.println((String)(jo.get("searchCondition")));
			String searchCondition = (String)(jo.get("searchCondition"));
			search.setCurrentPage(Math.toIntExact((Long)jo.get("currentPage")));
			search.setSearchCondition(searchCondition);
			
			if(search.getCurrentPage()==0){
				search.setCurrentPage(1);
			}
			
			int pageSize = 12;
			
			search.setPageSize(pageSize);
			User user = (User)session.getAttribute("user");
			
			tempMap.put("search", search);
			tempMap.put("user", user);
			
			Map<String, Object> map = bookingService.getUserBookingList(tempMap);
			
			Page resultPage	= 
					new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
							pageUnit, pageSize);
			
			BookingRestController brc = new BookingRestController();
			
			List<Booking> seatChangeList = (List<Booking>)(map.get("list"));
			
			JSONObject jsonObject = new JSONObject();
			
			for(int i = 0; i < seatChangeList.size(); i++){
				jsonObject = (JSONObject)JSONValue.parse(brc.getSeatNo(seatChangeList.get(i).getBookingSeatNo(), 10, model));
				seatChangeList.get(i).setBookingSeatNo((String)jsonObject.get("seatNo"));
			}
			
		    return map;
		}
}




