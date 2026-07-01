package in.sam.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.sam.entity.Student;

@Repository
public interface StdRepo extends JpaRepository<Student, Integer> {

}