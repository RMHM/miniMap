package com.kh.mhm.likes.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.likes.model.vo.Likes;

@Repository
public class LikesDaoImpl implements LikesDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertLikes(Likes likes) {
		// TODO Auto-generated method stub
		return sqlSession.insert("likes.insertLikes", likes);
	}

}
