package ice.fire.smart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import customer.CustomerServiceImpl;

@Controller
public class CustomerController {
//	@Autowired 
	private CustomerServiceImpl service;
	public CustomerController(CustomerServiceImpl service) {
		this.service = service;
	}
	
	//고객목록화면 요청
	@RequestMapping("/list.cu")
	public String list(HttpSession session) {
		session.setAttribute("category", "cu");
		//DB에서 고객목록 조회 
		
		
		return "customer/list";
	}
	
}
