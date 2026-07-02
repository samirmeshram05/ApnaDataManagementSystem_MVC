package in.sam.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import in.sam.entity.Student;
import in.sam.repo.StdRepo;

@Service
public class StdServiceIMPL implements StdService {

	@Autowired
	StdRepo repo;

	@Override
	public void stdsave(Student std) {
		Student save = repo.save(std);
		System.out.println("Save data from repo ...................");

	}

	@Override
	public List<Student> stdFindAll() {
		List<Student> all = repo.findAll();
		return all;
	}

	@Override
	public Student stdFindID(Integer id) {
		Optional<Student> Id = repo.findById(id);
		Student s = null;
		if (Id.isPresent()) {
			s = Id.get();
		}else {
			System.out.println("Id Data not found....");
		}
		return s;
	}

	@Override
	public void stdDelete(Integer id) {
		repo.deleteById(id);
		System.out.println("delete record.....");

	}

	@Override
	public Student stdupdate(Student std) {
		Student save = repo.save(std);
		return save;
	}
	
	@Override
	public List<Student> searchStudent(String keyword) {

	    return repo.searchStudent(keyword);

	}
	
	@Override
	public Page<Student> getStudents(int page) {

	    PageRequest pageable = PageRequest.of(page, 5);

	    return repo.findAll(pageable);

	}

}
