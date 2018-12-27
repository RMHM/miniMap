package com.kh.mhm.manager.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDaoImpl implements ManagerDao {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public List<Integer> selectCount() {
		List<Integer> list = new ArrayList<Integer>();
		list.add((Integer)sst.selectOne("common.selectAllCnt"));
		list.add((Integer)sst.selectOne("common.selectDayCnt"));
		list.add((Integer)sst.selectOne("common.selectAvgCnt"));
		return list;
	}

}
