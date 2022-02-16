
  package com.dang.java.service;
  
  import java.util.HashMap; import java.util.List;
  
  import org.springframework.beans.factory.annotation.Autowired; import
  org.springframework.stereotype.Service;
  
  import com.dang.java.dao.DashBoardDAO; import com.dang.java.dao.MemberDAO;
  import com.dang.java.domain.DiaryVO; import com.dang.java.domain.MemberVO;
  
  @Service("dashBoardService") public class DashBoardServiceImpl implements
  DashBoardService{
  
  @Autowired private DashBoardDAO dashBoardDAO;
  
  @Override public List<DiaryVO> getDashBoard(HashMap map) { return
  dashBoardDAO.getDashBoard(map); }
  
  }
 