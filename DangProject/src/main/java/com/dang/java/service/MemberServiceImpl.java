package com.dang.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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


	

}

