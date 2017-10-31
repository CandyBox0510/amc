package com.amc.service.community.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.amc.common.Search;
import com.amc.service.community.CommunityDAO;
import com.amc.service.community.CommunityService;
import com.amc.service.domain.Comment;
import com.amc.service.domain.FreeBoard;
@Repository("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	@Qualifier("communityDAOImpl")
	private CommunityDAO communityDAO;

	public void setCommunityDAO(CommunityDAO communityDAO) {
		this.communityDAO = communityDAO;
	}

	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<FreeBoard> getFreeBoardList(Search search) {
		System.out.println("communityServiceImpl�� getFreeBoardList ����...");
		System.out.println("1. search�� ==> " + search);
		List<FreeBoard> list = communityDAO.getFreeBoardList(search);
		System.out.println("2. list�� �� ==> " + list);
		System.out.println("communityDAOImpl�� getFreeBoardList ��...");
		return list;
	}

	@Override
	public FreeBoard getFreeBoard(int freeBoardNo) {
		System.out.println("communityServiceImpl�� getFreeBoard ����...");
		System.out.println("1. freeBoardNo�� ==> " + freeBoardNo);
		FreeBoard freeBoard = communityDAO.getFreeBoard(freeBoardNo);
		System.out.println("2. freeBoard�� �� ==> " + freeBoard);
		System.out.println("communityServiceImpl�� getFreeBoard ��...");
		return freeBoard;
	}

	@Override
	public void deleteFreeBoard(int freeBoardNo) {
		System.out.println("communityServiceImpl�� deleteFreeBoard ����...");
		System.out.println("1. freeBoardNo�� ==> " + freeBoardNo);
		communityDAO.deleteFreeBoard(freeBoardNo);
		
		System.out.println("communityServiceImpl�� deleteFreeBoard ��...");

	}

	@Override
	public void addFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityServiceImpl�� addFreeBoard ����...");
		System.out.println("1. freeboard�� ==> " + freeBoard);
		communityDAO.addFreeBoard(freeBoard);
	
		System.out.println("communityServiceImpl�� addFreeBoard ��...");
	}

	@Override
	public void updateFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityServiceImpl�� addFreeBoard ����...");
		System.out.println("1. freeboard�� ==> " + freeBoard);
		communityDAO.updateFreeBoard(freeBoard);
		System.out.println("communityServiceImpl�� addFreeBoard ��...");
	}
	
	@Override
	public int getTotalCount(Search search) throws Exception {		
		
		System.out.println("communityServiceImpl�� getTotalCount ����...");
		System.out.println("1. search�� ==> " + search);
		int getTotalCount = communityDAO.getTotalCount(search);
		System.out.println("2. getTotalCount�� �� ==> " + getTotalCount);
		System.out.println("communityServiceImpl�� getTotalCount ��...");

		return getTotalCount;
	}
	

	@Override
	public void addComment(Comment comment) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Comment> getCommentList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> getReplyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteComment(int commentNo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateComment(Comment comment) {
		// TODO Auto-generated method stub

	}

}
