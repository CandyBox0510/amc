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
		System.out.println("communityDAOImpl�� getFreeBoardList ����...");
		System.out.println("1. search�� ==> " + search);
		List<FreeBoard> list = sqlSession.selectList("FreeBoardMapper.getFreeBoardList", search);
		System.out.println("2. list�� �� ==> " + list);
		System.out.println("communityDAOImpl�� getFreeBoardList ��...");
		return list;
	}

	@Override
	public FreeBoard getFreeBoard(int freeBoardNo) {
		System.out.println("communityDAOImpl�� getFreeBoard ����...");
		System.out.println("1. freeBoardNo�� ==> " + freeBoardNo);
		FreeBoard freeBoard = sqlSession.selectOne("FreeBoardMapper.getFreeBoard", freeBoardNo);
		System.out.println("2. freeBoard�� �� ==> " + freeBoard);
		System.out.println("communityDAOImpl�� getFreeBoard ��...");
		return freeBoard;
	}

	@Override
	public void deleteFreeBoard(int freeBoardNo) {
		System.out.println("communityDAOImpl�� deleteFreeBoard ����...");
		System.out.println("1. freeBoardNo�� ==> " + freeBoardNo);
		int deleteFreeBoard = sqlSession.delete("FreeBoardMapper.deleteFreeBoard", freeBoardNo);
		System.out.println("2. deleteFreeBoard�� �� ==> " + deleteFreeBoard);
		System.out.println("communityDAOImpl�� deleteFreeBoard ��...");

	}

	@Override
	public void addFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityDAOImpl�� addFreeBoard ����...");
		System.out.println("1. freeboard�� ==> " + freeBoard);
		int addFreeBoard = sqlSession.insert("FreeBoardMapper.addFreeBoard", freeBoard);
		System.out.println("2. addFreeBoard�� �� ==> " + addFreeBoard);
		System.out.println("communityDAOImpl�� addFreeBoard ��...");
	}

	@Override
	public void updateFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityDAOImpl�� addFreeBoard ����...");
		System.out.println("1. freeboard�� ==> " + freeBoard);
		int addFreeBoard = sqlSession.update("FreeBoardMapper.addFreeBoard", freeBoard);
		System.out.println("2. addFreeBoard�� �� ==> " + addFreeBoard);
		System.out.println("communityDAOImpl�� addFreeBoard ��...");
	}
	

	
	@Override
	public int getTotalCount(Search search) throws Exception {		
		
		System.out.println("communityDAOImpl�� getTotalCount ����...");
		System.out.println("1. search�� ==> " + search);
		int getTotalCount = sqlSession.selectOne("FreeBoardMapper.getTotalCount",search);
		System.out.println("2. getTotalCount�� �� ==> " + getTotalCount);
		System.out.println("communityDAOImpl�� getTotalCount ��...");

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
