package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ScreenDao;
import com.entity.ScreenEntity;

@Service("screenBiz")
public class ScreenDB {
	ScreenDao screenDao;
	
	@Autowired
	public ScreenDB(ScreenDao screenDao) {
		super();
		this.screenDao = screenDao;
	}

	public List<ScreenEntity> getSelect(String cinemaID) {
		List<ScreenEntity> screenlist = screenDao.getSelect(cinemaID);
		return screenlist;
	}

	public boolean getScreenInsert(ScreenEntity se) {
		int r = screenDao.getScreenInsert(se);
		return r>0? true:false;
	}

	public List<ScreenEntity> getSelectAll() {
		return screenDao.getSelectAll();
	}
}