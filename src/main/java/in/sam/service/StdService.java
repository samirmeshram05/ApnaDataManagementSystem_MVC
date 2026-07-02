package in.sam.service;

import java.util.List;

import org.springframework.data.domain.Page;

import in.sam.entity.Student;

public interface StdService {

	public void stdsave(Student std);

	public List<Student> stdFindAll();

	public Student stdFindID(Integer id);

	public void stdDelete(Integer id);

	public Student stdupdate(Student std);
	
	List<Student> searchStudent(String keyword);
		
	Page<Student> getStudents(int page, String sortField, String sortDir);

	
}