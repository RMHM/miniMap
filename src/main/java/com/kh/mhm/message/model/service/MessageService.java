package com.kh.mhm.message.model.service;

import java.util.List;
import java.util.Map;

import com.kh.mhm.message.model.vo.Message;
import com.kh.mhm.message.model.vo.MessageBlock;
import com.kh.mhm.message.model.vo.MessageSmpl;

public interface MessageService {

	List<Message> selectMyMessage(int cPage, int numPerPage, int mNo);
	
	int deleteMessage(int[] arr);
	
	int storeMessage(int[] arr);
	
	int readAllMessage(String mNick);
	
	Message selectDetailInbox(String meId);
	
	int deleteMessageOne(int meId);
	
	int storeMessageOne(int meId);
	
	int updateReadFlag(int meId);
	
	List<Message> selectMessageStore(int cPage, int numPerPage, int mNo);
	
	Message selectDetailStore(String meId);
	
	List<Message> selectMessageSent(int cPage, int numPerPage, int mNo);
	
	int deleteSentMessage(int[] arr);
	
	Message selectDetailSent(String meId);
	
	int deleteSentOne(int meId);
	
	int sendMessage(MessageSmpl message);
	
	int findNick(String nick);
	
	int countNewMessage(int mNo);
	
	int countMyMessage(int mNo);
	
	int countMessageSent(int mNo);
	
	int countMessageStore(int mNo);
	
	List<Message> selectMessageBlock(int cPage, int numPerPage, int mNo);
	
	int countMessageBlock(int mNo);
	
	int unblockMessage(String[] arr, int mId);
	
	int banMessage(MessageBlock mb);
	
	int checkBlock(Map<String,Object> map);

}
