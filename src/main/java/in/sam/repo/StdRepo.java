package in.sam.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import in.sam.entity.Student;

@Repository
public interface StdRepo extends JpaRepository<Student, Integer> {

	@Query("""
			SELECT s
			FROM Student s
			WHERE LOWER(s.name) LIKE LOWER(CONCAT('%', :keyword, '%'))
			   OR LOWER(s.email) LIKE LOWER(CONCAT('%', :keyword, '%'))
			   OR LOWER(s.course) LIKE LOWER(CONCAT('%', :keyword, '%'))
			""")
	List<Student> searchStudent(@Param("keyword") String keyword);

	long countByGender(String gender);

	long countByCourse(String course);

	long countByTiming(String timing);
}