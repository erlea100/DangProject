package com.dang.java.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dang.java.service.DashBoardService;

@Controller
public class DashBoardController {
	
	@Autowired
	private DashBoardService boardService;
	
	@RequestMapping("/user/dashboard.do")
	public String test(Model model) {
		HashMap map = new HashMap();
		model.addAttribute("boardList", boardService.getDashBoard(map));
		System.out.println("ddd");
		return "/user/test";
	}
}
