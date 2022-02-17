package com.dang.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dang.java.service.DashBoardService;

@Controller
public class DashBoardController {
	
	@Autowired
	private DashBoardService boardService;
	
	@RequestMapping("/user/dashboard.do")
	public String test() {
		System.out.println("ddd");
		return "/user/test";
	}
}
