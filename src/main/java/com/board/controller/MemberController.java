package com.board.controller;

import java.lang.reflect.Member;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.service.MemberService;
import com.board.domain.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	// 회원가입 get
	@RequestMapping(value = "/member/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/member/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");
		
		// 비밀번호 암호화
		String inputPass = vo.getUserPass();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setUserPass(pwd);
		
		service.register(vo);
		
		return "redirect:/member/login";
	}
	
	// 로그인 get
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public void getlogin() throws Exception {
		logger.info("get login");
	}
		
	// 로그인 post
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");

		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		
		// 암호화 패스워드 매칭
		boolean pwdMatch;
		// 로그인시 null값 들어가면 오류뜨는 예외처리
		if (login != null)
			pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		else
			pwdMatch = false;
		
		// 매칭에 따라 로그인 성공과 실패 적용
		if (login != null && pwdMatch) {

			session.setAttribute("member", login);

		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}
		// 구 로그인 방식
		/*
		 * if(login == null) {
		 * 	session.setAttribute("member", null);
		 * 	rttr.addFlashAttribute("msg", false);
		 * }
		 * else { 
		 * 	session.setAttribute("member", login);
		 * }
		 */

		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 마이페이지 이동
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public void getMypage() throws Exception {
		logger.info("get My page");
		
	}
	// 회원정보 수정 get
	@RequestMapping(value = "/member/modify", method = RequestMethod.GET)
	public void getModify() throws Exception {
		logger.info("get Member modify");
		
	}
	// 회원정보 수정 post
	@RequestMapping(value = "/member/modify", method = RequestMethod.POST)
	public String postModify(HttpSession session, MemberVO vo) throws Exception {
	 logger.info("post Member modify");
	 service.modify(vo);
	 session.invalidate();
	 
	 return "redirect:/";
	}
	// 비밀번호 변경 get
	@RequestMapping(value = "/member/modify_pass", method = RequestMethod.GET)
	public void getModify_pass() throws Exception {
		logger.info("get Member modify password");
		
	}
	// 비밀번호 변경 post
	@RequestMapping(value = "/member/modify_pass", method = RequestMethod.POST)
	public String postModify_pass(HttpSession session, MemberVO vo) throws Exception {
		logger.info("post Member modify password");

		// 회원의 비밀번호를 변경한 뒤에도 암호화를 적용
		String inputPass = vo.getUserPass();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setUserPass(pwd);

		service.modify_pass(vo);
		session.invalidate();

		return "redirect:/";
	}

	// 회원 탈퇴 get
	@RequestMapping(value = "/member/withdrawal", method = RequestMethod.GET)
	public void getWithdrawal() throws Exception {
		logger.info("get withdrawal");

	}
	// 회원 탈퇴 post
	@RequestMapping(value = "/member/withdrawal", method = RequestMethod.POST)
	public String postWithdrawal(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("post withdrawal");

		MemberVO member = (MemberVO) session.getAttribute("member");

		String oldPass = member.getUserPass();
		String newPass = vo.getUserPass();

		if (!(oldPass.equals(newPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/withdrawal";
		}

		service.withdrawal(vo);
		session.invalidate();

		return "redirect:/";
	}

	// 회원 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		logger.info("post idCheck");

		String userId = req.getParameter("userId");
		MemberVO idCheck = service.idCheck(userId);

		int result = 0;

		if (idCheck != null) {
			result = 1;
		}

		return result;
	}
}