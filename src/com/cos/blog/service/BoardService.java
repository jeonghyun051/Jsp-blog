package com.cos.blog.service;

import java.util.List;

import com.cos.blog.domain.board.Board;
import com.cos.blog.domain.board.BoardDao;
import com.cos.blog.domain.board.dto.DetailRespDto;
import com.cos.blog.domain.board.dto.SaveReqDto;
import com.cos.blog.domain.board.dto.UpdateReqDto;

public class BoardService {

	private BoardDao boardDao;
	
	public int 글수정(UpdateReqDto dto) {
		return boardDao.update(dto);
	}
	public int 글삭제(int id) {
		return boardDao.deleteById(id);
	}
	
	public DetailRespDto 글상세보기(int id) {
		// 조회수 업데이트치기
		int result = boardDao.updateReadCount(id);
		if(result == 1) {
			return boardDao.findById(id);
		}else {
			return null;
		}
	}


	public BoardService() {
		boardDao = new BoardDao();
	}

	public int 글쓰기(SaveReqDto dto) {
		return boardDao.save(dto);
	}
	
	public List<Board> 목록보기(int page){
		return boardDao.findAll(page);
	}
	
	public List<Board> 글검색(String keyword, int page){
		return boardDao.findByKeyword(keyword,page);
	}
	
	public int 글개수() {
		return boardDao.count();
	}
	
	public int 글개수(String keyword) {
		return boardDao.count(keyword);
	}
	
}