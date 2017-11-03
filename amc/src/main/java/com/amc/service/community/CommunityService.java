package com.amc.service.community;

import java.util.List;

import com.amc.common.Search;
import com.amc.service.domain.Comment;
import com.amc.service.domain.FreeBoard;

public interface CommunityService {
	
	public List<FreeBoard> getFreeBoardList(Search search);
	
	public FreeBoard getFreeBoard(int freeBoardNo);
	
	public void deleteFreeBoard(int freeBoardNo);
	
	public void addFreeBoard(FreeBoard freeBoard);
	
	public void updateFreeBoard(FreeBoard freeBoard);
	
	// restController���� ���
	public int addComment(Comment comment);

	public int deleteComment(int commentNo);

	public int updateComment(Comment comment);

	int getTotalCount(Search search) throws Exception;

	List<Comment> getCommentList(Search search, int freeBoardNo);

	List<Comment> getReplyList(Search search, int parentCommentNo);

	int getFreeBoardTotalCount(int freeBoardNo) throws Exception;

	
}
