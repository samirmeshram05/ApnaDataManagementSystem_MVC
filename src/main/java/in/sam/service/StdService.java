package in.sam.service;

import java.util.List;

import in.sam.entity.Student;

public interface StdService {

	public void stdsave(Student std);

	public List<Student> stdFindAll();

	public Student stdFindID(Integer id);

	public void stdDelete(Integer id);

	public Student stdupdate(Student std);
	
	List<Student> searchStudent(String keyword);
	
}