package com.kh.mhm.manager.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.member.model.vo.BlackList;
import com.kh.mhm.myPage.model.vo.Authority;

@Repository
public class ManagerDaoImpl implements ManagerDao {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public List<Integer> selectCount() {
		List<Integer> list = new ArrayList<Integer>();
		list.add((Integer)sst.selectOne("common.selectAllCnt"));
		list.add((Integer)sst.selectOne("common.selectDayCnt"));
		list.add((Integer)sst.selectOne("common.selectAvgCnt"));
		return list;
	}
	
	@Override
	public List selectStatistics() {
		List list = new ArrayList();
		
		list.add(sst.selectOne("common.selectGenderCnt"));
		list.add(sst.selectOne("common.selectAgeCnt"));
		list.add(sst.selectOne("common.selectMemberCnt"));
		list.add(sst.selectOne("common.selectBoardCnt"));
		/*list.add(sst.selectOne("common.selectBoardTodayCnt"));*/
		list.add(sst.selectList("common.selectGroupBoard"));
		
		return list;
	}
	
	@Override
	public List selectMemberList(String mtype) {
		
		List list = null;
		
		if(mtype.equals("m")) {
			list = sst.selectList("member.selectCommonMember");
		} else if (mtype.equals("c")) {
			list = sst.selectList("member.selectCompanyMember");
		} else {
			list = sst.selectList("member.selectBlackMember");
		}
		
		return list;
	}

	@Override
	public int grantAuthority(String mnick, int acode) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("mnick", mnick);
		map.put("acode", acode);
		
		return sst.update("authority.grantAuthority", map);
	}

	@Override
	public List selectRequest(int mno) {
		return sst.selectList("authority.selectRequest", mno);
	}

	@Override
	public int refuseAuthority(String mnick, int acode) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("mnick", mnick);
		map.put("acode", acode);
		
		return sst.update("authority.refuseAuthority", map);
	}

	@Override
	public List searchMember(String condition, String keyword) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		return sst.selectList("member.searchMember", map);
	}

	@Override
	public int clearBlackList(int mno) {
		return sst.update("member.clearBlackList", mno);
	}

	@Override
	public List selectReportList(int mno) {
		return sst.selectList("member.selectReportList", mno);
	}

	@Override
	public Authority selectRequestOne(int mno, int acode) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("mno", mno);
		map.put("acode", acode);
		
		return sst.selectOne("authority.selectRequestOne", map);
	}



}
