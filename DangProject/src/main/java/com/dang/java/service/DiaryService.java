package com.dang.java.service;

import java.util.List;

import com.dang.java.domain.CostVO;


public interface DiaryService {
	
	public void insertDiary(CostVO vo);
	 
	// 글 삭제
	public	void deleteDiary(CostVO vo);
	
	// 글 전체조회
	public List<CostVO> selectDiary(CostVO vo);
	
	// 아이콘 조회 
	public List<CostVO> icon_selectDiary(CostVO vo);
}
