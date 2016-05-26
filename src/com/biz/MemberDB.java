package com.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDao;
import com.entity.MemberEntity;

@Service("memberBiz")
public class MemberDB {
	MemberDao memberDao;
	
	@Autowired
	public MemberDB(MemberDao memberDao) {
		super();
		this.memberDao = memberDao;
	}

	public int getMemberInsert(MemberEntity me) {
		int n = memberDao.getMemberInsert(me);
		return n;
	}
	
	public List<MemberEntity> getSelectAll() {
		return memberDao.getSelectAll();
	}
	
	public MemberEntity getMemberFind(int memberno) {
		return memberDao.getMemberFind(memberno);
	}
	
	public int getMemberUpdate(MemberEntity me) {
		int n = memberDao.getMemberUpdate(me);
		return n;
	}
	
	public int getMemberAllUpdate(MemberEntity me) {
		int n = memberDao.getMemberAllUpdate(me);
		return n;
	}
	
	public int getMemberDelete(int memberno) {
		int n = memberDao.getMemberDelete(memberno);
		return n;
	}
	
	public MemberEntity getMyIdFind(String id) {
		return memberDao.getMyIdFind(id);
	}

	public List<MemberEntity> getSelectedMemberList(List<Integer> nums) {
		List<MemberEntity> memlist = new ArrayList<MemberEntity>();
		for(Integer memberno : nums){
			memlist.add(memberDao.getMemberFind(memberno));
		}
		return memlist;
	}
}
