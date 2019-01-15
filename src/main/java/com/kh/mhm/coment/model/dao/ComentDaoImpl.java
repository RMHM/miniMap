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
		return sst.selectList("coment.selectComentList", bid);
	}
	
	@Override
	public int insertComentContent(Coment coment) {
		return sst.insert("coment.insertComent", coment);
	}
	
	@Override
	public int insertComentReport(int cid) {
		return sst.insert("", cid);
	}

	@Override
	public int deleteComent(int cid) {
		return sst.update("coment.deleteComent", cid);
	}

	@Override
	public int updateComent(Coment coment) {
		return sst.update("coment.updateComent", coment);
	}

	@Override
	public Coment selectOneComent(int cid) {
		// TODO Auto-generated method stub
		return sst.selectOne("coment.selectOneComent", cid);
	}

	@Override
	public int insertComentContent2(Coment coment) {
		// TODO Auto-generated method stub
		return sst.insert("coment.insertComent2", coment);
	}

	@Override
	public int countTotalComent(int bid) {
		// TODO Auto-generated method stub
		return sst.selectOne("coment.selectTotalComent");
	}

}
