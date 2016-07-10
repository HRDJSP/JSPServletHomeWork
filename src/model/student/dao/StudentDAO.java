package model.student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import configuration.ConnectionManager;
import controller.student.dto.StudentDTO;

public class StudentDAO {
	
	
	public ArrayList<StudentDTO> getAllStudents() throws ClassNotFoundException, SQLException
	{
		Connection cnn =ConnectionManager.getConnection();
		ArrayList<StudentDTO> students = new ArrayList<StudentDTO>();
		Statement stmt = cnn.createStatement();
		ResultSet  rs = stmt.executeQuery("SELECT * FROM tbstudent");
		while(rs.next())
		{
			students.add(new StudentDTO(rs.getInt("stu_id"),rs.getString("stu_name")));
			
		}
		return students;

	}
	
	//insert data
	public boolean addStudents(StudentDTO student) throws ClassNotFoundException, SQLException{
		Connection cnn =ConnectionManager.getConnection();
		cnn.setAutoCommit(false);
		PreparedStatement pstmt =cnn.prepareStatement("INSERT INTO tbstudent VALUES(?,?)");
		pstmt.setInt(1, student.getId());
		pstmt.setString(2, student.getName());
		cnn.commit();
		if(pstmt.executeUpdate()>0)
			return true;
		
		return false;		
	}
	
	//update data
	public boolean updateStudent(StudentDTO student) throws ClassNotFoundException, SQLException{
		Connection cnn =ConnectionManager.getConnection();
		PreparedStatement pstmt =cnn.prepareStatement("UPDATE tbstudent SET stu_id=? , stu_name=?");
		pstmt.setInt(1, student.getId());
		pstmt.setString(2, student.getName());
		if(pstmt.executeUpdate()>0)
			return true;
		
		return false;
	}
	
	public void DeleteStudent() throws ClassNotFoundException, SQLException{
		Connection  cnn =ConnectionManager.getConnection();
		
		
	}
	
//	public static void main(String[] args) throws ClassNotFoundException, SQLException {
//		StudentDAO  bd= new StudentDAO();
//		bd.getAllStudents();
//		
//	}
}
