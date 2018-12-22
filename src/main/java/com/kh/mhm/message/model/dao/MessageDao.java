package com.kh.mhm.message.model.dao;

public interface MessageDao {

	int countNewMessage(int mno);

	int selectMno(String name);

}
