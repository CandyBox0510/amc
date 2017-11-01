package com.amc.web.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.amc.common.Search;
import com.amc.service.community.CommunityService;
import com.amc.service.domain.Comment;
import com.amc.service.domain.MovieComment;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// �ظ� �߰�
	@RequestMapping(value = "json/addComment", method = RequestMethod.POST)
	public void addComment(@RequestBody Comment comment) {

		System.out.println("communityRestController�� addComment���� ");

		System.out.println("1.comment ==> " + comment);
		communityService.addComment(comment);
		/// screenService.addScreenContent(screenContent);
		System.out.println("communityRestController addComment :: POST ��.....");


	};

	/*// �ظ� �߰�
	@RequestMapping(value = "json/getMovieComment/{movieCommentNo}", method = RequestMethod.GET)
	public MovieComment getMovieComment(@PathVariable int movieCommentNo) {

		System.out.println("movieRestController�� getMovieComment���� ");

		System.out.println("1.movieCommentNo ==> " + movieCommentNo);

		/// screenService.addScreenContent(screenContent);
		System.out.println("screen/json/getMovieComment :: POST ��.....");

		return movieService.getMovieComment(movieCommentNo);

	};*/

	// �ظ� �߰�
	@RequestMapping(value = "json/updateComment", method = RequestMethod.POST)
	public void updateComment(@RequestBody Comment comment) {

		System.out.println("communityRestController�� updateComment���� ");

		System.out.println("1.movieComment ==> " + comment);
		communityService.updateComment(comment);
		/// screenService.addScreenContent(screenContent);
		System.out.println("communityRestController updateComment :: POST ��.....");

		

	};

	// �ظ� �߰�
	@RequestMapping(value = "json/deleteComment/{commentNo}", method = RequestMethod.GET)
	public void deleteComment(@PathVariable int commentNo) {

		System.out.println("communityRestController�� deleteComment���� ");

		System.out.println("1.commentNo ==> " + commentNo);
		communityService.deleteComment(commentNo);	
		/// screenService.addScreenContent(screenContent);
		System.out.println(" communityRestController deleteComment :: POST ��.....");

		

	};
	
	// �ظ� �߰�
@RequestMapping(value = "json/getCommentList/{freeBoardNo}",  method = RequestMethod.GET)
	public List<Comment> getCommentList(@ModelAttribute("search") Search search, @PathVariable int freeBoardNo) throws Exception {
		System.out.println("communityRestController�� getCommentList���� ");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		System.out.println("1. search ==> "+ search);
		System.out.println("2. freeBoardNo ==> "+ freeBoardNo);
		

		
		List<Comment> list = communityService.getCommentList(search, freeBoardNo);

		
		
		System.out.println("4. list ==> ?" + list);
		
		System.out.println("communityRestController�� getCommentList :: POST ��.....");
		
		return list;
	}
	
	@RequestMapping(value = "json/getReplyList",  method = RequestMethod.POST)
	public  List<Comment> getReplyList( @ModelAttribute("search") Search search, @RequestBody Comment comment) throws Exception {
		System.out.println("communityRestController�� getReplyList���� ");
	
	
		System.out.println("1. search ==> "+search);
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		System.out.println("1. comment ==> "+comment);
		
		search.setPageSize(pageSize);

		System.out.println("1-1. search ==> "+ search);
		//System.out.println("2. movieNo ==> "+ movieNo);
		int freeBoardNo = comment.getFreeBoard().getFreeBoardNo();
		int parentCommentNo = comment.getParentCommentNo();
		
		System.out.println("2. freeBoardNo ==> " + freeBoardNo);
		System.out.println("3. parentCommentNo ==> " + parentCommentNo);
		List<Comment> list = communityService.getReplyList(search, parentCommentNo);
		
		
		System.out.println("4. list ==> " + list);
		System.out.println("communityRestController�� getReplyList :: POST ��.....");
		
		return list;
	}
	
	
	
	
}
