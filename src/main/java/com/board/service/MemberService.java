package com.board.service;

import com.board.domain.MemberVO;

public interface MemberService {
	
	//회원가입
	public void register(MemberVO vo) throws Exception;
	
	// id 중복검사
	public MemberVO idCheck(String userId) throws Exception;
	
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 회원정보 수정
	public void modify(MemberVO vo) throws Exception;
	
	// 비밀번호 변경
	public void modify_pass(MemberVO vo) throws Exception;
	
	// 회원탈퇴
	public void withdrawal(MemberVO vo) throws Exception;
	
}
