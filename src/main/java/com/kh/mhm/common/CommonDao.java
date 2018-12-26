package com.kh.mhm.common;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDao {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public int selectToday() {
		return sst.selectOne("common.selectToday");
	}
	
	public int insertToday() {
		return sst.insert("common.insertToday");
	}
	
	public int updateCount() {
		return sst.update("common.updateCount");
	}
}
