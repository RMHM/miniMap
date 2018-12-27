package com.kh.mhm.api;

import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
 
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;


import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;

public class AfterWeather {
	public String[]  weather() throws IOException {

		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		StringBuilder urlBuilder = new StringBuilder(
				"http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleLandWeather"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=nN1bRtr%2Fr5cTWpesutzNxHS2tl8tryY636RSjChHh7WHqODcspkEgjIEQi9OrEiYDjMeEhCo4qh6AyVhAptYGw%3D%3D"); /*
																														 * Service
																														 * Key
																											 */
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "="
				+ URLEncoder.encode(
						"nN1bRtr%2Fr5cTWpesutzNxHS2tl8tryY636RSjChHh7WHqODcspkEgjIEQi9OrEiYDjMeEhCo4qh6AyVhAptYGw%3D%3D",
						"UTF-8")); /* 서비스 키 */
		urlBuilder.append("&" + URLEncoder.encode("regId", "UTF-8") + "=" + URLEncoder.encode("11G00000",
				"UTF-8")); /* 예보구역코드 *활용가이드 참조 */
		urlBuilder.append("&" + URLEncoder.encode("tmFc", "UTF-8") + "=" + URLEncoder.encode(sdf.format(today) + "0600",
				"UTF-8")); /* 2017년 7월 20일 06시 발표 * 활용가이드 참조 */

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
/*		System.out.println(sb.toString());
		System.out.println(sb.length());

	*/
		
		
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        DocumentBuilder builder;
        Document doc = null;
        String afterWeather[] = new String[14];
        try {
            // xml 파싱하기
            String result = sb.toString();
            InputSource is = new InputSource(new StringReader(result));
            builder = factory.newDocumentBuilder();
            doc = builder.parse(is);
            XPathFactory xpathFactory = XPathFactory.newInstance();
            XPath xpath = xpathFactory.newXPath();
            XPathExpression expr = xpath.compile("//items/item");
            NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
            
           
            for (int i = 0; i < nodeList.getLength(); i++) {
                NodeList child = nodeList.item(i).getChildNodes();
            
                for (int j = 0; j < child.getLength(); j++) {
                	Node node = child.item(j);
                	afterWeather[j]=node.getTextContent();
                	
                  /*  System.out.println("현재 노드 이름 : " + node.getNodeName());
                    System.out.println("현재 노드 이름 : " + node.getLocalName());
                    System.out.println("현재 노드 타입 : " + node.getNodeType());
                    System.out.println("현재 노드 값 : " + node.getTextContent());
                    System.out.println("현재 노드 네임스페이스 : " + node.getPrefix());
                    System.out.println("현재 노드의 다음 노드 : " + node.getAttributes().item(0));
                    System.out.println("");*/
                	 /* System.out.println(afterWeather[j]);*/
                }
            }
            for(int i =0; i<afterWeather.length; i++){
            	System.out.println(afterWeather[i]);	
            }
            
          
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return afterWeather;
	}
}
