package com.dang.java.service;

import java.util.List;

import com.dang.java.domain.CostVO;


public interface DiaryService {
	
	public void insertDiary(CostVO vo);
	public List<CostVO> selectDiary(CostVO vo);
	
}
