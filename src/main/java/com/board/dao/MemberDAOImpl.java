package com.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject SqlSession sql;
	private static String namespace = "com.board.mappers.member";
	
	// 회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".register", vo);
	}
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		// return sql.selectOne(namespace + ".login",vo);
		// 암호화 적용
		return sql.selectOne(namespace + ".loginBcrypt", vo);
	}
	// 회원정보 변경
	@Override
	public void modify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}
	// 비밀번호 변경
	@Override
	public void modify_pass(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		sql.update(namespace + ".modify_pass", vo);
	}
	// 회원탈퇴
	@Override
	public void withdrawal(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".withdrawal", vo);
	}
	// id 중복검사
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".idCheck", userId);
	}

}
