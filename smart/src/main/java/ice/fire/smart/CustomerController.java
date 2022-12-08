package ice.fire.smart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import customer.CustomerService;
import customer.CustomerVO;

@Controller
public class CustomerController {
//	@Autowired private CustomerServiceImpl service;
	private CustomerService service;
	public CustomerController(CustomerService customer) {
		this.service = customer;
	}
	
	// Command 패턴 -> Service
	
	//신규고객 저장처리 요청
	@RequestMapping("/insert.cu")
	public String insert(CustomerVO vo) {
		service.customer_insert(vo);
		
		return "redirect:list.cu";
	}
	
	//신규고객 입력화면 요청
	@RequestMapping("/new.cu")
	public String newCustomer() {
		return "customer/new";
	}
	
	//선태한 고객정보 삭제
	@RequestMapping("/delete.cu")
	public String delete(int id) {
		service.customer_delete(id);
		return "redirect:list.cu";
	}
	
	//고객정보 수정처리 요청
	@RequestMapping("/update.cu")
	public String update(CustomerVO vo) {
		service.customer_update(vo);
		return "redirect:info.cu?id=" + vo.getId();
	}
	
	//고객정보 수정화면 요청
	@RequestMapping("/modify.cu")
	public String modify(int id, Model model) {
		CustomerVO vo = service.customer_info(id);
		
		model.addAttribute("vo", vo);
		
		return "customer/modify";
	}
	
	//선택한 고객정보화면 요청
	@RequestMapping("/info.cu")
	public String info(int id, Model model) {
		CustomerVO vo = service.customer_info(id);
		
		model.addAttribute("vo", vo);
		
		return "customer/info";
	}
	
	//고객목록화면 요청
	@RequestMapping("/list.cu")
	public String list(HttpSession session, Model model) {
		session.setAttribute("category", "cu");
		//DB에서 고객목록 조회 
		List<CustomerVO> list = service.customer_list();
		//model에 담기
		model.addAttribute("list", list);
		//응답화면연결
		return "customer/list";
	}
	
}
