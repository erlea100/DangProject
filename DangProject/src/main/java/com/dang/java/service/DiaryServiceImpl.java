package com.dang.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.dang.java.dao.DiaryDAOImpl;
import com.dang.java.domain.CostVO;

@Service("diaryService")
public class DiaryServiceImpl implements DiaryService{
	
	@Autowired // 객체를 새로 생성하지말고 자동으로 할당하자
	private DiaryDAOImpl diaryDAO;

	@Override
	public void insertDiary(CostVO vo) {
		diaryDAO.insertDiary(vo);
	}
	
	@Override
	public List<CostVO> selectDiary(CostVO vo) {
		return diaryDAO.selectDiary(vo);
	}

	@Override
	   public void deleteDiary(CostVO vo) {
		   diaryDAO.deleteDiary(vo);
	   }

	@Override
	public List<CostVO> icon_selectDiary(CostVO vo) {
		return diaryDAO.icon_selectDiary(vo);
	}
	
}
