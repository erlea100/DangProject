package com.dang.java.dao;

import java.util.List;

import com.dang.java.domain.MemberVO;

public interface MemberDAO {
	
	/**
	 * 회원가입기능 구현
	 */
	int memberInsert(MemberVO vo);

	/**
	 * 로그인 확인 기능 구현
	 */
	MemberVO memberLogin(MemberVO vo);
	
	
	
	


}
