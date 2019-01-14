package com.kh.mhm.map.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mhm.member.model.vo.Member;

@Controller
public class MapController {


	
//
//	@RequestMapping(value = "/map/hoji.do")
//	@ResponseBody
////	public void passCheck(@RequestParam String mpw, @RequestParam String mid) {
//		public void passCheck(@RequestParam String tLat, @RequestParam String tLng,
//				@RequestParam String tInText, @RequestParam String tInSubject ) {
////		System.out.println("mpw : "+mpw + "  mid : "+ mid + " abc : " );
//		System.out.println("tLat : "+tLat + "  tLng : "+ tLng + " tInText : " + tInText + " tInSubject : " + tInSubject);
//	}


	@RequestMapping(value = "/map/hoji.do")
	@ResponseBody
	public static String CreateFile(@RequestParam String [] tLat, @RequestParam String [] tLng,
			@RequestParam String [] tInText, @RequestParam String [] tInSubject)
	
	{
		String alphago = "Succes hoji";
		System.out.println("전송이왔다 마리다");
	//	System.out.println("tLat : "+tLat[0] + "  tLng : "+ tLng[0] + " tInText : " + tInText[0] + " tInSubject : " + tInSubject[0]);
	//	System.out.println("tLat : "+tLat + "  tLng : "+ tLng + " tInText : " + tInText + " tInSubject : " + tInSubject);
		// 저장을 list outp fie read r List 단위로 불러와서 
		
		try{
	            //파일 객체 생성
	            File file = new File("C:\\test\\"+2+".txt");
	            BufferedWriter bw = new BufferedWriter(new FileWriter(file));
	            // ObjectFilestream 사용하기
	            if(file.isFile() && file.canWrite()){
	                //쓰기
	                bw.write(tLat[0]);
	                //개행문자쓰기
	              //  bw.write(tLat+tLng+tInText+tInSubject);
	                bw.newLine();
	                bw.write("문자열 추가2");
	                
	                bw.flush();
	                bw.close();
	            }
	        }catch (IOException e) {
	            System.out.println(e);
	        }
		System.out.println("알파고봐보자"+alphago);
		
		return alphago;
	}
	
	static void readFile()
	{
		try{
            //파일 객체 생성
			File file = new File("C:\\test\\a.txt");
            //입력 스트림 생성
            FileReader filereader = new FileReader(file);
            //입력 버퍼 생성
            BufferedReader br = new BufferedReader(filereader);
            String line = "";
            while((line = br.readLine()) != null){
                System.out.println(line);
            }
            
            //.readLine()은 끝에 개행문자를 읽지 않는다.    
            br.close();
            
        }catch (FileNotFoundException e) {
            // TODO: handle exception
        }catch(IOException e){
            System.out.println(e);
        }


	}
	
}
