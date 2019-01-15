package com.kh.mhm.coment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mhm.coment.model.dao.ComentDao;
import com.kh.mhm.coment.model.vo.Coment;

@Service
public class ComentServiceImpl implements ComentService {
	
	@Autowired
	private ComentDao cDao;

	@Override
	public List<Coment> selectCometList(int bid) {
		return cDao.selectCometList(bid);
	}
	
	@Override
	public int insertComentContent(Coment coment) {
		return cDao.insertComentContent(coment);
	}

	@Override
	public int insertComentReport(int cid) {
		return cDao.insertComentReport(cid);
	}

	@Override
	public int deleteComent(int cid) {
		return cDao.deleteComent(cid);
	}

	@Override
	public int updateComent(Coment coment) {
		return cDao.updateComent(coment);
	}

	@Override
	public Coment selectOneComent(int cid) {
		// TODO Auto-generated method stub
		return cDao.selectOneComent(cid);
	}

	@Override
	public int insertComentContent2(Coment coment) {
		// TODO Auto-generated method stub
		return cDao.insertComentContent2(coment);
	}

	@Override
	public int countTotalComent(int bid) {
		// TODO Auto-generated method stub
		return cDao.countTotalComent(bid);
	}

}
