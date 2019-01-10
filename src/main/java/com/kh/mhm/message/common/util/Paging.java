package com.kh.mhm.message.common.util;

import org.springframework.stereotype.Controller;

@Controller
public class Paging {
	
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 5;
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("totalPage : "+totalPage);
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul id='notePaging'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='prevtext' href='#' tabindex='-1'>";
			pageBar += "<img class='leftarrow' src='/resources/img/message/leftArrow.gif'>이전</a>";
			pageBar += "</li>";
			
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='prevtext' href='#' onclick='fn_paging("+(pageNo-1)+");'>";
			pageBar += "<img class='leftarrow' src='/resources/img/message/leftArrow.gif'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='currentpg'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='currentpg' href='#' onclick='fn_paging("+pageNo+");'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='nexttext' href='#'>";
			pageBar += "다음<img class='rightarrow' src='/resources/img/message/rightArrow.gif'></a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='nexttext' href='#' onclick='fn_paging("+(pageNo+1)+");'>";
			pageBar += "다음<img class='rightarrow' src='/resources/img/message/rightArrow.gif'></a>";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}

}
