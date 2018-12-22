package com.kh.mhm.message.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int countNewMessage(int mno) {
		return sqlSession.selectOne("Message.countNewMessage",mno);
	}

	@Override
	public int selectMno(String name) {
		return sqlSession.selectOne("Message.selectMno",name);
	}


}
