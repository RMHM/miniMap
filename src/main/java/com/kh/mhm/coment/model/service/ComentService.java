package com.kh.mhm.coment.model.service;

import java.util.List;

import com.kh.mhm.coment.model.vo.Coment;

public interface ComentService {
	
	List<Coment> selectCometList(int bid);
	int insertComentContent(Coment coment);
	int insertComentContent2(Coment coment);
	int insertComentReport(int cid);
	
	int countTotalComent(int bid);
	
	int deleteComent(int cid);
	int updateComent(Coment coment);
	
	Coment selectOneComent(int cid);
	
}
