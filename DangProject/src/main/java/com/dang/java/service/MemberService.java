package com.dang.java.service;

import java.util.List;

import com.dang.java.domain.MemberVO;
public interface MemberService {
	public MemberVO idCheck_Login( MemberVO vo);
	public int userInsert(MemberVO vo );

}
