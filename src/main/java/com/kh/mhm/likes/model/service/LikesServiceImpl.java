package com.kh.mhm.likes.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.likes.model.dao.LikesDao;
import com.kh.mhm.likes.model.vo.Likes;
@Repository
public class LikesServiceImpl implements LikesService {
	
	@Autowired
	private LikesDao ld;

	@Override
	public int insertLikes(Likes likes) {
		
		return ld.insertLikes(likes);
	}

}
