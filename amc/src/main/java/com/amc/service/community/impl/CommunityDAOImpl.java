package com.amc.service.community.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.amc.common.Search;
import com.amc.service.community.CommunityDAO;
import com.amc.service.domain.Comment;
import com.amc.service.domain.FreeBoard;

@Repository("communityDAOImpl")
public class CommunityDAOImpl implements CommunityDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<FreeBoard> getFreeBoardList(Search search) {
		System.out.println("communityDAOImpl의 getFreeBoardList 시작...");
		System.out.println("1. search값 ==> " + search);
		List<FreeBoard> list = sqlSession.selectList("FreeBoardMapper.getFreeBoardList", search);
		System.out.println("2. list의 값 ==> " + list);
		System.out.println("communityDAOImpl의 getFreeBoardList 끝...");
		return list;
	}

	@Override
	public FreeBoard getFreeBoard(int freeBoardNo) {
		System.out.println("communityDAOImpl의 getFreeBoard 시작...");
		System.out.println("1. freeBoardNo값 ==> " + freeBoardNo);
		FreeBoard freeBoard = sqlSession.selectOne("FreeBoardMapper.getFreeBoard", freeBoardNo);
		System.out.println("2. freeBoard의 값 ==> " + freeBoard);
		System.out.println("communityDAOImpl의 getFreeBoard 끝...");
		return freeBoard;
	}

	@Override
	public void deleteFreeBoard(int freeBoardNo) {
		System.out.println("communityDAOImpl의 deleteFreeBoard 시작...");
		System.out.println("1. freeBoardNo값 ==> " + freeBoardNo);
		int deleteFreeBoard = sqlSession.delete("FreeBoardMapper.deleteFreeBoard", freeBoardNo);
		System.out.println("2. deleteFreeBoard의 값 ==> " + deleteFreeBoard);
		System.out.println("communityDAOImpl의 deleteFreeBoard 끝...");

	}

	@Override
	public void addFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityDAOImpl의 addFreeBoard 시작...");
		System.out.println("1. freeboard값 ==> " + freeBoard);
		int addFreeBoard = sqlSession.insert("FreeBoardMapper.addFreeBoard", freeBoard);
		System.out.println("2. addFreeBoard의 값 ==> " + addFreeBoard);
		System.out.println("communityDAOImpl의 addFreeBoard 끝...");
	}

	@Override
	public void updateFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityDAOImpl의 addFreeBoard 시작...");
		System.out.println("1. freeboard값 ==> " + freeBoard);
		int addFreeBoard = sqlSession.update("FreeBoardMapper.addFreeBoard", freeBoard);
		System.out.println("2. addFreeBoard의 값 ==> " + addFreeBoard);
		System.out.println("communityDAOImpl의 addFreeBoard 끝...");
	}
	

	
	@Override
	public int getTotalCount(Search search) throws Exception {		
		
		System.out.println("communityDAOImpl의 getTotalCount 시작...");
		System.out.println("1. search값 ==> " + search);
		int getTotalCount = sqlSession.selectOne("FreeBoardMapper.getTotalCount",search);
		System.out.println("2. getTotalCount의 값 ==> " + getTotalCount);
		System.out.println("communityDAOImpl의 getTotalCount 끝...");

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
