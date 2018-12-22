package com.kh.mhm.message.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mhm.message.model.dao.MessageDaoImpl;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDaoImpl mdi;

	@Override
	public int countNewMessage(String name) {

		int mno=mdi.selectMno(name);

		int result=mdi.countNewMessage(mno);

		return result;
	}

}
