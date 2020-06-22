package com.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.MemberDAO;
import com.board.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject MemberDAO dao;
	
	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
			dao.register(vo);
	}
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}
	// 회원정보 수정
	@Override
	public void modify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}
	// 비밀번호 변경
	@Override
	public void modify_pass(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify_pass(vo);
	}
	// 회원탈퇴
	@Override
	public void withdrawal(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.withdrawal(vo);
	}
	// id 중복검사
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(userId);
	}

}
