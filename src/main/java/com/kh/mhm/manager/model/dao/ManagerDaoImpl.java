package com.kh.mhm.manager.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.manager.model.vo.BlackList;
import com.kh.mhm.manager.model.vo.CompanyMember;

@Repository
public class ManagerDaoImpl implements ManagerDao {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<BlackList> selectBlackList() {
		return sst.selectList("member.selectBlackList");
	}

	@Override
	public List<CompanyMember> selectCompanyMember() {
		return sst.selectList("member.selectCompanyMember");
	}

}
