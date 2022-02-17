package com.dang.java.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.dang.java.domain.MemberVO;

public interface MemberService {
	public MemberVO idCheck_Login(MemberVO vo);

	public int userInsert(MemberVO vo);

	String find_id(String e_mail) throws Exception;

	String find_password(String e_mail) throws Exception;

}
