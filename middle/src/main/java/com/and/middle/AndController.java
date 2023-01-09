package com.and.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController		// 안되면 spring-framework 버전 확인 (낮으면 안됨)
public class AndController {
	@Autowired @Qualifier("bteam") SqlSession sql;
	
	
	
	// 안드로이드 연동 테스트
	@RequestMapping(value="/list.bo", produces = "text/html;charset=utf-8")
	public String and() {
		
		return new Gson().toJson(sql.selectList("and.board_list"));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/andVO", produces = "text/html;charset=utf-8")
	public String andVo() {
		System.out.println("ddd");
//		List<CustomerVO> list = sql.selectList("and.list");
		
		
		return "lastTest";
	}
	
}
