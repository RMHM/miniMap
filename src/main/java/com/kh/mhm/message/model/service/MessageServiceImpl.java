package com.kh.mhm.message.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mhm.message.model.dao.MessageDao;
import com.kh.mhm.message.model.vo.Message;
import com.kh.mhm.message.model.vo.MessageBlock;
import com.kh.mhm.message.model.vo.MessageSmpl;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDao mdi;

	@Override
	public List<Message> selectMyMessage(int cPage, int numPerPage, int mNo) {
		return mdi.selectMyMessage(cPage, numPerPage, mNo);
	}
	
	@Override
	public int deleteMessage(int[] arr) {
		HashMap<String,int[]> hmap=new HashMap<String,int[]>();
		hmap.put("meId", arr);
		return mdi.deleteMessage(hmap);
	}

	@Override
	public int storeMessage(int[] arr) {
		HashMap<String,int[]> hmap=new HashMap<String,int[]>();
		hmap.put("meId", arr);
		return mdi.storeMessage(hmap);
	}

	@Override
	public int readAllMessage(String mNick) {
		return mdi.readAllMessage(mNick);
	}

	@Override
	public Message selectDetailInbox(String meId) {
		return mdi.selectDetailInbox(Integer.valueOf(meId));
	}

	@Override
	public int deleteMessageOne(int meId) {
		return mdi.deleteMessageOne(meId);
	}

	@Override
	public int storeMessageOne(int meId) {
		return mdi.storeMessageOne(meId);
	}

	@Override
	public int updateReadFlag(int meId) {
		return mdi.updateReadFlag(meId);
	}

	@Override
	public List<Message> selectMessageStore(int cPage, int numPerPage, int mNo) {
		return mdi.selectMessageStore(cPage, numPerPage, mNo);
	}

	@Override
	public Message selectDetailStore(String meId) {
		return mdi.selectDetailStore(Integer.valueOf(meId));
	}

	@Override
	public List<Message> selectMessageSent(int cPage, int numPerPage, int mNo) {
		return mdi.selectMessageSent(cPage, numPerPage, mNo);
	}

	@Override
	public int deleteSentMessage(int[] arr) {
		HashMap<String,int[]> hmap=new HashMap<String,int[]>();
		hmap.put("meId", arr);
		return mdi.deleteSentMessage(hmap);
	}

	@Override
	public Message selectDetailSent(String meId) {
		return mdi.selectDetailSent(Integer.parseInt(meId));
	}

	@Override
	public int deleteSentOne(int meId) {
		return mdi.deleteSentOne(meId);
	}

	@Override
	public int sendMessage(MessageSmpl message) {
		return mdi.sendMessage(message);
	}

	@Override
	public int findNick(String nick) {
		return mdi.findNick(nick);
	}

	@Override
	public int countNewMessage(int mNo) {
		return mdi.countNewMessage(mNo);
	}

	@Override
	public int countMyMessage(int mNo) {
		return mdi.countMyMessage(mNo);
	}

	@Override
	public int countMessageSent(int mNo) {
		return mdi.countMessageSent(mNo);
	}

	@Override
	public int countMessageStore(int mNo) {
		return mdi.countMessageStore(mNo);
	}

	@Override
	public List<Message> selectMessageBlock(int cPage, int numPerPage, int mNo) {
		return mdi.selectMessageBlock(cPage, numPerPage, mNo);
	}

	@Override
	public int countMessageBlock(int mNo) {
		return mdi.countMessageBlock(mNo);
	}

	@Override
	public int unblockMessage(String[] arr, int mId) {
		return mdi.unblockMessage(arr,mId);
	}

	@Override
	public int banMessage(MessageBlock mb) {
		return mdi.banMessage(mb);
	}

	@Override
	public int checkBlock(Map<String,Object> map) {
		return mdi.checkBlock(map);
	}


}
