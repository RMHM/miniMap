package com.kh.mhm.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class JejuApi {

	public List<Map<String, Object>> restAPi(String urlStr, Map<String, Object> param, String resultType, String strCompile){
		List<Map<String, Object>> result = null;
		HttpURLConnection con = null;
		StringBuilder strUrl = null;
		URL url = null;
		BufferedReader br = null;
		
		try {
			strUrl = new StringBuilder(urlStr);
			// 필요한 매개변수를 map으로 받고 map이 가지고 있는 키 값을 배열로 만든다
			Object[] keyList = param.keySet().toArray();
			for(int i = 0 ; i < keyList.length; i++) {
				strUrl.append(((i==0)?"?":"&") + URLEncoder.encode((String)keyList[i], "UTF-8") + "=" + param.get(keyList[i]));
			}
			
			// 쿼리스트링 작업이 끝난 문자열을 url로 변경
			url = new URL(strUrl.toString());
			
			// 위 url로 http 통신 연결
			con = (HttpURLConnection)url.openConnection();
			if(resultType.toLowerCase().equals("xml")) {
				con.setRequestProperty("Content-type", "application/xml");
			} else if(resultType.toLowerCase().equals("json")) {
				con.setRequestProperty("Content-type", "application/json");
			}
			
			con.setRequestMethod("GET");

			con.connect();

			// 요청코드에 따른 스트림 생성
			if (con.getResponseCode() >= 200 && con.getResponseCode() <= 300) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			// stringbuilder에 결과 넣기
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			// 사용이 끝난 bufferedReader 끝내기
			br.close();
			//
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			factory.setNamespaceAware(true);
			DocumentBuilder builder;
			Document doc = null;
			
			//
			String strResult = sb.toString();
			InputSource is = new InputSource(new StringReader(strResult));
			builder = factory.newDocumentBuilder();
			doc = builder.parse(is);
			XPathFactory xpathFactory = XPathFactory.newInstance();
			XPath xpath = xpathFactory.newXPath();
			XPathExpression expr = xpath.compile(strCompile);
			NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
			//
			result = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			
			for (int i = 0; i < nodeList.getLength(); i++) {
				NodeList child = nodeList.item(i).getChildNodes();
				map = new HashMap<String, Object>();
				for (int j = 0; j < child.getLength(); j++) {
					Node node = child.item(j);
					map.put(node.getNodeName(), node.getTextContent());
				}
				
				result.add(map);
			}
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}


		return result;
	}


}