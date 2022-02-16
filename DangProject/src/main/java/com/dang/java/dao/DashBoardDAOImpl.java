
package com.dang.java.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dang.java.domain.DiaryVO;

@Repository("dashBoardDAO")
public class DashBoardDAOImpl implements DashBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<DiaryVO> getDashBoard(HashMap map) {
		System.out.println("다오 추력");
		return mybatis.selectList("memberMapper.dashboard", map);
	}

}
