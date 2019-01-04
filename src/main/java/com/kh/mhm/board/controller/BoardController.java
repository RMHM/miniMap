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
import com.kh.mhm.member.model.vo.Member;

@SessionAttributes(value = { "member" })
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ComentService comentService;
	
	@RequestMapping("/board/boardlist1.do")
	public String freeboard(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage, 
							/*@RequestParam(required=false) String keyField,
							@RequestParam(required=false) String keyWord,*/	
							Model model, Board board) {
		int numPerPage = 4;
		
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(boardService.selectBoardList2(cPage, numPerPage/*, keyField, keyWord*/));
		
		int totalContents = boardService.selectBoardTotalContents();
    
    String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardlist1.do");
		List<Board> list2 = boardService.selectNoticeList(board);
		/*List<Board> list3 = boardService.selectBoardList(keyField, keyWord);*/
		System.out.println(pageBar);
		
		/*if(list3 == null) {*/
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar)
		.addAttribute("list2", list2);
		/*.addAttribute("keyWord",keyWord)
		.addAttribute("keyField",keyField);*/
		
		/*} else {
			
		model.addAttribute("list3", list3)
		.addAttribute("keyWord",keyWord)
		.addAttribute("keyField",keyField);
			
		}*/
		
		return "board/freeBoardList";
	}
   /*@RequestMapping("/board/boardlist.do")
	public String freeboard2(@RequestParam int bCode, @ModelAttribute("board") Board board, Model model) {
		
		List<Board> list = boardService.selectBoardList(bCode);
		List<Board> list = boardService.selectBoardList(board);	
		List<Board> list2 = boardService.selectNoticeList(board);	
		
        model.addAttribute("list", list);
		model.addAttribute("list2", list2);		
		

		return "board/freeBoardList";
	}*/
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
	public ModelAndView boardinsert(Board board, Model model, HttpSession session, HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView();
		Member m = (Member)session.getAttribute("member");
		
		List<String> imgList = new ArrayList<String>();
		String str = "upload/";
		int start = 0;
		board.setBContent(req.getParameter("boardcontent"));
		while(true) {
			// 글 내용에서 이미지 이름 파싱
			int begin = board.getBContent().indexOf(str, start) + str.length();
			int end = board.getBContent().indexOf(34, begin);
			if(start>end) break;
			imgList.add(board.getBContent().substring(begin, end));
			start = end;
		}
		
		if(imgList.size()>0) board.setHasFile("Y");
		else board.setHasFile("N");
		
		// 게시글 등록
				try {
					boardService.insertBoard(board);
					System.out.println("이미지 게시글 등록!");
					// 이미지 파일이 존재하면 등록
					if(imgList.size()>0) {
						for(int i=0; i<imgList.size(); i++) {
							Fileref fref = new Fileref();
							fref.setbId(board.getBId());
							fref.setfType("I");
							fref.setOrigin_Name(imgList.get(i));
							fref.setChange_Name(imgList.get(i));
							boardService.insertImgFile(fref);
						}
					}
					mv.addObject("msg", "게시물 등록을 성공하였습니다!");
				} catch(Exception e) {
					e.printStackTrace();
					mv.addObject("msg", "게시물 등록에 실패하였습니다.");
				}
				
				mv.addObject("loc", "/board/boardview.do?BId="+board.getBId());
				mv.setViewName("common/msg");
				
				return mv;
		
		/*int result;
		
		System.out.println(session.getAttribute("member"));
		
		System.out.println(req.getParameter("boardcontent"));
		board.setBContent(req.getParameter("boardcontent"));
		result = boardService.insertBoard(board);
		
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
		System.out.println(board);
		return "common/msg";*/
		
	}
	

	@RequestMapping("/board/boardview.do")
	public String boardview(@RequestParam int BId, Model model) {
		
		List<Coment> clist = comentService.selectCometList(BId);
		System.out.println(clist);
		model.addAttribute("b", boardService.selectOneBoard(BId)).
		addAttribute("clist", clist);
		
		System.out.println(BId);
		System.out.println(boardService.selectOneBoard(BId));		
		System.out.println(model);		
		boardService.updateOneCount(BId);		
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
	public ModelAndView adBoard() {
		ModelAndView mv = new ModelAndView();
		List<Board> list = null;
		List<String> thumbnail = null;
		List<Integer> comment = null;
		
		try {
			// 기업 게시판 게시물 가져오기
			list = new ArrayList<Board>();
			thumbnail = new ArrayList<String>();
			comment = new ArrayList<Integer>();
			
			list = boardService.selectBoardList(5);
			int viewNum = (list.size()<6)?list.size():6;
			for(int i=0; i<viewNum; i++) {
				thumbnail.add(boardService.selectThumbnailImg(list.get(i).getBId()));
				comment.add(boardService.selectCommentCnt(list.get(i).getBId()));
			}
			
			mv.addObject("blist", list);
			mv.addObject("thumb", thumbnail);
			mv.addObject("comment", comment);
			mv.setViewName("board/ad/adBoardList");
		} catch(Exception e) {
			mv.addObject("msg", "게시물 불러오기를 실패하였습니다.");
			mv.addObject("loc", "/");
			mv.setViewName("common/msg");
			e.getStackTrace();
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
		Member m = (Member)session.getAttribute("member");
		
		System.out.println("광고 게시글");
		System.out.println(m);
		System.out.println(b);
		
		List<String> imgList = new ArrayList<String>();
		String str = "upload/";
		int start = 0;
		while(true) {
			// 글 내용에서 이미지 이름 파싱
			int begin = b.getBContent().indexOf(str, start) + str.length();
			int end = b.getBContent().indexOf(34, begin);
			if(start>end) break;
			imgList.add(b.getBContent().substring(begin, end));
			start = end;
		}
		
		if(imgList.size()>0) b.setHasFile("Y");
		else b.setHasFile("N");
		
		// 게시글 등록
		try {
			boardService.insertImgBoard(b);
			System.out.println("이미지 게시글 등록!");
			// 이미지 파일이 존재하면 등록
			if(imgList.size()>0) {
				for(int i=0; i<imgList.size(); i++) {
					Fileref fref = new Fileref();
					fref.setbId(b.getBId());
					fref.setfType("I");
					fref.setOrigin_Name(imgList.get(i));
					fref.setChange_Name(imgList.get(i));
					boardService.insertImgFile(fref);
				}
			}
			mv.addObject("msg", "게시물 등록을 성공하였습니다!");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "게시물 등록에 실패하였습니다.");
		}
		
		mv.addObject("loc", "/board/adBoard.go");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	// 이미지 업로드
	@RequestMapping(value = "/board/imageUpload.do", method = {RequestMethod.POST})
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
			long maxSize = 5 * 1024 * 1024; // 5mb
			if(fileSize>maxSize) {
				// 파일 크기 제한
				fileInfo.put("result", -2);
				return fileInfo;
			}
			
			// 저장경로
      String defaultPath = session.getServletContext().getRealPath("/resources/img/upload/");
			
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
			
      String imgUrl = session.getServletContext().getContextPath() + "/resources/img/upload/" + rename;
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
