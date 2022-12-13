package com.and.middle;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class HomeController {
	
	// json
	// [] : Arr 값 여러개(List, Arr)
	// {} : Obj 값(객체)
	
	//REST API : 요청한 방식에 따라 dataType을 return해줌
	
	@RequestMapping("/andTest")
	@ResponseBody
	public String andTest(String id, String pw) {
		System.out.println(id);
		return "kwh";
	}
	
	@ResponseBody
	@RequestMapping("/jsontest")
	public String jsonTest() {
		
		ArrayList<TempDTO> list = new ArrayList<>();
		list.add(new TempDTO("sdds"));
		list.add(new TempDTO("4sv5g4sb"));
		list.add(new TempDTO("sdhsghw"));
		list.add(new TempDTO("g13"));
		
		HashMap<String, TempDTO> map = new HashMap<>(); // Key값으로 한번 더 감싼다..
		map.put("data1", new TempDTO("slkeflskaefj"));
		map.put("data2", new TempDTO("31g32wgewe"));
		map.put("data3", new TempDTO("b6dby6d57idjbb7b"));
		
		Gson gson = new Gson();
		
		return gson.toJson(map);
	}
	
	public class TempDTO{
		String data;
		public TempDTO(String data) {
			this.data = data;
		}
	}
	public class LoginDTO {
		String id, pw;
		public LoginDTO(String id, String pw) {
			this.id = id;
			this.pw = pw;
		}
	}
	
	
	@ResponseBody	// 응답 직접할때. 페이지 이동 x
	@RequestMapping("/login")
	public String login(HttpServletResponse res, HttpServletRequest req) {
		if(req.getParameter("id").equals("admin") && req.getParameter("pw").equals("admin1234")) {
			return "success";
		}
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping("/login2")
	public String login2(String id, String pw) {
		if(id.equals("admin") && pw.equals("admin1234")) return "successsssss";
		return "faillllll";
	}
	
//	@ResponseBody	// <= print("") 를 간결화. return을 바로 작성
	@RequestMapping(value = "/")
	public String home() {
		// Android => Spring => Oracle
		// controller에서 바로 응답!
		
		return "home";	// views/home.jsp로 forward 응답. 규칙?  
	}
	
}

