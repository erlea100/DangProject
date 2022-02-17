package com.dang.java.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dang.java.dao.MemberDAO;
import com.dang.java.domain.MemberVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO idCheck_Login(MemberVO vo) {
		return memberDAO.memberLogin(vo);
	}
	

	@Override
	public int userInsert(MemberVO vo) {
		return memberDAO.memberInsert(vo);
	}

	@Inject
	private MemberDAO manager; 

	@Override
	public String find_id(String e_mail) throws Exception {
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
		String id = manager.find_id(e_mail);
		
		if (id == null) {
			System.out.println("<script>");
			System.out.println("alert('가입된 아이디가 없습니다.');");
			System.out.println("history.go(-1);");
			System.out.println("</script>");
//			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	@Override
	public String find_password(String e_mail) throws Exception {
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
		String password = manager.find_password(e_mail);
		
		if (password == null) {
			System.out.println("<script>");
			System.out.println("alert('가입된 아이디가 없습니다.');");
			System.out.println("history.go(-1);");
			System.out.println("</script>");
//			out.close();
			return null;
		} else {
			return password;
		}
	}
	

}

