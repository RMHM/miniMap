package com.kh.mhm.coment.model.dao;

import java.util.List;

import com.kh.mhm.coment.model.vo.Coment;

public interface ComentDao {
	
	List<Coment> selectCometList(int cid);
	int insertComentContent(Coment coment);
	int insertComentReport(int cid);
	int deleteComent(int cid);
	int updateComent(Coment coment);
	int countTotalComent(int bid);
	Coment selectOneComent(int cid);
	int insertComentContent2(Coment coment);
	
}
