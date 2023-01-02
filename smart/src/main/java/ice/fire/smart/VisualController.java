package ice.fire.smart;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import visual.VisualServiceImpl;

@Controller
public class VisualController {
	@Autowired private VisualServiceImpl service;
	
	//부서별 사원수 정보조회
	@ResponseBody @RequestMapping("/visual/department")
	public List<HashMap<String, Object>> department() {
		List<HashMap<String, Object>> list = service.department();
		return list;
	}
	
	//시각화 화면요청
	@RequestMapping("/list.vi")
	public String list(HttpSession session) {
		session.setAttribute("category", "vi");
		return "visual/list";
	}
	
}
