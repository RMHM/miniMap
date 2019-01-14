package com.kh.mhm.message.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.message.model.vo.Message;
import com.kh.mhm.message.model.vo.MessageBlock;
import com.kh.mhm.message.model.vo.MessageSmpl;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Message> selectMyMessage(int cPage, int numPerPage, int mNo) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("Message.selectMessageInbox",mNo,rowBounds);
	}

	@Override
	public int deleteMessage(HashMap<String,int[]> hmap) {
		return sqlSession.update("Message.deleteMessage",hmap);
	}

	@Override
	public int storeMessage(HashMap<String, int[]> hmap) {
		return sqlSession.update("Message.storeMessage",hmap);
	}

	@Override
	public int readAllMessage(String mNick) {
		return sqlSession.update("Message.readAllMessage",mNick);
	}

	@Override
	public Message selectDetailInbox(int meId) {
		return sqlSession.selectOne("Message.selectDetailOne",meId);
	}

	@Override
	public int deleteMessageOne(int meId) {
		return sqlSession.update("Message.deleteMessageOne",meId);
	}

	@Override
	public int storeMessageOne(int meId) {
		return sqlSession.update("Message.storeMessageOne",meId);
	}

	@Override
	public int updateReadFlag(int meId) {
		return sqlSession.update("Message.updateReadFlag",meId);
	}

	@Override
	public List<Message> selectMessageStore(int cPage, int numPerPage, int mNo) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("Message.selectMessageStore",mNo,rowBounds);
	}

	@Override
	public Message selectDetailStore(int meId) {
		return sqlSession.selectOne("Message.selectDetailOne",meId);
	}

	@Override
	public List<Message> selectMessageSent(int cPage, int numPerPage, int mNo) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("Message.selectMessageSent",mNo,rowBounds);
	}

	@Override
	public int deleteSentMessage(HashMap<String,int[]> hmap) {
		return sqlSession.update("Message.deleteSentMessage",hmap);
	}

	@Override
	public Message selectDetailSent(int meId) {
		return sqlSession.selectOne("Message.selectDetailSent",meId);
	}

	@Override
	public int deleteSentOne(int meId) {
		return sqlSession.update("Message.deleteSentOne",meId);
	}

	@Override
	public int sendMessage(MessageSmpl message) {
		return sqlSession.insert("Message.sendMessage",message);
	}

	@Override
	public int findNick(String nick) {
		return sqlSession.selectOne("Message.findNick",nick);
	}

	@Override
	public int countNewMessage(int mNo) {
		return sqlSession.selectOne("Message.countNewMessage",mNo);
	}

	@Override
	public int countMyMessage(int mNo) {
		return sqlSession.selectOne("Message.countMyMessage",mNo);
	}

	@Override
	public int countMessageSent(int mNo) {
		return sqlSession.selectOne("Message.countMessageSent",mNo);
	}

	@Override
	public int countMessageStore(int mNo) {
		return sqlSession.selectOne("Message.countMessageStore",mNo);
	}

	@Override
	public List<Message> selectMessageBlock(int cPage, int numPerPage, int mNo) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("Message.selectMessageBlock",mNo,rowBounds);
	}

	@Override
	public int countMessageBlock(int mNo) {
		return sqlSession.selectOne("Message.countMessageBlock",mNo);
	}

	@Override
	public int unblockMessage(String[] arr, int mNo) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("arr", arr);
		map.put("mNo", mNo);
		System.out.println(map.toString());
		return sqlSession.delete("Message.unblockMessage",map);
	}

	@Override
	public int banMessage(MessageBlock mb) {
		return sqlSession.insert("Message.banMessage",mb);
	}

	@Override
	public int checkBlock(Map<String,Object> map) {
		return sqlSession.selectOne("Message.checkBlock",map);
	}



}
