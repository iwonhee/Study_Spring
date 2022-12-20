package com.and.middle;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import customer.CustomerVO;

@RestController		// 안되면 spring-framework 버전 확인 (낮으면 안됨)
public class AndController {
	
	@Autowired @Qualifier("hanul") SqlSession sql;
	
	// @RestController 안에서는 생략가능!
	@RequestMapping(value="/and", produces = "text/html;charset=utf-8")
	public String and() {
		
		List<CustomerVO> list = sql.selectList("and.list");
		
		for(int i = 0; i < list.size(); i++) {
			System.out.print(list.get(i).getName() + " / " + list.get(i).getGender() +"\n");
		}
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="/andVO", produces = "text/html;charset=utf-8")
	public String andVo() {
		System.out.println("ddd");
//		List<CustomerVO> list = sql.selectList("and.list");
		
		
		return "lastTest";
	}
	
}
