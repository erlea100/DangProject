package com.dang.java.controller;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dang.java.domain.MemberVO;
import com.dang.java.service.DashBoardService;
import com.dang.java.service.MemberService;

@Controller
@RequestMapping("/user/")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private DashBoardService dashBoardService;
	// 로직이 없이 단순 화면 변경일 경우
	@RequestMapping("/{url}.do")
	public String userJoin(@PathVariable String url) {
		return "/user/" + url;
	}

	// 회원가입
	@RequestMapping("/userInsert.do")
	public ModelAndView userInsert(MemberVO vo) {

		System.out.println("userInsert 컨트롤러 호출");
		int result = memberService.userInsert(vo);
		String message = "가입되지 않았습니다.";

		if (result > 0)
			message = vo.getName() + "님 , 가입을 축하드립니다.";
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/loginForm");
		mv.addObject("message", message);
		mv.addObject("result", result);
		return mv;

	}

//	@RequestMapping("logOut.do" )
//	public String logout(HttpSession session){
//		session.invalidate();
//		return "dang_main_non";
//	}
	// 로그인
	@RequestMapping("login.do")
	public String login(MemberVO vo, HttpSession session,  Model model) throws Exception {
		HashMap map = new HashMap();
		model.addAttribute("boardList", dashBoardService.getDashBoard(map));
		MemberVO result = memberService.idCheck_Login(vo);
		System.out.println("login 컨트롤러 호출");

		if (result == null) {
			System.out.println("로그인 실패");
//			System.out.println("[" + result.getId() + "]" + "로그인 실패");
			return "/user/loginForm";
		} else {
			System.out.println("[" + result.getId() + "]" + "로그인 성공");
			session.setAttribute("id", result.getId());
			session.setAttribute("name", result.getName());
			session.setAttribute("sessionTime", new Date().toLocaleString());
			return "/user/dang_main_member";
		}
	}
}