package com.amc.web.alarm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
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

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.alarm.AlarmService;
import com.amc.service.domain.Alarm;
import com.amc.service.domain.ScreenContent;
import com.amc.service.domain.User;
import com.amc.web.booking.BookingRestController;

@Controller
@RequestMapping("/alarm/*")
public class AlarmController {
	
	@Autowired
	@Qualifier("alarmServiceImpl")
	private AlarmService alarmService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public AlarmController(){
		System.out.println("alarmController() default Constructor");
	}
	
	@RequestMapping(value="selectCancelAlarm", method=RequestMethod.POST)
	public String selectCancelAlarm(@ModelAttribute("screenContent") ScreenContent screenContent,
									 Model model) throws Exception{
		
		model.addAttribute("screeContent", screenContent);
		return "forward:/booking/selectCancelAlarm.jsp";	
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="getCancelAlarmList", method=RequestMethod.GET)
	public String getCancelAlarmList(@ModelAttribute("Search")Search search,@RequestParam("alarmFlag")String alarmFlag,
										HttpSession session,Model model) throws Exception{
		
		Map<String,Object> tempMap = new HashMap<String,Object>();
		
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		User user = (User)session.getAttribute("user");
		
		tempMap.put("search", search);
		tempMap.put("user", user);
		tempMap.put("alarmFlag", alarmFlag);
		System.out.println("리스트 불러올때 alarmFlag"+alarmFlag);
		
		Map<String, Object> map = alarmService.getCancelAlarmList(tempMap);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
						pageUnit, pageSize);
		
		BookingRestController brc = new BookingRestController();
		
		List<Alarm> seatChangeList = (List<Alarm>)(map.get("list"));
		
		JSONObject jsonObject = new JSONObject();
		
		for(int i = 0; i < seatChangeList.size(); i++){
			jsonObject = (JSONObject)JSONValue.parse(brc.getSeatNo(seatChangeList.get(i).getAlarmSeatNo(), 10, model));
			seatChangeList.get(i).setAlarmSeatNo((String)jsonObject.get("seatNo"));
		}
		
		System.out.println("■■■취소알람확인■■■ : "+map.get("list"));
		
		model.addAttribute("search",search);
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("list", map.get("list"));
		
	    return "forward:/alarm/listCancelAlarm.jsp";
	}
	
	@RequestMapping( value="getOpenAlarmList", method=RequestMethod.GET)
	public String getOpenAlarmList(@ModelAttribute("Search")Search search, @RequestParam("alarmFlag")String alarmFlag,
										HttpSession session,Model model) throws Exception {
		
		Map<String,Object> tempMap = new HashMap<String,Object>();
		
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		User user = (User)session.getAttribute("user");
		
		tempMap.put("search", search);
		tempMap.put("user", user);
		tempMap.put("alarmFlag", alarmFlag);
		System.out.println("리스트 불러올때 alarmFlag"+alarmFlag);
		
		Map<String, Object> map = alarmService.getOpenAlarmList(tempMap);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
						pageUnit, pageSize);
		
		System.out.println("■■■오픈알람확인■■■ : "+map.get("list"));
		
		model.addAttribute("search",search);
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("list", map.get("list"));
		
	    return "forward:/alarm/listOpenAlarm.jsp";
	}
	
	@RequestMapping("/codePush/{type}")
	public String codePush(@PathVariable("type")String type,
						@RequestParam(value="serialNo",defaultValue="")String serialNo,
						@RequestParam(value="userId",defaultValue="")String userId,
						@RequestParam(value="alarmSeatNo",defaultValue="")String alarmSeatNo,
						Model model) throws Exception{
			
		System.out.println("AlarmRestController.java 의 codePush 메소드"); 
		if(!type.equals("") || type !=null){
			
			System.out.println("AlarmRestController :: " +type+","+serialNo+","+userId+","+alarmSeatNo);
			
			String smsResult = alarmService.smsPush(type,serialNo,userId,alarmSeatNo);
			
			if(!type.equals("userCertification") && !type.equals("booking")){
				String pushResult = alarmService.appPush(type, serialNo, userId, alarmSeatNo);
			}
		}
		model.addAttribute("serialNo",serialNo);
		
		return  "forward:/user/authForm.jsp";
		
	}

}

	

