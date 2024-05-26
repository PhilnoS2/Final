package com.kh.goty.common.template;

import java.nio.charset.Charset;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import com.kh.goty.board.model.vo.ResponseData;

public class RdTemplates {
	
	public static ResponseData getRd(Object data, String rCode, String message) {

		ResponseData rd = null;
		
		rd = ResponseData.builder()
		  		   .data(data)
		  		   .responseCode(rCode)
		  		   .message(message)
		  		   .build();
		return rd;
	}
	
	
	public static HttpHeaders getHeader() {
		
		  HttpHeaders headers = new HttpHeaders();
		  headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		  
		  return headers;
	}
	
	
}
