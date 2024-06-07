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
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.kh.goty.member.model.dao.SocialMapper;
import com.kh.goty.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@PropertySource("classpath:key.properties")
@RequiredArgsConstructor
public class SocialMemberServiceImpl implements SocialMemberService {
	
	private final Environment env;
	private final SocialMapper socialMapper;
	
	@Override
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
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String line = "";
		String responseData = "";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseData);
		
		String accessToken = element.get("access_token").toString();
		
		bw.close();
		br.close();
		
		return accessToken;
	}

	@Override
	public Member getUserInfoKakao(String accessToken) throws IOException, ParseException {
		String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
		
		URL url = new URL(userInfoUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		BufferedReader br
			= new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseData = br.readLine();
		
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
		
		Member member = new Member();
		member.setMemberId(responseObj.get("id").toString());
		JSONObject propObj = (JSONObject)responseObj.get("properties");
		member.setNickname(propObj.get("nickname").toString());
		member.setThumbnailImage(propObj.get("thumbnail_image").toString());
		member.setStatus("KM");
		return member;
	}

	@Override
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
		
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseData);
		
		String accessToken = element.get("access_token").toString();

		return accessToken;
	}

	@Override
	public Member getUserInfoNaver(String accessToken) throws IOException, ParseException {
		String userInfoUrl = "https://openapi.naver.com/v1/nid/me";
		
		URL url = new URL(userInfoUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		BufferedReader br
			= new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseData = br.readLine();
		
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
		
		Member nm = new Member();
		
		String response = responseObj.get("response").toString();
		JSONObject res = (JSONObject)new JSONParser().parse(response);
		
		nm.setMemberId(res.get("id").toString());
		nm.setMemberName(res.get("name").toString());
		nm.setNickname(res.get("nickname").toString());
		String phone = res.get("mobile").toString().replaceAll("-", "");
		nm.setPhone(phone);
		nm.setBornDate(res.get("birthyear").toString());
		nm.setStatus("NM");
		return nm;
	}

	@Override
	public int checkKakaoId(String memberId) {
		return socialMapper.checkSocial(memberId);
	}

	@Override
	public Member loginKakao(String memberId) {
		return socialMapper.loginKakao(memberId);
	}
	
	@Override
	public int checkNaverId(String memberId) {
		return socialMapper.checkSocial(memberId);
	}

	@Override
	public Member loginNaver(String memberId) {
		return socialMapper.loginNaver(memberId);
	}

}
