package in.sam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sam.entity.Student;
import in.sam.repo.StdRepo;

@Service
public class StdServiceIMPL implements StdService{
	
	
	@Autowired
	StdRepo repo;

	@Override
	public void stdsave(Student std) 
	{
		Student save=repo.save(std);
		System.out.println("Save data from repo ...................");
	
	}

	@Override
	public List<Student> stdFindAll() {
		List<Student> all = repo.findAll();
		return all;
	}

	@Override
	public Student stdFindID(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void stdDelete(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Student stdupdate(Student std) {
		// TODO Auto-generated method stub
		return null;
	}

}
