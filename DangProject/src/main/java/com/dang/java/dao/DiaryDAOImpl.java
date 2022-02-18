package com.dang.java.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dang.java.domain.CostVO;

@Repository
public class DiaryDAOImpl implements DiaryDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	
	@Override
	public void insertDiary(CostVO vo) {
		mybatis.insert("costMapper.insertDiary" , vo);
	}
	
	@Override
	public List<CostVO> selectDiary(CostVO vo) {
		return mybatis.selectList("costMapper.selectDiary",vo);
	}
	
	//삭제 다오
	@Override
		public void deleteDiary(CostVO vo) {
			mybatis.delete("costMapper.deleteDiary",vo);
		}

	
	@Override
	public List<CostVO> icon_selectDiary(CostVO vo) {
		return mybatis.selectList("costMapper.icon_selectDiary",vo);
	}
	
}
