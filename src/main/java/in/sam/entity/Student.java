package in.sam.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Student {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int sid;
	String name;
	String email;
	String gender;
	String course;
	String timing;
	
	public Student() {
		
		System.out.println("Enter in Student constructor .......");
	}
	
	public int getSid() {
	    return sid;
	}

	public void setSid(int sid) {
	    this.sid = sid;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getTiming() {
		return timing;
	}
	public void setTiming(String timing) {
		this.timing = timing;
	}
	
	
	
	
	@Override
	public String toString() {
		return "Student [sid=" + sid + ", name=" + name + ", email=" + email + ", gender=" + gender + ", course="
				+ course + ", timing=" + timing + "]";
	}
	
	
	

}
