package hr;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class EmpVO {
	private int employee_id, department_id, salary;
	private String first_name, last_name, name, job_id, department_name
				, job_title, phone_number, email;
	private Date hire_date;
	
}
