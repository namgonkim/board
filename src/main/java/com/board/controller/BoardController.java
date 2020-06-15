package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;
import com.board.domain.Page;
import com.board.domain.ReplyVO;
import com.board.service.BoardService;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/*")
public class BoardController {

	@Inject
	private BoardService service;
	@Inject
	private ReplyService replyservice;
	
	// 홈으로가기
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}
	
	// 게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {

		List<BoardVO> list = null;
		list = service.list();
		model.addAttribute("list", list);
	}
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(Model model) throws Exception {

	}
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(BoardVO vo) throws Exception {
		
		service.write(vo);
		return "redirect:/listPage?num=1";
	}
	
	// 게시물 조회
	/* 
	 @RequestParam : 주소에 있는 특정한 값을 가져옴
	 주소에서 bno를 찾아 그 값을 int bno에 넣어줌
	BoardVO응 이용하여 서비스(service)에서 데이터를 받고,
	모델(model)을 이용하여 뷰(view)에 데이터를 넘겨줌
	이때, 넘겨주는 모델의 이름은 view.
	 */
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		
		BoardVO vo = service.view(bno);
		model.addAttribute("view", vo);
		
		List<ReplyVO> replyList = replyservice.readReply(bno);
		model.addAttribute("replyList", replyList);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {

		BoardVO vo = service.view(bno);
		model.addAttribute("view", vo);
	}
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {

		service.modify(vo);
		return "redirect:/listPage?num=1";
	}
	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception {

		service.delete(bno);
		return "redirect:/listPage?num=1";
	}
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listpage", method = RequestMethod.GET)
	public void getListPage(Model model) throws Exception {

		List<BoardVO> list = null;
		list = service.list();
		model.addAttribute("list", list);
	}

	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
		// 별도의 Page관리 클래스 생성
		Page page = new Page();

		page.setNum(num);
		// 게시물 카운트 - setCount 내에 dataCalc() 메소드를 호출
		page.setCount(service.count());

		List<BoardVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());
		// 게시물 리스트 up
		model.addAttribute("list", list);
		// page up
		model.addAttribute("page", page);
		// 페이지 선택
		model.addAttribute("select", num);
	}
	
	// 게시물 목록 + 페이징 + 검색 추가
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num,
	@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
	@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(service.count());

		List<BoardVO> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

	}

	// 댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, Model model) throws Exception {
		replyservice.writeReply(vo);

		model.addAttribute("bno", vo.getBno());

		return "redirect:/view";
	}

	// 댓글 수정 POST
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String postreplyUpdate(ReplyVO vo, RedirectAttributes rttr) throws Exception {

		replyservice.updateReply(vo);

		rttr.addAttribute("bno", vo.getBno());

		return "redirect:/view";
	}

	// 댓글 삭제 POST
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String postreplyDelete(ReplyVO vo, RedirectAttributes rttr) throws Exception {
		
		replyservice.deleteReply(vo);

		rttr.addAttribute("bno", vo.getBno());

		return "redirect:/view";
	}
	
	// 댓글 수정 GET
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.GET)
	public void getReplyUpdate(@RequestParam("rno") int rno, Model model) throws Exception {
	 
	 ReplyVO vo = null;
	 vo = replyservice.readReplySelect(rno);
	 
	 model.addAttribute("readReply", vo);

	}

	// 댓글 수정 GET
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public void getReplyDelete(@RequestParam("rno") int rno, Model model) throws Exception {
	 
	 ReplyVO vo = null;
	 vo = replyservice.readReplySelect(rno);
	 
	 model.addAttribute("readReply", vo);
	}
}