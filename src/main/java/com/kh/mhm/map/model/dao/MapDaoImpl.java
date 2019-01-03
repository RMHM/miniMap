package com.kh.mhm.map.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.mhm.member.model.vo.Member;

public class MapDaoImpl implements MapDao {


	@Autowired
	private SqlSessionTemplate sst;
	

	@Override
	public Member selectOne(String mid) {
		return sst.selectOne("mapPersonal.selectOne", mid);
	}


}
