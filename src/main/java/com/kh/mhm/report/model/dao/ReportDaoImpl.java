package com.kh.mhm.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.report.model.vo.Report;

@Repository
public class ReportDaoImpl implements ReportDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReport(Report report) {
		return sqlSession.insert("report.insertReport",report);
	}
}
