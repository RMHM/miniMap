package com.kh.mhm.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mhm.board.model.service.BoardService;
import com.kh.mhm.board.model.vo.Board;
import com.kh.mhm.coment.model.service.ComentService;
import com.kh.mhm.coment.model.vo.Coment;
import com.kh.mhm.member.model.vo.Member;


@SessionAttributes(value = { "member" })
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ComentService comentService;

	@RequestMapping("/board/boardlist1.do")
	public String freeboard(/*@RequestParam int btype,*/@ModelAttribute("board") Board board, Model model) {
		
		/*List<Board> list = boardService.selectBoardList(btype);*/
		List<Board> list = boardService.selectBoardList(board);	
		List<Board> list2 = boardService.selectNoticeList(board);	
		
        model.addAttribute("list", list);
		model.addAttribute("list2", list2);		
		

		return "board/freeBoardList";
	}
	@RequestMapping("/board/boardlist2.do")
	public String infoboard() {
		return "board/infoBoardList";
	}
	@RequestMapping("/board/boardlist3.do")
	public String reviewboard() {
		return "board/reviewBoardList";
	}
	@RequestMapping("/board/boardlist4.do")
	public String qaboard() {
		return "board/qaBoardList";
	}
	
	
	@RequestMapping("/board/boardwrite.do")
	public String boardwrite() {
		
		return "/board/boardwrite";
	}
	
	@RequestMapping("board/boardinsert.do")
	public String boardinsert(Board board, Model model, HttpSession session, HttpServletRequest req) {
		int result;
		
		System.out.println(session.getAttribute("member"));
		System.out.println(board);
		System.out.println(req.getParameter("boardcontent"));
		board.setBContent(req.getParameter("boardcontent"));
		result = boardService.insertBoard(board);
		System.out.println(board);
		String loc = "/board/boardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 등록 성공!";
			loc = "/board/boardview.do?BId="+board.getBId();
			
		} else {
			msg = "게시글 등록 실패!";
		}
		
		model.addAttribute("loc", loc)
		.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	

	@RequestMapping("/board/boardview.do")
	public String boardview(@RequestParam int BId, Model model) {
		
		List<Coment> clist = comentService.selectCometList(BId);
		System.out.println(clist);
		model.addAttribute("b", boardService.selectOneBoard(BId)).
		addAttribute("clist", clist);
		
		System.out.println(BId);
		System.out.println(model);		
		/*model.addAttribute("b", boardService.updateOneCount(BId));*/
		return "board/boardview";
	}

	/*@RequestMapping(value="/board/boardview2.do", method=RequestMethod.POST)
	public String testEditorResult(HttpServletRequest req, Model model) {
		String result = req.getParameter("boardcontent");
		System.out.println(result);
		// 값 전달 확인
		Enumeration e = req.getParameterNames();
		String name = null;
		while (e.hasMoreElements()){
			name = e.nextElement().toString();
			System.out.println(name + " : " + req.getParameter(name));
		}		
		model.addAttribute("result", result);

		return "board/boardview";		
		
	}*/
	
	@RequestMapping("/board/boardUpdateView.do")
	public void boardUpdateView(@RequestParam("BId") int BId, Model model) {
		
		model.addAttribute("board", boardService.selectOneBoard(BId));
		System.out.println(boardService.selectOneBoard(BId));		
		
	}
	
	@RequestMapping("/board/boardUpdate.do")
	public String boardUpdate(Board board, HttpSession session, Model model, HttpServletRequest req) {
		
		int BId = board.getBId();
		board.setBContent(req.getParameter("boardcontent"));
		
		Board originBoard = boardService.selectOneBoard(BId);
		originBoard.setBTitle(board.getBTitle());		
		originBoard.setBContent(board.getBContent());
		
		int result = boardService.updateBoard(board);
		
		String loc = "/board/boardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 수정 성공!";
			loc = "/board/boardview.do?BId="+board.getBId();
			
		} else {
			msg = "게시글 수정 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
	
	@RequestMapping("/board/boardDelete.do")
	public String boardDelete(@RequestParam("BId") int BId, HttpSession session, Model model) {
		
		int result = boardService.deleteBoard(BId);
		
		String loc = "/board/boardlist1.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 삭제 성공!";
			
		} else {
			msg = "게시글 삭제 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	//////////////////////////////////
	// 기업 광고 게시판
	@RequestMapping("/board/adBoard.go")
	public String adBoard() {
		// 기업 게시판 게시물 가져오기
		return "/board/ad/adBoardList";
	}
	
	@RequestMapping("/board/adBoardWrite.go")
	public String adBoardWrite() {
		return "/board/ad/adBoardWrite";
	}
	
	@RequestMapping("/board/adBaordAdd.do")
	public String insertAdBoard(Board b, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("member");
		
		System.out.println("광고 게시글");
		System.out.println(m);
		System.out.println(b);
		
		
		return "/board/ad/adBoardList";
	}
	
	// 이미지 업로드
	@RequestMapping(value = "/board/imageUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> imageUpload(@RequestParam("image_file") MultipartFile mfile, HttpSession session) {
		Map<String, Object> fileInfo = null;
		
		if(mfile != null && !(mfile.getOriginalFilename().equals(""))) {
			fileInfo = new HashMap<String, Object>();
			
			String originName = mfile.getOriginalFilename();
			String originExtension = originName.substring(originName.lastIndexOf(".")+1).toLowerCase();
			
			List<String> extension = new ArrayList<String>();
			extension.add("jpg");
			extension.add("png");
			extension.add("bmp");
			
			if(!(extension.contains(originExtension))) {
				// 허용되지 않은 확장자
				fileInfo.put("result", -1);
				return fileInfo;
			}
			
			long fileSize = mfile.getSize();
			long maxSize = 1 * 1024 * 1024; // 1mb
			if(fileSize>maxSize) {
				// 파일 크기 제한
				fileInfo.put("result", -2);
				return fileInfo;
			}
			
			// 저장경로
			String defaultPath = session.getServletContext().getRealPath("/resources/img/upload");
			
			// 저장경로 지정
			File file = new File(defaultPath);
			if(!file.exists()) file.mkdirs(); // 경로가 존재하지 않으면 생성
			
			// 서버에 저장할 파일명 지정
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today= formatter.format(new Date());
			String rename = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originExtension;

			// Multipart 처리
			try {
				// 지정된 경로에 파일 저장
				mfile.transferTo(new File(defaultPath+rename));
				
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
			
			String imgUrl = session.getServletContext().getContextPath() + rename;
			fileInfo.put("imageurl", imgUrl);		// 상대파일경로
			fileInfo.put("filename", rename);		// 파일명
			fileInfo.put("filesize", fileSize);		// 파일 사이즈
			fileInfo.put("imagealign", "C");		// 이미지 정렬
			fileInfo.put("originalurl", imgUrl);	// 실제 파일 경로
			fileInfo.put("thumburl", imgUrl);		// 썸네일 파일 경로
			fileInfo.put("result", 1);
		}
		return fileInfo;
	}
}
