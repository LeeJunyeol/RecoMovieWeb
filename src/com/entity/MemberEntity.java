package com.entity;

import java.sql.Date;
import java.util.List;

public class MemberEntity {
	private int memberno;
	private String id;
	private String pw;
	private String name;
	private String sex;
	private Date birth;
	private String addr;
	private String tel;
	private String email;
	private List<MemberEntity> memberList;
	
	public MemberEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberEntity(String id, String pw, String name, String sex, Date birth, String addr, String tel,
			String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.sex = sex;
		this.birth = birth;
		this.addr = addr;
		this.tel = tel;
		this.email = email;
	}

	public MemberEntity(int memberno, String id, String pw, String name, String sex, Date birth, String addr,
			String tel, String email) {
		super();
		this.memberno = memberno;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.sex = sex;
		this.birth = birth;
		this.addr = addr;
		this.tel = tel;
		this.email = email;
	}

	public List<MemberEntity> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<MemberEntity> memberList) {
		this.memberList = memberList;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberEntity [memberno=" + memberno + ", id=" + id + ", pw=" + pw + ", name=" + name + ", sex=" + sex
				+ ", birth=" + birth + ", addr=" + addr + ", tel=" + tel + ", email=" + email + "]";
	}
	
	
}
