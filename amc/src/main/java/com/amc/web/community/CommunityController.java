package com.amc.web.community;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.community.CommunityService;
import com.amc.service.domain.Comment;
import com.amc.service.domain.FreeBoard;
import com.amc.service.domain.User;

@Controller
@RequestMapping("/community/*")
public class CommunityController {
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;

	/*
	 * @Autowired
	 * 
	 * @Qualifier("communityUploadFile") private FileSystemResource fsr;
	 */

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping(value = "addFreeBoard", method = RequestMethod.POST)
	public String addFreeBoard(@ModelAttribute("freeBoard") FreeBoard freeBoard, @RequestParam("userId") String userId,
			@RequestParam(value = "imageFile", required = false) MultipartFile imageFile, Model model,
			HttpServletRequest request) throws IOException {

		System.out.println("CommunityController의 addFreeBoard POST 시작");
		System.out.println("0. userId ==> " + userId);

		System.out.println("0.0 imageFile ==> " + imageFile);

		String rootPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println("rootPath => " + rootPath);
		String attachPath = "images/community/";
		String fileName = imageFile.getOriginalFilename();
		// String date = new Date().toString();
		// System.out.println("date == > " + date);

		fileName = URLEncoder.encode(fileName, "EUC-KR");
		// fileName= new String(fileName.getBytes(), "iso_8859_1");

		System.out.println("???>>>>>>>>" + fileName.indexOf("%"));
		long date = new Date().getTime();

		String time = String.valueOf(date);
		System.out.println("time === > " + time);

		if (fileName.indexOf("%") != -1) {
			fileName = fileName.replaceAll("%", "");
		}

		fileName = time + fileName ;
		File file = new File(rootPath + attachPath + fileName);
		System.out.println("fileName===> " + fileName);

		System.out.println("file ==> " + file);

		if (!(imageFile.isEmpty())) {
			imageFile.transferTo(file);
			freeBoard.setFreeBoardImage(fileName);
		} else {
			freeBoard.setFreeBoardImage("");
		}

		/*
		 * if(!(imageFile.isEmpty())){ FileOutputStream fos = new
		 * FileOutputStream(new File(fsr.getPath(),
		 * imageFile.getOriginalFilename())); fos.write(imageFile.getBytes());
		 * fos.flush(); fos.close();
		 * 
		 * freeBoard.setFreeBoardImage(imageFile.getOriginalFilename()); }else{
		 * freeBoard.setFreeBoardImage(""); }
		 * 
		 */
		User user = new User();
		user.setUserId(userId);
		freeBoard.setUser(user);

		System.out.println("1. freeBoard ==> " + freeBoard);
		String freeBoardContent = freeBoard.getFreeBoardContent();
		System.out.println("1.1 freeBoardContent ==> " + freeBoardContent);
		freeBoardContent = freeBoardContent.replaceAll("\r\n", "<BR>");
		freeBoard.setFreeBoardContent(freeBoardContent);
		communityService.addFreeBoard(freeBoard);
		model.addAttribute("freeBoard", freeBoard);
		System.out.println("CommunityController의 addFreeBoard POST 끝");

		return "redirect:/community/getFreeBoardList";
	};

	@RequestMapping(value = "updateFreeBoard", method = RequestMethod.GET)
	public String updateFreeBoard(@RequestParam("freeBoardNo") int freeBoardNo, Model model) {

		System.out.println("CommunityController의 updateFreeBoard GET 시작");
		System.out.println("1. freeBoardNo ==> " + freeBoardNo);
		FreeBoard freeBoard = communityService.getFreeBoard(freeBoardNo);
		System.out.println("2. freeBoard ==> " + freeBoard);
		model.addAttribute("freeBoard", freeBoard);
		System.out.println("CommunityController의 updateFreeBoard GET 끝");

		return "forward:/community/updateFreeBoard.jsp";
	};

	@RequestMapping(value = "updateFreeBoard", method = RequestMethod.POST)
	public String updateFreeBoard(@ModelAttribute("freeBoard") FreeBoard freeBoard,
			@RequestParam("userId") String userId,
			@RequestParam(value = "imageFile", required = false) MultipartFile imageFile, Model model,
			HttpServletRequest request) throws IOException {

		System.out.println("0. userId ==> " + userId);

		System.out.println("0.0 imageFile ==> " + imageFile);

		String rootPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println("rootPath => " + rootPath);
		String attachPath = "images/community/";
		String fileName = imageFile.getOriginalFilename();

		fileName = URLEncoder.encode(fileName, "EUC-KR");
		// fileName= new String(fileName.getBytes(), "iso_8859_1");

		System.out.println("???>>>>>>>>" + fileName.indexOf("%"));
		long date = new Date().getTime();

		String time = String.valueOf(date);
		System.out.println("time === > " + time);

		if (fileName.indexOf("%") != -1) {
			fileName = fileName.replaceAll("%", "");
		}

		fileName = time + fileName ;
		File file = new File(rootPath + attachPath + fileName);
		System.out.println("fileName===> " + fileName);

		System.out.println("file ==> " + file);

		if (!(imageFile.isEmpty())) {
			imageFile.transferTo(file);
			freeBoard.setFreeBoardImage(fileName);
		}

		/*
		 * if(!(imageFile.isEmpty())){ FileOutputStream fos = new
		 * FileOutputStream(new File(fsr.getPath(),
		 * imageFile.getOriginalFilename())); fos.write(imageFile.getBytes());
		 * fos.flush(); fos.close();
		 * 
		 * freeBoard.setFreeBoardImage(imageFile.getOriginalFilename()); }
		 */

		User user = new User();
		user.setUserId(userId);
		freeBoard.setUser(user);

		System.out.println("1. freeBoard ==> " + freeBoard);
		String freeBoardContent = freeBoard.getFreeBoardContent();
		System.out.println("1.1 freeBoardContent ==> " + freeBoardContent);
		freeBoardContent = freeBoardContent.replaceAll("\r\n", "<BR>");
		freeBoard.setFreeBoardContent(freeBoardContent);

		communityService.updateFreeBoard(freeBoard);
		model.addAttribute("freeBoard", freeBoard);
		System.out.println("CommunityController의 updateFreeBoard POST 끝");

		return "redirect:/community/getFreeBoardList";
	};

	@RequestMapping(value = "getFreeBoard", method = RequestMethod.GET)
	public String getFreeBoard(@RequestParam("freeBoardNo") int freeBoardNo, Model model) {

		System.out.println("CommunityController의 getFreeBoard GET 시작");

		System.out.println("1. freeBoardNo ==> " + freeBoardNo);
		FreeBoard freeBoard = communityService.getFreeBoard(freeBoardNo);
		System.out.println("2. freeBoard ==> " + freeBoard);

		System.out.println("CommunityController의 getFreeBoard GET 끝");

		model.addAttribute("freeBoard", freeBoard);

		return "forward:/community/freeBoardCommentList";
	};

	@RequestMapping(value = "getFreeBoardList")
	public String getFreeBoardList(@ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("CommunityController의 getFreeBoardList  시작");

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

		System.out.println("5. Map ==> " + map);

		model.addAttribute("search", map.get("search"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("resultPage", resultPage);

		System.out.println("MovieController의 getMovieCommentList메소드 끝");

		return "forward:/community/listFreeBoard.jsp";
	}

	@RequestMapping(value = "deleteFreeBoard", method = RequestMethod.GET)
	public String deleteFreeBoard(@RequestParam("freeBoardNo") int freeBoardNo, Model model) {

		System.out.println("CommunityController의 deleteFreeBoard GET 시작");

		System.out.println("1. freeBoardNo ==> " + freeBoardNo);
		communityService.deleteFreeBoard(freeBoardNo);

		System.out.println("CommunityController의 deleteFreeBoard GET 끝");

		return "redirect:/community/getFreeBoardList";
	};

	@RequestMapping(value = "freeBoardCommentList")
	public String freeBoardCommentList(@ModelAttribute("search") Search search,
			@RequestParam("freeBoardNo") int freeBoardNo, Model model) throws Exception {
		System.out.println("CommunityController의 freeBoardCommentList  시작");

		System.out.println("1. search ==> " + search);
		System.out.println("2. freeBoardNo ==> " + freeBoardNo);

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		System.out.println("2. search ==> " + search);

		List<Comment> list = communityService.getCommentList(search, freeBoardNo);

		System.out.println("3. list ==> " + list);

		int totalCount = communityService.getFreeBoardTotalCount(freeBoardNo);

		System.out.println("4. totalCount ==> " + totalCount);

		Page resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);
		System.out.println("5. resultPage ==> " + resultPage);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("totalCount", totalCount);
		map.put("resultPage", resultPage);
		map.put("search", search);

		System.out.println("5. Map ==> " + map);

		model.addAttribute("search", map.get("search"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("resultPage", resultPage);

		System.out.println("CommunityController의 freeBoardCommentList메소드 끝");
		return "forward:/community/getFreeBoard.jsp";
	}

}
