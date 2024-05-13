package com.kh.goty.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.kh.goty.member.model.vo.NaverMember;

@Service
@PropertySource("classpath:key.properties")
public class NaverService {
	
	@Autowired
	private Environment env;
	
	public String getToken(String code, String state) throws IOException, ParseException {
		String tokenUrl = "https://nid.naver.com/oauth2.0/token";
		
		URL url = new URL(tokenUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("POST");

		// post 요청 보낼때 해주는 설정
		urlConnection.setDoOutput(true);
		
		BufferedWriter bw = 
				new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		
		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id="+ env.getProperty("naver_client_id"));
		sb.append("&client_secret="+ env.getProperty("naver_client_secret"));
		sb.append("&code="+ code);
		sb.append("&state="+ state);
		
		bw.write(sb.toString());
		bw.flush();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String line = "";
		String responseData = "";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		
		// System.out.println(responseData);
		
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseData);
		
		String accessToken = element.get("access_token").toString();
		
		
		return accessToken;
	}
	
	public NaverMember getUserInfo(String accessToken) throws IOException, ParseException {
		String userInfoUrl = "https://openapi.naver.com/v1/nid/me";
		
		URL url = new URL(userInfoUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		// System.out.println(urlConnection.getResponseCode());
		
		BufferedReader br
			= new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseData = br.readLine();
		
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
		
		NaverMember nm = new NaverMember();
		
		String response = responseObj.get("response").toString();
		// System.out.println(response);
		JSONObject res = (JSONObject)new JSONParser().parse(response);
		
		
		nm.setBirthyear(res.get("birthyear").toString());
		nm.setId(res.get("id").toString());
		nm.setMobile(res.get("mobile").toString());
		nm.setName(res.get("name").toString());
		nm.setNickname(res.get("nickname").toString());
		
		
		return nm;
	}
	
	
	
	
}
