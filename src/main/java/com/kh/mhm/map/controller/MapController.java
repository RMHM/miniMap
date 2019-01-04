package com.kh.mhm.map.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {


	

	 @RequestMapping(value = "/map/map.do", method = {RequestMethod.GET, RequestMethod.POST})    
	    public ModelAndView test(
	           HttpServletRequest request,
	           String[] main//배열 받기 traditional: true
	           ) {
	           
	           ModelAndView view = null;
			view.setViewName("jsonView");
	        try {
	 
	            System.out.println(main[0]+"===============");//aa
	            System.out.println(main[1]+"===============");//bb
	            System.out.println(main[2]+"===============");//errer
	            //throw new Exception();
	                        
	            view.addObject("result", "success");
	            
	        }catch(Exception ex){
	            ex.printStackTrace();
	        }        
	        
	        return view;
	    }


	
	
	public static void CreateFile()
	
	{
		 try{
	            //파일 객체 생성
	            File file = new File("C:\\test\\a.txt");
	            BufferedWriter bw = new BufferedWriter(new FileWriter(file));
	            
	            if(file.isFile() && file.canWrite()){
	                //쓰기
	                bw.write("문자열 추가1");
	                //개행문자쓰기
	                bw.newLine();
	                bw.write("문자열 추가2");
	                
	                bw.flush();
	                bw.close();
	            }
	        }catch (IOException e) {
	            System.out.println(e);
	        }


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
