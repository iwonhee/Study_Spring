package com.and.middle;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController		// 안되면 spring-framework 버전 확인 (낮으면 안됨)
public class AndController {
	
	// @RestController 안에서는 생략가능!
	@RequestMapping("/and")
	public String and() {
		return "testㄷㄴㅅ";
	}
	
}
