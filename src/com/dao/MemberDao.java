package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.MemberEntity;
import com.jdbc.MemberRowMapper;

import static com.util.Encoder.isoToUTF;

@Repository("memberDao")
public class MemberDao {
	DataSource dataSource;
	
	@Autowired
	public MemberDao(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	public int getMemberInsert(MemberEntity me) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "insert into member values(userno_seq.nextval,?,?,?,?,?,?,?,?)";
		int n = jdbcTemplate.update(sql, new Object[]{me.getId(),me.getPw(),isoToUTF(me.getName()),isoToUTF(me.getSex()),
				me.getBirth(),isoToUTF(me.getAddr()),me.getTel(),me.getEmail()});
		return n;
	}
	
	public List<MemberEntity> getSelectAll() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<MemberEntity> list = new ArrayList<MemberEntity>();
		String sql = "select * from member";
		
		list = jdbcTemplate.query(sql, new MemberRowMapper());
		return list;
	}
	
	public MemberEntity getMemberFind(int memberno) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from member where memberno=?";
		MemberEntity member = jdbcTemplate.queryForObject(sql, new Object[]{memberno}, new MemberRowMapper());
		return member;
	}
	
	public int getMemberUpdate(MemberEntity me) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "update member set pw=?, addr=?, tel=?, email=? where memberno=?";
		int n = jdbcTemplate.update(sql, new Object[]{me.getPw(),me.getAddr(),me.getTel(),me.getEmail(),me.getMemberno()});
		return n;
	}
	
	public int getMemberDelete(int memberno) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "delete from member where memberno=?";
		int n = jdbcTemplate.update(sql, new Object[]{memberno});
		return n;
	}
	
	public MemberEntity getMyIdFind(String id) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from member where id=?";
		MemberEntity member = jdbcTemplate.queryForObject(sql, new Object[]{id}, new MemberRowMapper());
		return member;
	}

	public int getMemberAllUpdate(MemberEntity me) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "update member set id=?, pw=?, name=?, sex=?, birth=?, addr=?, tel=?, email=? where memberno=?";
		int n = jdbcTemplate.update(sql, new Object[]{me.getId(), me.getPw(), me.getName(), me.getSex(), me.getBirth(),
				me.getAddr(),me.getTel(),me.getEmail(),me.getMemberno()});
		return n;	}
}
