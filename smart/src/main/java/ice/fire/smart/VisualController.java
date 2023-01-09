package ice.fire.smart;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import visual.VisualServiceImpl;

@Controller
public class VisualController {
	@Autowired private VisualServiceImpl service;
	
	//상위 3개 부터의 년도별 채용인원수 조회
	@ResponseBody @RequestMapping("/visual/hirement/top3/year")
	public Object hirement_top3_year(@RequestBody HashMap<String, Object> map) {
		return service.hirement_top3_year(map);
	}
	
	//상위 3개 부터의 월별 채용인원수 조회
	@ResponseBody @RequestMapping("/visual/hirement/top3/month")
	public Object hirement_top3_month() {
		return service.hirement_top3_month();
	}
	
	//연도별 채용인원수 조회
	@ResponseBody @RequestMapping("/visual/hirement/year")
	public Object hirement_year(@RequestBody HashMap<String, Object> map) {
		return service.hirement_year(map);
	}
	
	//월별 채용인원수 조회
	@ResponseBody @RequestMapping("/visual/hirement/month")
	public Object hirement_month() {
		return service.hirement_month();
	}
	
	
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
