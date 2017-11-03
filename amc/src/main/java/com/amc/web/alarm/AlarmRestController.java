package com.amc.web.alarm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.codehaus.jettison.json.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.alarm.AlarmService;
import com.amc.service.domain.Alarm;
import com.amc.service.domain.User;


@RestController
@RequestMapping("/alarm/*")
public class AlarmRestController {
	
	@Autowired
	@Qualifier("alarmServiceImpl")
	AlarmService alarmService;
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public AlarmRestController() {
		System.out.println("PurchaseController() default Constructor");
		
	}
	
	@RequestMapping("/json/addCancelAlarm")
	public String addCancelAlarm(@ModelAttribute("alarm")Alarm alarm){
		return alarmService.addCancelAlarm(alarm);
	}
	
	@RequestMapping("/json/switchOpenAlarm")
	public String switchOpenAlarm(@ModelAttribute("alarm")Alarm alarm){
		return alarmService.switchOpenAlarm(alarm);
	}
	
	@RequestMapping("/json/deleteCancelAlarm")
	public int deleteCancelAlarm(@ModelAttribute("alarm")Alarm alarm){
		return alarmService.deleteCancelAlarm(alarm);
	}
	
	@RequestMapping("/json/deleteOpenAlarm")
	public int deleteOpenAlarm(@ModelAttribute("alarm")Alarm alarm){
		return alarmService.deleteOpenAlarm(alarm);
	}
	
	@RequestMapping("/json/push/{type}")
	public String push(@PathVariable("type")String type,
						@RequestParam(value="serialNo",defaultValue="")String serialNo,
						@RequestParam(value="userId",defaultValue="")String userId,
						@RequestParam(value="alarmSeatNo",defaultValue="")String alarmSeatNo
						) throws Exception{
		
		System.out.println("AlarmRestController :: " +type+","+serialNo+","+userId );
		
		String smsResult = alarmService.smsPush(type,serialNo,userId,alarmSeatNo);
		
		String pushResult = alarmService.appPush(type, serialNo, userId, alarmSeatNo);
		
		return null;
	}
	
	@RequestMapping(value="/json/getInfiCancelAlarmList/{userId:.+}")
	public String getInfiCancelAlarmList(@ModelAttribute("Search")Search search,
											@PathVariable("userId") String userId,
											@RequestBody String jsonString,
											HttpSession session,Model model) throws Exception{
		
		Map<String,Object> tempMap = new HashMap<String,Object>();
		String alarmFlag = "";
		
		JSONObject jo = (JSONObject)JSONValue.parse(jsonString);
		System.out.println((Long)(jo.get("currentPage")));
		System.out.println((String)(jo.get("alarmFlag")));
		search.setCurrentPage(Math.toIntExact((Long)jo.get("currentPage")));
		alarmFlag = (String)(jo.get("alarmFlag"));
		
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		
		int pageSize = 12;
		
		search.setPageSize(pageSize);
		User user = (User)session.getAttribute("user");
		
		tempMap.put("search", search);
		tempMap.put("user", user);
		tempMap.put("alarmFlag", alarmFlag);
		
		Map<String, Object> map = alarmService.getCancelAlarmList(tempMap);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
						pageUnit, pageSize);
		
		System.out.println("■■■취소알람확인■■■ : "+map.get("list"));
		
		model.addAttribute("search",search);
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("list", map.get("list"));
		
	    return "forward:/alarm/listCacnelAlarm.jsp";
	}
	
	@RequestMapping( value="/json/getInfiOpenAlarmList/{userId:.+}")
	public String getInfiOpenAlarmList(@ModelAttribute("Search")Search search, 
										   @PathVariable("userId") String userId,
										   @RequestBody String jsonString,
										   HttpSession session,Model model) throws Exception {
		
		Map<String,Object> tempMap = new HashMap<String,Object>();
		String alarmFlag = "";
		
		JSONObject jo = (JSONObject)JSONValue.parse(jsonString);
		System.out.println((Long)(jo.get("currentPage")));
		System.out.println((String)(jo.get("alarmFlag")));
		search.setCurrentPage(Math.toIntExact((Long)jo.get("currentPage")));
		alarmFlag = (String)(jo.get("alarmFlag"));
		
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		
		int pageSize = 12;
		
		search.setPageSize(pageSize);
		User user = (User)session.getAttribute("user");
		
		tempMap.put("search", search);
		tempMap.put("user", user);
		tempMap.put("alarmFlag", alarmFlag);
		
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
	
}
