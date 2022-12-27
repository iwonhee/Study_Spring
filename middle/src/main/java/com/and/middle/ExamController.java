package com.and.middle;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import customer.CustomerVO;
import test.TestVO;

@RestController
public class ExamController {
	
	
	
	@RequestMapping(value="/test1", produces="text/html; charset=utf-8")
	public String test1() {
		return "test1 테스트스트";
	}

	@RequestMapping(value="/test2", produces="text/html; charset=utf-8")
	public String test2(String id, String pw, String admin) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		map.put("admin", admin);
		
		return new Gson().toJson(map);
	}
	
	@RequestMapping(value="/test3", produces="text/html; charset=utf-8")
	public String test3(String name) {
		String msg = "나 "+name+" 아니다";
		return msg;
	}
	
	@RequestMapping(value="/test4", produces="text/html; charset=utf-8")
	public String test4() {
		
		TestVO vo =new TestVO();
		vo.setiVal(1);
		vo.setsVal("str");
		vo.setdVal(2.2);
		
		return new Gson().toJson(vo);
	}
	
	@RequestMapping(value="/test5", produces="text/html; charset=utf-8")
	public String test5(String no) {
		ArrayList<TestVO> list;
		try {
			int cnt = Integer.parseInt(no);
			list = new ArrayList<>();
			for(int i = 0; i < cnt; i++) {			
				list.add(new TestVO(i, "s : "+i, i+0.1));
			}
			return new Gson().toJson(list);
		}catch(Exception e) {
			return "오류 : 숫자만 입력!";
		}
	}
}
