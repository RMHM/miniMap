package com.kh.mhm.map.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.mhm.map.model.dao.MapDao;
import com.kh.mhm.member.model.vo.Member;

public class MapServiceImpl implements MapService {

	@Autowired
	private MapDao mDao;
	
	@Override
	public Member selectOne(String mid) {
		return mDao.selectOne(mid);
	}

}
