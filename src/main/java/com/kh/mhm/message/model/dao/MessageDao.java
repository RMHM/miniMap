package com.kh.mhm.message.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.mhm.message.model.vo.Message;
import com.kh.mhm.message.model.vo.MessageBlock;
import com.kh.mhm.message.model.vo.MessageSmpl;

public interface MessageDao {

	List<Message> selectMyMessage(int cPage, int numPerPage, int mNo);
	
	int deleteMessage(HashMap<String,int[]> hmap);
	
	int storeMessage(HashMap<String,int[]> hmap);
	
	int readAllMessage(String mNick);
	
	Message selectDetailInbox(int meId);
	
	int deleteMessageOne(int meId);
	
	int storeMessageOne(int meId);
	
	int updateReadFlag(int meId);
	
	List<Message> selectMessageStore(int cPage, int numPerPage, int mNo);
	
	Message selectDetailStore(int meId);
	
	List<Message> selectMessageSent(int cPage, int numPerPage, int mNo);
	
	int deleteSentMessage(HashMap<String,int[]> arr);
	
	Message selectDetailSent(int meId);
	
	int deleteSentOne(int meId);
	
	int sendMessage(MessageSmpl message);
	
	int findNick(String nick);
	
	int countNewMessage(int mNo);
	
	int countMyMessage(int mNo);
	
	int countMessageSent(int mNo);
	
	int countMessageStore(int mNo);
	
	List<Message> selectMessageBlock(int cPage, int numPerPage, int mNo);
	
	int countMessageBlock(int mNo);
	
	int unblockMessage(String[] arr, int mNo);
	
	int banMessage(MessageBlock mb);
	
	int checkBlock(Map<String,Object> map);
}
