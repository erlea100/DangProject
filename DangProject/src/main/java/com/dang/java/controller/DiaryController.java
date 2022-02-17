package com.dang.java.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dang.java.domain.CostVO;
import com.dang.java.service.DiaryService;

@Controller
@RequestMapping("/diary/")
public class DiaryController {
	
	@Autowired
	private DiaryService diaryService;

	
	// 로직이 없이 단순 화면 변경일 경우
	@RequestMapping("/{url}.do")
	public String userJoin(@PathVariable String url) {
		return "user"+url;
	}
	
	@RequestMapping("/saveDiary.do")
	public String saveDiary(CostVO vo) {
		System.out.println("컨트롤러호출");
		diaryService.insertDiary(vo);
		return "redirect: /user/calendar.do";
	}
	
	@RequestMapping("/selectDiary.do")
	@ResponseBody
	public List<CostVO> selectDiary(HttpSession session,CostVO vo) {
		System.out.println("셀렉 컨트롤 호출");
		
		return diaryService.selectDiary(vo);
	}

	

	@RequestMapping(value="/icon_selectDiary.do")
	public ModelAndView icon_selectDiary(HttpSession session,CostVO vo) {
		System.out.println("셀렉 컨트롤 호출");
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/user/calendar");
		mv.addObject("list", diaryService.selectDiary(vo));
		return mv;
	}
}
