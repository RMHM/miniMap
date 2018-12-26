package com.kh.mhm.message.model.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.mhm.message.model.vo.Message;
import com.kh.mhm.message.model.vo.MessageSmpl;

public interface MessageDao {

	List<Message> selectMyMessage(int mNo);
	
	int deleteMessage(HashMap<String,int[]> hmap);
	
	int storeMessage(HashMap<String,int[]> hmap);
	
	int readAllMessage(String mNick);
	
	Message selectDetailInbox(int meId);
	
	int deleteMessageOne(int meId);
	
	int storeMessageOne(int meId);
	
	int updateReadFlag(int meId);
	
	List<Message> selectMessageStore(int mNo);
	
	Message selectDetailStore(int meId);
	
	List<Message> selectMessageSent(int mNo);
	
	int deleteSentMessage(HashMap<String,int[]> arr);
	
	Message selectDetailSent(int meId);
	
	int deleteSentOne(int meId);
	
	int sendMessage(MessageSmpl message);
	
}
