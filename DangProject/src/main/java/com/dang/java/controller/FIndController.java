package com.dang.java.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dang.java.service.MemberService;

@Controller
@RequestMapping("/member/")
public class FIndController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/find_id_form.do")
	public String find_id_form() throws Exception {
		return "/member/find_id_form";

	}

	@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
	public String find_id(String e_mail, Model md) throws Exception {
		md.addAttribute("id", memberService.find_id(e_mail));
		return "/member/find_id";
	}

	@RequestMapping(value = "/find_password_form.do")
	public String find_password_form() throws Exception {
		return "/member/find_password_form";

	}

	@RequestMapping(value = "/find_password.do", method = RequestMethod.POST)
	public String find_password(String e_mail, Model md) throws Exception {
		md.addAttribute("password", memberService.find_password(e_mail));
		return "/member/find_password";
	}

}
