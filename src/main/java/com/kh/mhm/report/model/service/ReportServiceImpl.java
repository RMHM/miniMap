package com.kh.mhm.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mhm.report.model.dao.ReportDao;
import com.kh.mhm.report.model.vo.Report;



@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportDao rd;

	@Override
	public int insertReport(Report report) {
		
		return rd.insertReport(report);
	}
}
