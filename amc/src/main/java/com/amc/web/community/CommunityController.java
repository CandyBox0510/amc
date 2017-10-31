package com.amc.web.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.amc.service.community.CommunityService;
import com.amc.service.domain.FreeBoard;

@Controller
@RequestMapping("/community/*")
public class CommunityController {
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value = "addFreeBoard", method = RequestMethod.POST)
	public String addFreeBoard(@ModelAttribute("freeBoard") FreeBoard freeBoard, Model model) {
		
		System.out.println("CommunityController�� addFreeBoard POST ����");
		System.out.println("1. freeBoard ==> "+ freeBoard);
		communityService.addFreeBoard(freeBoard);
		model.addAttribute("freeBoard", freeBoard);
		System.out.println("CommunityController�� addFreeBoard POST ��");

		return "forward:/community/getFreeBoardList";
	};
	
	@RequestMapping(value = "updateFreeBoard", method = RequestMethod.GET)
	public String updateFreeBoard(@ModelAttribute("freeBoard") FreeBoard freeBoard, @RequestParam("freeBoardNo") int freeBoardNo, Model model) {
		
		System.out.println("CommunityController�� updateFreeBoard GET ����");
		System.out.println("1. freeBoard ==> "+ freeBoard);
		System.out.println("2. freeBoardNo ==> "+ freeBoardNo);
		communityService.getFreeBoard(freeBoardNo);
		model.addAttribute("freeBoard", freeBoard);
		System.out.println("CommunityController�� updateFreeBoard GET ��");

		return "forward:/community/updateFreeBoard.jsp";
	};
	
	
	@RequestMapping(value = "updateFreeBoard", method = RequestMethod.POST)
	public String updateFreeBoard(@ModelAttribute("freeBoard") FreeBoard freeBoard, Model model) {
		
		System.out.println("CommunityController�� updateFreeBoard POST ����");
		System.out.println("1. freeBoard ==> "+ freeBoard);
		communityService.updateFreeBoard(freeBoard);
		model.addAttribute("freeBoard", freeBoard);
		System.out.println("CommunityController�� updateFreeBoard POST ��");

		return "forward:/community/getFreeBoardList";
	};
	
	@RequestMapping(value = "getFreeBoard", method = RequestMethod.GET)
	public String getFreeBoard(@ModelAttribute("freeBoard") FreeBoard freeBoard, @RequestParam("freeBoardNo") int freeBoardNo, Model model) {
		
		System.out.println("CommunityController�� getFreeBoard GET ����");
		System.out.println("1. freeBoard ==> "+ freeBoard);
		System.out.println("2. freeBoardNo ==> "+ freeBoardNo);
		communityService.getFreeBoard(freeBoardNo);
		model.addAttribute("freeBoard", freeBoard);
		System.out.println("CommunityController�� getFreeBoard GET ��");

		return "forward:/community/getFreeBoard.jsp";
	};
	
	
	
	@RequestMapping(value = "getFreeBoardList")
	public String getFreeBoardList(@ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("CommunityController�� getFreeBoardList  ����");


		System.out.println("1. search ==> " + search);
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		System.out.println("2. search ==> " + search);

		List<FreeBoard> list = communityService.getFreeBoardList(search);

		System.out.println("3. list ==> " + list);
		int totalCount = communityService.getTotalCount(search);
		
		System.out.println("4. totalCount ==> " + totalCount);

		Page resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);
		System.out.println("5. resultPage ==> " + resultPage);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		map.put("resultPage", resultPage);
		map.put("search", search);
	
		System.out.println("5. Map ==> "+ map);
		
		model.addAttribute("search", map.get("search"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("resultPage", resultPage);

		System.out.println("MovieController�� getMovieCommentList�޼ҵ� ��");

		return "forward:/community/listFreeBoard.jsp";
	}
	
	
	
	
}
