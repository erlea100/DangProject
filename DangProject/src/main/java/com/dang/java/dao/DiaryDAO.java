package com.dang.java.dao;

import java.util.List;

import com.dang.java.domain.CostVO;

public interface DiaryDAO {

	// 글 입력 
	public void insertDiary(CostVO vo);
	
	// 글 삭제
	public void deleteDiary(CostVO vo);
	
	// 전체 목록 출력 
	public List<CostVO> selectDiary(CostVO vo);

	// 아이콘 출력 
	public List<CostVO> icon_selectDiary(CostVO vo);
	
}
