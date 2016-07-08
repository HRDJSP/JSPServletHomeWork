package model.student.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import configuration.ConnectionManager;
import controller.student.dto.StudentDTO;

public class StudentDAO {
	
	
	public void getAllStudents() throws ClassNotFoundException, SQLException
	{
		Connection cnn =ConnectionManager.getConnection();
		ArrayList<StudentDTO> students = new ArrayList<StudentDTO>();
		Statement stmt = cnn.createStatement();
		ResultSet  rs = stmt.executeQuery("SELECT * FROM tbstudent");
		while(rs.next())
		{
			Integer stuid = rs.getInt("stu_id");
			String stuname = rs.getString("stu_name");
			System.out.println(stuid +" "+ stuname);
			
		}

	}
	
//	public static void main(String[] args) throws ClassNotFoundException, SQLException {
//		StudentDAO  bd= new StudentDAO();
//		bd.getAllStudents();
//		
//	}
}
