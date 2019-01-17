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

import com.kh.mhm.map.model.vo.MyMap;
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
	public static String CreateFile(@RequestParam String tUserId,@RequestParam String [] tLat, @RequestParam String [] tLng,
			@RequestParam String [] tInText, @RequestParam String [] tInSubject)
	
	{
		String alphago = "Succes hoji";
		System.out.println("전송이왔다 마리다");
		System.out.println("내이름은 : "+tUserId + " tLat : "+tLat[0] + "  tLng : "+ tLng[0] + " tInText : " + tInText[0] + " tInSubject : " + tInSubject[0]);
		System.out.println("tLat : "+tLat + "  tLng : "+ tLng + " tInText : " + tInText + " tInSubject : " + tInSubject);
		// 저장을 list outp fie read r List 단위로 불러와서 
		
		try{
	            //파일 객체 생성
				File folderCreate = new File("C:\\test\\");
				if(folderCreate.exists() == false) folderCreate.mkdirs();
	            File file = new File("C:\\test\\"+tUserId+".txt");
	            BufferedWriter bw = new BufferedWriter(new FileWriter(file));
	            // ObjectFilestream 사용하기
	            if(file.isFile() && file.canWrite()){
	                //쓰기
	            	
	            	for(int i =0; i< tLat.length;i++)
	            	{
	            	bw.write(tLat[i]+",");
	            	bw.write(tLng[i]+",");	            	
	            	bw.write(tInText[i]+",");	            	
	            	bw.write(tInSubject[i]+",");	            	
	            	//bw.newLine();
	            	}
	            	
	                bw.flush();
	                bw.close();
	            }
	        }catch (IOException e) {
	            System.out.println(e);
	        }
		System.out.println("알파고봐보자"+alphago);
		
		return alphago;
	}
	@RequestMapping(value = "/map/hoji2.do")
	@ResponseBody
	public static String[] readFile(@RequestParam String tUserId)
	
	{
		System.out.println("gggggggggggggggggggggggg");
		MyMap map1 = new MyMap();
		String part1 ;
		String part2;
		String[] parts= {};
		try {
			// 파일 객체 생성
			File file = new File("C:\\test\\"+tUserId+".txt");
			// 입력 스트림 생성
			FileReader filereader = new FileReader(file);
			// 입력 버퍼 생성
			BufferedReader br = new BufferedReader(filereader);
			String line = "";
				line = br.readLine();
			System.out.println();
			System.out.println(line);
			// .readLine()은 끝에 개행문자를 읽지 않는다.
			   if (line.contains(",")) {
		              
	               parts = line.split(",");
	                 part1 = parts[0]; // 004
	                 part2 = parts[1]; // 034556
	                 
	                 if(line.contains(".!."))
	                 {
	                	 
	                 }
	                	 
			   } else {
	                throw new IllegalArgumentException("String " + line + " does not contain -");
	            }

			   
			   for(int i =0; i< parts.length ;i++)
			   {
				   System.out.println(parts[i]);
				  
			   }
			   
			   
			   
			   System.out.println(part1 + "    "+ part2);
			br.close();

		} catch (FileNotFoundException e) {
			// TODO: handle exception
		} catch (IOException e) {
			System.out.println(e);
		}

		return parts;

	}
	
}
