/* Editor: Chanho */
package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.Board;
import com.jdbc.BoardRowMapper;
import static com.util.Encoder.isoToUTF;

@Repository("boardDao")
public class BoardDao {
	private DataSource dataSource;
	
	@Autowired
	public BoardDao(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	
	public List<Board> listBoard(Board board) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<Board> list = new ArrayList<Board>();
		String sql=null;
		if(board.getSearchFiled() !=null && board.getSearchFiled() !=""){
			System.out.println("     ã�� ������ : "+board.getSearchFiled()+"="+board.getSearchValue());
			
			sql = "select * from ( select rownum rnum, s.* from ( SELECT * FROM board3 WHERE 1=1 AND "+board.getSearchFiled()+"=? ORDER BY boardno DESC )s )a WHERE rnum BETWEEN ? AND ?";
			list = jdbcTemplate.query(sql,new Object[]{board.getSearchValue(),board.getStartRowNo(),board.getEndRowNo()},new BoardRowMapper());
		}else{
			System.out.println("     ��ü ������");
			sql = "select * from ( select rownum rnum, s.* from ( SELECT * FROM board3 WHERE 1=1 ORDER BY boardno DESC )s )a WHERE rnum BETWEEN ? AND ?";
			list = jdbcTemplate.query(sql,new Object[]{board.getStartRowNo(),board.getEndRowNo()},new BoardRowMapper());
		}
		return list;
	}

	
	public boolean insertBoard(Board board) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "insert into board3(boardno, name, title, contents, insertdate) values(board_seq.nextval,?,?,?,?)";

		int n = jdbcTemplate.update(sql, new Object[] { 
				isoToUTF(board.getName()),isoToUTF(board.getTitle()),isoToUTF(board.getContents()),board.getInsertDate()});
		return (n > 0)? true : false;
	}

	public Board findBoard(int boardno) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select * from board3 where boardno=?";
		
		Board board = new Board();
		
		List<Board> list = new ArrayList<Board>();
		list = jdbcTemplate.query(sql,new Object[]{boardno},new BoardRowMapper());
		
		board.setBoardNo(list.get(0).getBoardNo());
		board.setName(list.get(0).getName());
		board.setTitle(list.get(0).getTitle());
		board.setContents(list.get(0).getContents());
		
	
		return board;
	}

	public boolean updateBoard(Board board) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "update board3 set title=?,contents=? where boardno=?";
		System.out.println("DAO����"+board.getBoardNo());
		int n = jdbcTemplate.update(sql, new Object[]{board.getTitle(),board.getContents(),board.getBoardNo()});
		return (n > 0)? true : false;
	}

	public boolean deleteBoard(int boardno) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "delete from board3 where boardno=?";
		int n = jdbcTemplate.update(sql, new Object[]{boardno});
		return (n > 0)? true : false;
	}

	public int getBoardListCount() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = null;
		int n = 0;
			sql = "SELECT COUNT(*) FROM BOARD3";
		n = jdbcTemplate.queryForInt(sql);
		
		return n;
	}
	
	
	public int getSearchBoardListCount(Board board) {
		System.out.println("DAO�� count�Դ�.�����Ͱ� �Ѿ�Գ�???" + board.getSearchFiled()+"="+board.getSearchValue());
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = null;
		int n = 0;
		if(board.getSearchFiled() !=null && board.getSearchFiled() !=""){
			sql = "SELECT COUNT(*) FROM BOARD3 where "+board.getSearchFiled()+"=?";
			n = jdbcTemplate.queryForInt(sql,new Object[]{board.getSearchValue()});
		}
		
		return n;
	}


	public boolean plusHits(int boardno) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "update board3 set hits=(select hits+1 from board3 where boardno=?) where boardno=?";
		int n = jdbcTemplate.update(sql, new Object[]{boardno,boardno});
		return (n > 0)? true : false;
	}
	
}
