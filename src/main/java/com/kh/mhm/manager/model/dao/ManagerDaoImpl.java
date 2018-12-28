package com.kh.mhm.manager.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List selectMemberList(String mtype) {
		
		List list = null;
		
		if(mtype.equals("m")) {
			list = sst.selectList("member.selectCommonMember");
		} else if (mtype.equals("c")) {
			list = sst.selectList("member.selectCompanyMember");
		} else {
			list = sst.selectList("member.selectBlackList");
		}
		
		return list;
	}

	@Override
	public int grantAuthority(int mno) {
		return sst.update("authority.grantAuthority", mno);
	}

	@Override
	public Authority selectRequest(int mno) {
		return sst.selectOne("authority.selectRequest", mno);
	}

	@Override
	public int refuseAuthority(int mno) {
		return sst.update("authority.refuseAuthority", mno);
	}

}
