package com.dang.java.dao;

import java.util.List;

import com.dang.java.domain.CostVO;

public interface DiaryDAO {

	public void insertDiary(CostVO vo);
	
	// 다오 글 삭제
	public void deleteDiary(CostVO vo);
	
	public List<CostVO> selectDiary(CostVO vo);


	
}
