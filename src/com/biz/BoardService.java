package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BoardDao;
import com.entity.Board;


@Service("boardService")
public class BoardService {

	private BoardDao boardDao;
	
	@Autowired
	public BoardService(BoardDao boardDao) {
		super();
		this.boardDao = boardDao;
	}

	public List<Board> listBoard(Board board) {
		return boardDao.listBoard(board);
	}

	public boolean insertBoard(Board board) {
		return boardDao.insertBoard(board);
	}

	public Board findBoard(int boardno) {
		return boardDao.findBoard(boardno);
	}

	public boolean updateBoard(Board board) {
		return boardDao.updateBoard(board);
	}

	public boolean deleteBoard(int boardno) {
		return boardDao.deleteBoard(boardno);
	}

	
	
	public int getBoardListCount() {
		return boardDao.getBoardListCount();
	}
	public int getSearchBoardListCount(Board board) {
		return boardDao.getSearchBoardListCount(board);
	}

	public boolean plusHits(int boardno) {
		return boardDao.plusHits(boardno);
	}


}
