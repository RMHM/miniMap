package com.kh.mhm.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mhm.board.model.service.BoardService;
import com.kh.mhm.board.model.vo.Board;
import com.kh.mhm.board.model.vo.Fileref;
import com.kh.mhm.coment.model.service.ComentService;
import com.kh.mhm.coment.model.vo.Coment;
import com.kh.mhm.common.util.Utils;
import com.kh.mhm.member.model.service.MemberService;
import com.kh.mhm.member.model.vo.Member;

@SessionAttributes(value = { "member" })
@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private ComentService comentService;
	@Autowired
	private MemberService ms;
	
	
	@RequestMapping("/board/boardlist1.do")
	public String freeboard(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model,
			Board board) {
		int numPerPage = 10;					

		ArrayList<Board/*Map<String, Object String>*/> list = 
				new ArrayList<Board/*Map<String, ObjectString>*/>(boardService.selectBoardList1(cPage, numPerPage));		
		int totalContents = boardService.selectBoardTotalContents1();		

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardlist1.do");
		List<Board> list2 = boardService.selectNoticeList1(board);				
		List<Board> list3 = boardService.selectBestList1(board);
			
		List<Integer> cc = new ArrayList<Integer>();
		List<Integer> cc2 = new ArrayList<Integer>();
		List<Integer> cc3 = new ArrayList<Integer>();
		
		for(int i=0; i<list.size(); i++) {			
			cc.add(boardService.selectCommentCnt(list.get(i).getBId()));			
		}
		
		for(int i=0; i<list2.size(); i++) {			
			cc2.add(boardService.selectCommentCnt(list2.get(i).getBId()));			
		}
		
		for(int i=0; i<list3.size(); i++) {			
			cc3.add(boardService.selectCommentCnt(list3.get(i).getBId()));			
		}				

		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", numPerPage).addAttribute("pageBar", pageBar)
				.addAttribute("list2", list2).addAttribute("list3", list3)
				.addAttribute("cc", cc).addAttribute("cc2", cc2).addAttribute("cc3", cc3);

		return "board/freeBoardList";
	}

	@RequestMapping("/board/searchlist1.do")
	public String freeSearchBoard(@RequestParam(required = false) String keyField,
			@RequestParam(required = false) String keyWord, Model model, Board board) {

		List<Board> list = boardService.selectSearchList1(keyField, keyWord);
		
		List<Integer> cc = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++) {		
			cc.add(boardService.selectCommentCnt(list.get(i).getBId()));			
		}

		model.addAttribute("list", list).addAttribute("keyWord", keyWord).addAttribute("keyField", keyField)
		.addAttribute("cc",cc);

		return "board/freeBoardList";
	}

	@RequestMapping("/board/boardlist2.do")
	public String infoboard(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model,
			Board board) {
		int numPerPage = 10;

		ArrayList<Board> list = new ArrayList<Board>(boardService.selectBoardList2(cPage, numPerPage));

		int totalContents = boardService.selectBoardTotalContents2();

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardlist2.do");
		List<Board> list2 = boardService.selectNoticeList2(board);
		List<Board> list3 = boardService.selectBestList2(board);

		System.out.println(pageBar);
		
		List<Integer> cc = new ArrayList<Integer>();
		List<Integer> cc2 = new ArrayList<Integer>();
		List<Integer> cc3 = new ArrayList<Integer>();
		
		for(int i=0; i<list.size(); i++) {			
			cc.add(boardService.selectCommentCnt(list.get(i).getBId()));			
		}
		
		for(int i=0; i<list2.size(); i++) {			
			cc2.add(boardService.selectCommentCnt(list2.get(i).getBId()));			
		}
		
		for(int i=0; i<list3.size(); i++) {			
			cc3.add(boardService.selectCommentCnt(list3.get(i).getBId()));			
		}

		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", numPerPage).addAttribute("pageBar", pageBar)
				.addAttribute("list2", list2).addAttribute("list3", list3)
				.addAttribute("cc", cc).addAttribute("cc2", cc2).addAttribute("cc3", cc3);
		
		return "board/infoBoardList";
	}
	
	@RequestMapping("/board/searchlist2.do")
	public String infoSearchBoard(@RequestParam(required = false) String keyField,
			@RequestParam(required = false) String keyWord, Model model, Board board) {

		List<Board> list = boardService.selectSearchList2(keyField, keyWord);
		
		List<Integer> cc = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++) {			
			cc.add(boardService.selectCommentCnt(list.get(i).getBId()));			
		}

		model.addAttribute("list", list).addAttribute("keyWord", keyWord).addAttribute("keyField", keyField)
		.addAttribute("cc",cc);
		return "board/infoBoardList";
	}
	
	@RequestMapping("/board/boardlist3.do")
	public String reviewboard(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model,
			Board board) {
		int numPerPage = 10;

		ArrayList<Board> list = new ArrayList<Board>(
				boardService.selectBoardList3(cPage, numPerPage));

		int totalContents = boardService.selectBoardTotalContents3();

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardlist3.do");
		List<Board> list2 = boardService.selectNoticeList3(board);
		List<Board> list3 = boardService.selectBestList3(board);

		System.out.println(pageBar);
		
		List<Integer> cc = new ArrayList<Integer>();
		List<Integer> cc2 = new ArrayList<Integer>();
		List<Integer> cc3 = new ArrayList<Integer>();
		
		for(int i=0; i<list.size(); i++) {		
			cc.add(boardService.selectCommentCnt(list.get(i).getBId()));			
		}
		
		for(int i=0; i<list2.size(); i++) {			
			cc2.add(boardService.selectCommentCnt(list2.get(i).getBId()));			
		}
		
		for(int i=0; i<list3.size(); i++) {			
			cc3.add(boardService.selectCommentCnt(list3.get(i).getBId()));			
		}

		model.addAttribute("list", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("list2", list2).addAttribute("list3", list3)
			 .addAttribute("cc", cc).addAttribute("cc2", cc2).addAttribute("cc3", cc3);
		
		System.out.println("list : " + list);
		
		return "board/reviewBoardList";
	}
	
	@RequestMapping("/board/searchlist3.do")
	public String reviewSearchBoard(@RequestParam(required = false) String keyField,
			@RequestParam(required = false) String keyWord, Model model, Board board) {

		List<Board> list = boardService.selectSearchList3(keyField, keyWord);
		
		List<Integer> cc = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++) {			
			cc.add(boardService.selectCommentCnt(list.get(i).getBId()));			
		}

		model.addAttribute("list", list).addAttribute("keyWord", keyWord).addAttribute("keyField", keyField)
		.addAttribute("cc",cc);

		return "board/reviewBoardList";
	}
	
	@RequestMapping("/board/boardlist4.do")
	public String qaboard(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model,
			Board board) {
		int numPerPage = 10;

		ArrayList<Board> list = new ArrayList<Board>(
				boardService.selectBoardList4(cPage, numPerPage));

		int totalContents = boardService.selectBoardTotalContents4();

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardlist4.do");
		List<Board> list2 = boardService.selectNoticeList4(board);
		List<Board> list3 = boardService.selectBestList4(board);

		System.out.println(pageBar);
		
		List<Integer> cc = new ArrayList<Integer>();
		List<Integer> cc2 = new ArrayList<Integer>();
		List<Integer> cc3 = new ArrayList<Integer>();
		
		for(int i=0; i<list.size(); i++) {			
			cc.add(boardService.selectCommentCnt(list.get(i).getBId()));			
		}
		
		for(int i=0; i<list2.size(); i++) {			
			cc2.add(boardService.selectCommentCnt(list2.get(i).getBId()));			
		}
		
		for(int i=0; i<list3.size(); i++) {			
			cc3.add(boardService.selectCommentCnt(list3.get(i).getBId()));			
		}

		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", numPerPage).addAttribute("pageBar", pageBar)
				.addAttribute("list2", list2).addAttribute("list3", list3)
				.addAttribute("cc", cc).addAttribute("cc2", cc2).addAttribute("cc3", cc3);
		
		return "board/qaBoardList";
	}
	
	@RequestMapping("/board/searchlist4.do")
	public String qaSearchBoard(@RequestParam(required = false) String keyField,
			@RequestParam(required = false) String keyWord, Model model, Board board) {

		List<Board> list = boardService.selectSearchList4(keyField, keyWord);
		
		List<Integer> cc = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++) {			
			cc.add(boardService.selectCommentCnt(list.get(i).getBId()));			
		}

		model.addAttribute("list", list).addAttribute("keyWord", keyWord).addAttribute("keyField", keyField)
		.addAttribute("cc",cc);

		return "board/qaBoardList";
	}



	@RequestMapping("/board/boardwrite.do")
	public ModelAndView boardwrite(Model model, HttpServletRequest request, HttpServletResponse response) {
		 
		Member m = (Member)request.getSession().getAttribute("member");		
	     ModelAndView mv = new ModelAndView();
	        if(m == null)   {
				mv.addObject("msg", "로그인이 필요합니다.");
				mv.addObject("url", "/member/loginPage.go"); 
				mv.setViewName("common/redirect");
						
			}else if(m.getMtype().equals("C")){
				mv.addObject("msg", "기업회원은 사용하실 수 없는 기능입니다.");
				mv.addObject("url", "http://localhost/board/adBoard.go"); 
				mv.setViewName("common/redirect");
			} else {
				mv.setViewName("board/boardwrite");
			}
		
		 /*return "/board/boardwrite";*/
		return mv;
	}

	@RequestMapping("board/boardinsert.do")
	public ModelAndView boardinsert(Board board, Model model, HttpSession session, HttpServletRequest req) {

		ModelAndView mv = new ModelAndView();

		List<String> imgList = new ArrayList<String>();
		String str = "upload/";
		int start = 0;
		board.setBContent(req.getParameter("boardcontent"));
		while (true) {
			// 글 내용에서 이미지 이름 파싱
			int begin = board.getBContent().indexOf(str, start) + str.length();
			int end = board.getBContent().indexOf(34, begin);
			if (start > end)
				break;
			imgList.add(board.getBContent().substring(begin, end));
			start = end;
		}

		if (imgList.size() > 0)
			board.setHasFile("Y");
		else
			board.setHasFile("N");

		// 게시글 등록
		try {
			boardService.insertBoard(board);
			System.out.println("이미지 게시글 등록!");
			// 이미지 파일이 존재하면 등록
			if (imgList.size() > 0) {
				for (int i = 0; i < imgList.size(); i++) {
					Fileref fref = new Fileref();
					fref.setbId(board.getBId());
					fref.setfType("I");
					fref.setOrigin_Name(imgList.get(i));
					fref.setChange_Name(imgList.get(i));
					boardService.insertImgFile(fref);
				}
			}
			mv.addObject("msg", "게시물 등록을 성공하였습니다!");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "게시물 등록에 실패하였습니다.");
		}

		mv.addObject("loc", "/board/boardview.do?BId=" + board.getBId());
		mv.setViewName("common/msg");

		return mv;

		/*
		 * int result;
		 * 
		 * System.out.println(session.getAttribute("member"));
		 * 
		 * System.out.println(req.getParameter("boardcontent"));
		 * board.setBContent(req.getParameter("boardcontent")); result =
		 * boardService.insertBoard(board);
		 * 
		 * String loc = "/board/boardList.do"; String msg = "";
		 * 
		 * if(result > 0) { msg = "게시글 등록 성공!"; loc =
		 * "/board/boardview.do?BId="+board.getBId();
		 * 
		 * } else { msg = "게시글 등록 실패!"; }
		 * 
		 * model.addAttribute("loc", loc) .addAttribute("msg", msg);
		 * System.out.println(board); return "common/msg";
		 */

	}

	@RequestMapping("/board/boardview.do")
	public ModelAndView boardview(@RequestParam int BId, Model model,
			HttpServletRequest request) {
      Member m = (Member)request.getSession().getAttribute("member");		
      ModelAndView mv = new ModelAndView();
      // 게시물 볼대 비로그인시 로그인페이지로 이동.
      if(request.getSession().getAttribute("member") == null) {
			mv.addObject("msg", "로그인이 필요합니다.");
			mv.addObject("url", "/member/loginPage.go"); 
			mv.setViewName("common/redirect");
			/*response.sendRedirect("/member/loginPage.go");*/			
		}else {
        Board b = boardService.selectOneBoard(BId);	       
        if(b.getBCode() != 5 && b.getDelFlag().equals("N")) {
				List<Coment> clist = comentService.selectCometList(BId);
				boardService.updateOneCount(BId);
				mv.addObject("b", b).addObject("clist", clist);
				mv.setViewName("board/boardview");
			} else {
				mv.addObject("msg", "잘못된 게시물 요청입니다.").addObject("url", "/board/boardlist1.do");
				mv.setViewName("common/redirect");
			}
      if(b.getRFlag().equals("Y")) {
        if(m.getMtype().equals("A")){
          List<Coment> clist = comentService.selectCometList(BId);
          boardService.updateOneCount(BId);
          mv.addObject("b", b).addObject("clist", clist);
          mv.setViewName("board/boardview");
        } else {
          mv.addObject("msg", "관리자만 접근가능합니다.").addObject("url", "/board/boardlist1.do");
          mv.setViewName("common/redirect");
        }			
      }
		}
		return mv;
	}

	/*
	 * @RequestMapping(value="/board/boardview2.do", method=RequestMethod.POST)
	 * public String testEditorResult(HttpServletRequest req, Model model) { String
	 * result = req.getParameter("boardcontent"); System.out.println(result); // 값
	 * 전달 확인 Enumeration e = req.getParameterNames(); String name = null; while
	 * (e.hasMoreElements()){ name = e.nextElement().toString();
	 * System.out.println(name + " : " + req.getParameter(name)); }
	 * model.addAttribute("result", result);
	 * 
	 * return "board/boardview";
	 * 
	 * }
	 */

	@RequestMapping("/board/boardUpdateView.do")
	public ModelAndView boardUpdateView(@RequestParam("BId") int BId, Model model
			,HttpServletRequest request, Board board) {
		
		board = boardService.selectOneBoard(BId);		
		 Member m = (Member)request.getSession().getAttribute("member");		
	     ModelAndView mv = new ModelAndView();  
	     
	     if(m == null)   {
				mv.addObject("msg", "로그인이 필요합니다.");
				mv.addObject("url", "/member/loginPage.go"); 
				mv.setViewName("common/redirect");
						
			}else if(m.getMno() != board.getMNo()){
				mv.addObject("msg", "잘못된 접근입니다.");
				mv.addObject("url", "/board/boardlist1.do"); 
				mv.setViewName("common/redirect");
			} else {
				model.addAttribute("board", boardService.selectOneBoard(BId));
				BId= board.getBId();
				mv.addObject("url", "/board/boardUpdateView.do?BId="+BId); 
				
			}	     
	    /*
	    	 
	     model.addAttribute("board", boardService.selectOneBoard(BId));
	 	System.out.println(boardService.selectOneBoard(BId));*/

		return mv;

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

		if (result > 0) {
			msg = "게시글 수정 성공!";
			loc = "/board/boardview.do?BId=" + board.getBId();

		} else {
			msg = "게시글 수정 실패!";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "common/msg";
	}
	
	@RequestMapping("/board/boardBlindOff.do")
	public String boardBlindOff(@RequestParam("BId") int BId, HttpSession session, Model model) {
		
		
		Board originBoard = boardService.selectOneBoard(BId);
		int bcode = originBoard.getBCode();
		
		int result = boardService.updateBlindOff(BId);
		
		String loc = "/board/boardlist"+bcode+".do";
		String msg = "";

		if (result > 0) {
			msg = "게시물의 블라인드가 해제되었습니다";

		} else {
			msg = "신고해제 실패!";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "common/msg";				

	}

	@RequestMapping("/board/boardDelete.do")
	public String boardDelete(@RequestParam("BId") int BId, HttpSession session, Model model
			,HttpServletRequest request) {
		
		Board originBoard = boardService.selectOneBoard(BId);
		int bcode = originBoard.getBCode();
		Member m = (Member)request.getSession().getAttribute("member");
		 		
		String loc = "/board/boardlist"+bcode+".do";		
		String msg = "";
		
		if(originBoard.getMNo()==m.getMno()) {
			int result = boardService.deleteBoard(BId);	
			if (result > 0) {
				msg = "게시글 삭제 성공!";

			} else {
				msg = "게시글 삭제 실패!";
			}
		}else {
			msg ="잘못된 접근입니다";
		}	

		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "common/msg";
	}

	//////////////////////////////////
	// 기업 광고 게시판
	@RequestMapping("/board/adBoard.go")
	public ModelAndView adBoard(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "type", required = false, defaultValue = "") String type,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<Board> list = null;
		List<String> thumbnail = null;
		List<Integer> comment = null;
		Map<String, Object> param = null;

		try {
			// 기업 게시판 게시물 가져오기
			list = new ArrayList<Board>();
			thumbnail = new ArrayList<String>();
			comment = new ArrayList<Integer>();
      
			param = new HashMap<String, Object>();
			param.put("bCode", 5);
			param.put("type", type);
			param.put("keyword", keyword);
      
			int pageInNum = 3;
			int totCnt = boardService.selectBoardCnt(param);
			int maxPage = 0;
			if (totCnt == 0) maxPage = 1;
			else maxPage = (totCnt % pageInNum == 0) ? (int) totCnt / pageInNum : (int) (totCnt / pageInNum + 1);
			 	
			param.put("cPage", cPage);
			param.put("num", pageInNum);
			
			list = boardService.selectBoardListPart(param);
			
			for (int i = 0; i < list.size(); i++) {
				thumbnail.add(boardService.selectThumbnailImg(list.get(i).getBId()));
				comment.add(boardService.selectCommentCnt(list.get(i).getBId()));
			}
			
			Member m = (Member) session.getAttribute("member");
			String authority = "";
			if(m != null) if(boardService.selectAuthority(m.getMno())>0) authority = "yes";
			
			mv.addObject("blist", list).addObject("thumb", thumbnail).addObject("comment", comment);	// 리스트
			mv.addObject("cPage", cPage).addObject("type", type).addObject("keyword", keyword).addObject("maxPage", maxPage).addObject("authority", authority);
			mv.setViewName("board/ad/adBoardList");
		} catch (Exception e) {
			e.getStackTrace();
			mv.addObject("msg", "게시물 불러오기를 실패하였습니다.");
			mv.addObject("loc", "/");
			mv.setViewName("common/msg");
		}

		return mv;
	}

	@RequestMapping("/board/adBoardWrite.go")
	public String adBoardWrite() {
		return "/board/ad/adBoardWrite";
	}

	// 이미지 포함 게시물 등록
	@RequestMapping("/board/imgBaordAdd.do")
	public ModelAndView insertImgBoard(Board b, Model model, HttpSession session) {

		ModelAndView mv = new ModelAndView();
		Member m = (Member) session.getAttribute("member");

		System.out.println("광고 게시글");
		System.out.println(m);
		System.out.println(b);

		List<String> imgList = new ArrayList<String>();
		String str = "upload/";
		int start = 0;
		while (true) {
			// 글 내용에서 이미지 이름 파싱
			int begin = b.getBContent().indexOf(str, start) + str.length();
			int end = b.getBContent().indexOf(34, begin);
			if (start > end)
				break;
			imgList.add(b.getBContent().substring(begin, end));
			start = end;
		}
		System.out.println("파싱끝");
		if (imgList.size() > 0)
			b.setHasFile("Y");
		else
			b.setHasFile("N");

		// 게시글 등록
		try {
			boardService.insertImgBoard(b);
			System.out.println("이미지 게시글 등록!");
			// 이미지 파일이 존재하면 등록
			if (imgList.size() > 0) {
				for (int i = 0; i < imgList.size(); i++) {
					Fileref fref = new Fileref();
					fref.setbId(b.getBId());
					fref.setfType("I");
					fref.setOrigin_Name(imgList.get(i));
					fref.setChange_Name(imgList.get(i));
					boardService.insertImgFile(fref);
				}
			}
			mv.addObject("msg", "게시물 등록을 성공하였습니다!");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "게시물 등록에 실패하였습니다.");
		}

		mv.addObject("loc", "/board/adBoard.go");
		mv.setViewName("common/msg");

		return mv;
	}

	// 이미지 업로드
	@RequestMapping(value = "/board/imageUpload.do", method = { RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> imageUpload(@RequestParam("image_file") MultipartFile mfile, HttpSession session) {
		Map<String, Object> fileInfo = null;

		if (mfile != null && !(mfile.getOriginalFilename().equals(""))) {
			fileInfo = new HashMap<String, Object>();

			String originName = mfile.getOriginalFilename();
			String originExtension = originName.substring(originName.lastIndexOf(".") + 1).toLowerCase();

			List<String> extension = new ArrayList<String>();
			extension.add("jpg");
			extension.add("png");
			extension.add("bmp");

			if (!(extension.contains(originExtension))) {
				// 허용되지 않은 확장자
				fileInfo.put("result", -1);
				return fileInfo;
			}

			long fileSize = mfile.getSize();
			long maxSize = 30 * 1024 * 1024; // 30mb
			if (fileSize > maxSize) {
				// 파일 크기 제한
				fileInfo.put("result", -2);
				return fileInfo;
			}

			// 저장경로
			String defaultPath = session.getServletContext().getRealPath("/resources/img/upload/");

			// 저장경로 지정
			File file = new File(defaultPath);
			if (!file.exists())
				file.mkdirs(); // 경로가 존재하지 않으면 생성

			// 서버에 저장할 파일명 지정
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new Date());
			String rename = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originExtension;

			// Multipart 처리
			try {
				// 지정된 경로에 파일 저장
				mfile.transferTo(new File(defaultPath + rename));

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			String imgUrl = session.getServletContext().getContextPath() + "/resources/img/upload/" + rename;
			fileInfo.put("imageurl", imgUrl); // 상대파일경로
			fileInfo.put("filename", rename); // 파일명
			fileInfo.put("filesize", fileSize); // 파일 사이즈
			fileInfo.put("imagealign", "C"); // 이미지 정렬
			fileInfo.put("originalurl", imgUrl); // 실제 파일 경로
			fileInfo.put("thumburl", imgUrl); // 썸네일 파일 경로
			fileInfo.put("result", 1);
		}
		return fileInfo;
	}

	// 이미지 게시물 불러오기
	@RequestMapping("/board/adBoardView.do")
	public ModelAndView adBoradView(@RequestParam int bid, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member m = (Member)session.getAttribute("member");
		
		if(m != null) {
			try {
				Board b = boardService.selectOneBoard(bid);
				
				if(b.getRFlag().equals("N") && b.getBCode()==5) {
					boardService.updateOneCount(bid);
					List<Coment> clist = comentService.selectCometList(bid);
					
					Member writer = ms.selectOne(b.getMNo());
					
					mv.addObject("b", b);
					mv.addObject("mtype", writer.getMtype());
					mv.addObject("profile", writer.getProfilePath());
					mv.addObject("clist", clist);
					mv.setViewName("board/ad/adBoardView");
				} else if(b.getBCode()!=5) {
					mv.addObject("loc", "/board/adBoard.go");
					mv.addObject("msg", "잘못된 게시물 요청입니다.");
					mv.setViewName("common/msg");
				} else if(b.getRFlag().equals("Y")) {
					mv.addObject("loc", "/board/adBoard.go");
					mv.addObject("msg", "신고된 게시물은 열람하실수 없습니다.");
					mv.setViewName("common/msg");
				} else if(b.getDelFlag().equals("Y")) {
					mv.addObject("loc", "/board/adBoard.go");
					mv.addObject("msg", "삭제된 게시물은 열람하실수 없습니다.");
					mv.setViewName("common/msg");
				}
			} catch (Exception e) {
				e.getStackTrace();
				mv.addObject("msg", "게시물 불러오기에 실패하였습니다.");
				mv.addObject("loc", "/");
				mv.setViewName("common/msg");
			}
		} else {
			mv.addObject("msg", "로그인 후 이용바랍니다.").addObject("loc", "/member/loginPage.go");
			mv.setViewName("common/msg");
		}
		
		return mv;
	}

	// 이미지 게시물 삭제하기
	@RequestMapping("/board/adBoardRemove.do")
	public ModelAndView adBoardRemove(@RequestParam int bid) {
		ModelAndView mv = new ModelAndView();

		try {
			boardService.deleteBoard(bid); // 게시물 삭제
			boardService.deleteImg(bid); // 게시물 내 포함된 이미지 삭제

			mv.addObject("msg", "게시물 삭제에 성공하였습니다.");
		} catch (Exception e) {
			e.getStackTrace();
			mv.addObject("msg", "게시물 삭제에 실패하였습니다.");
		}
		mv.addObject("loc", "/board/adBoard.go");
		mv.setViewName("common/msg");
		return mv;
	}

	// 이미지 게시물 수정 페이지 전환
	@RequestMapping("/board/adBoardUpdate.go")
	public ModelAndView adBoardUpdateView(@RequestParam int bid) {
		ModelAndView mv = new ModelAndView();

		try {
			mv.addObject("b", boardService.selectOneBoard(bid));
			mv.setViewName("/board/ad/adBoardUpdateView");
		} catch (Exception e) {
			e.getStackTrace();
			mv.addObject("msg", "수정페이지 이동에 실패하였습니다.");
			mv.addObject("loc", "/board/adBoard.go");
			mv.setViewName("common/msg");
		}
		return mv;
	}

	// 이미지 게시물 수정하기
	@RequestMapping("/board/adBoardUpdate.do")
	public ModelAndView adBoardUpdate(Board b) {
		ModelAndView mv = new ModelAndView();

		try {

			List<String> imgList = new ArrayList<String>();
			String str = "upload/";
			int start = 0;
			while (true) {
				// 글 내용에서 이미지 이름 파싱
				int begin = b.getBContent().indexOf(str, start) + str.length();
				int end = b.getBContent().indexOf(34, begin);
				if (start > end)
					break;
				imgList.add(b.getBContent().substring(begin, end));
				start = end;
			}

			List<String> saveImgList = boardService.selectBoardImg(b.getBId());
			String hasFile = "N";
			for (int i = 0; i < imgList.size(); i++) {
				// 추가되는 이미지가 있는지 여부 확인
				if (!saveImgList.contains(imgList.get(i))) {
					Fileref fref = new Fileref();
					fref.setfType("I");
					fref.setOrigin_Name(imgList.get(i));
					fref.setChange_Name(imgList.get(i));
					fref.setbId(b.getBId());
					// 저장하기
					boardService.insertImgFile(fref);
				}
				hasFile = "Y";
			}

			for (int i = 0; i < saveImgList.size(); i++) {
				// 새로 저장되는 게시글에 기존 저장된 이미지를 그대로 사용하는지 확인
				if (!imgList.contains(saveImgList.get(i))) {
					// 파일명 삭제
					boardService.deleteOneImg(saveImgList.get(i));
				}
			}

			b.setHasFile(hasFile);
			System.out.println(b);
			boardService.updateImgBoard(b);

			mv.addObject("msg", "게시물 수정 성공!");
			mv.addObject("loc", "/board/adBoardView.do?bid=" + b.getBId());
			mv.setViewName("common/msg");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.getStackTrace();
			mv.addObject("msg", "게시물 수정에 실패하였습니다.");
			mv.addObject("loc", "/board/adBoard.go");
			mv.setViewName("common/msg");
		}

		return mv;
	}
	
	// 최근 후기 게시물 가져오기
	@RequestMapping("/board/recentBoard.do")
	@ResponseBody
	public List<Board> recentBaord(@RequestParam int bCode, @RequestParam int maxNum){
		List<Board> result = null;
		Map<String, Integer> param = null;
		
		try {
			result = new ArrayList<Board>();
			param = new HashMap<String, Integer>();
			param.put("bCode", bCode);
			param.put("maxNum", maxNum);
			
			result = boardService.selectRecentBoard(param);
			
		} catch(Exception e) {
			e.getStackTrace();
		}
		
		return result;
	}
	
}
