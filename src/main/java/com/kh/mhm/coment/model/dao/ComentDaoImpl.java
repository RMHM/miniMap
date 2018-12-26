package com.kh.mhm.coment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.coment.model.vo.Coment;

@Repository
public class ComentDaoImpl implements ComentDao {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Coment> selectCometList(int bid) {
		return sst.selectList("", bid);
	}
	
	@Override
	public int insertComentContent(Coment coment) {
		return sst.insert("", coment);
	}
	
	@Override
	public int insertComentReport(int cid) {
		return sst.insert("", cid);
	}

	@Override
	public int deleteComent(int cid) {
		return sst.update("", cid);
	}

	@Override
	public int updateComent(Coment coment) {
		return sst.update("", coment);
	}

}
