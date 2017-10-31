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
		System.out.println("communityServiceImpl의 getFreeBoardList 시작...");
		System.out.println("1. search값 ==> " + search);
		List<FreeBoard> list = communityDAO.getFreeBoardList(search);
		System.out.println("2. list의 값 ==> " + list);
		System.out.println("communityDAOImpl의 getFreeBoardList 끝...");
		return list;
	}

	@Override
	public FreeBoard getFreeBoard(int freeBoardNo) {
		System.out.println("communityServiceImpl의 getFreeBoard 시작...");
		System.out.println("1. freeBoardNo값 ==> " + freeBoardNo);
		FreeBoard freeBoard = communityDAO.getFreeBoard(freeBoardNo);
		System.out.println("2. freeBoard의 값 ==> " + freeBoard);
		System.out.println("communityServiceImpl의 getFreeBoard 끝...");
		return freeBoard;
	}

	@Override
	public void deleteFreeBoard(int freeBoardNo) {
		System.out.println("communityServiceImpl의 deleteFreeBoard 시작...");
		System.out.println("1. freeBoardNo값 ==> " + freeBoardNo);
		communityDAO.deleteFreeBoard(freeBoardNo);
		
		System.out.println("communityServiceImpl의 deleteFreeBoard 끝...");

	}

	@Override
	public void addFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityServiceImpl의 addFreeBoard 시작...");
		System.out.println("1. freeboard값 ==> " + freeBoard);
		communityDAO.addFreeBoard(freeBoard);
	
		System.out.println("communityServiceImpl의 addFreeBoard 끝...");
	}

	@Override
	public void updateFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityServiceImpl의 addFreeBoard 시작...");
		System.out.println("1. freeboard값 ==> " + freeBoard);
		communityDAO.updateFreeBoard(freeBoard);
		System.out.println("communityServiceImpl의 addFreeBoard 끝...");
	}
	
	@Override
	public int getTotalCount(Search search) throws Exception {		
		
		System.out.println("communityServiceImpl의 getTotalCount 시작...");
		System.out.println("1. search값 ==> " + search);
		int getTotalCount = communityDAO.getTotalCount(search);
		System.out.println("2. getTotalCount의 값 ==> " + getTotalCount);
		System.out.println("communityServiceImpl의 getTotalCount 끝...");

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
