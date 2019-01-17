package com.kh.mhm.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class TempSplit {

	public static void main(String[] args) {
		String path = "C:\\Users\\Nope\\Desktop\\test\\upload\\";
		String fName = "l.txt";
		String saveName = "tmpQuery.txt";
		
		try {
			
			FileReader fr = new FileReader(new File(path+fName));
			BufferedReader br = new BufferedReader(fr);
			BufferedWriter bw = new BufferedWriter(new FileWriter(new File(path + saveName)));
			
			while(br.ready()) {
				String tmp = br.readLine();
				String imgFile = tmp.substring(tmp.lastIndexOf(32)+1);
				
				String q = "insert into fileref values(";
		        q += "seq_fid.nextval, ";
		        q += "(select bid from board where bcode=5 and instr(bcontent, " + (char)39 + imgFile + (char)39 + ")>0), ";
		        q += (char)39 + "I" + (char)39 +  ", ";
		        q += (char)39 +  imgFile + (char)39 +  ", ";
		        q += (char)39 +  imgFile + (char)39 +  ", ";
		        q += q + (char)39 +  "N" + (char)39 +  ");";
		        System.out.println(q);
		        
		        bw.write(q + "\n");
			}
			
			bw.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
