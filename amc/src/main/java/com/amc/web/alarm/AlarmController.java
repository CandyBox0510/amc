package com.amc.web.alarm;

import java.util.HashMap;
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
import com.amc.service.domain.ScreenContent;
import com.amc.service.domain.User;

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

}

	

