package com.dang.java.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dang.java.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int memberInsert(MemberVO vo) {
		System.out.println("===> memberMapper userInsert 호출");
		return mybatis.insert("memberMapper.userInsert",vo);	
	}

	@Override
	public MemberVO memberLogin(MemberVO vo) {
		System.out.println("===> memberMapper memberLogin 호출");
		return mybatis.selectOne("memberMapper.memberLogin",vo);
	}

	
	
	
	
	
	
	
	

}
