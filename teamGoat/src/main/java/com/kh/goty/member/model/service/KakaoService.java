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

import com.kh.goty.member.model.vo.KakaoMember;

@Service
@PropertySource("classpath:key.properties")
public class KakaoService {

	@Autowired
	private Environment env;
	
	public String getToken(String code) throws IOException, ParseException {
		
		String tokenUrl = "https://kauth.kakao.com/oauth/token";
		
		URL url = new URL(tokenUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("POST");

		// post 요청 보낼때 해주는 설정
		urlConnection.setDoOutput(true);
		
		BufferedWriter bw = 
				new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		
		StringBuilder sb = new StringBuilder();
		sb.append("client_id="+ env.getProperty("kakao_client_id"));
		sb.append("&grant_type=authorization_code");
		sb.append("&redirect_uri=http://localhost:8083/goty/kakaologin");
		sb.append("&code="+code);
		
		bw.write(sb.toString());
		bw.flush();
		
		// System.out.println(urlConnection.getResponseCode()); 
		
		// inputstream / byte 
		// inputStreamReader / 문자
		// bufferedReader / 문자+buffer
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
		
		// System.out.println("accessToken : "+accessToken);
		
		bw.close();
		br.close();
		
		return accessToken;
	}
	
	public KakaoMember getUserInfo(String accessToken) throws IOException, ParseException {
		String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
		
		URL url = new URL(userInfoUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		// System.out.println(urlConnection.getResponseCode());
		
		BufferedReader br
			= new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseData = br.readLine();
		
		// System.out.println(responseData);
		
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
		
		KakaoMember sm = new KakaoMember();
		
		sm.setId(responseObj.get("id").toString());
		
		JSONObject propObj = (JSONObject)responseObj.get("properties");
		sm.setNickName(propObj.get("nickname").toString());
		sm.setThumbnailImage(propObj.get("thumbnail_image").toString());
		
		return sm;
	}


























	
}
