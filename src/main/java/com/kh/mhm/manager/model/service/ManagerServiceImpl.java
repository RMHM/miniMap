package com.kh.mhm.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mhm.manager.model.dao.ManagerDao;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	private ManagerDao mnDao;
	
	@Override
	public List<Integer> selectCount() {
		return mnDao.selectCount();
	}

}
