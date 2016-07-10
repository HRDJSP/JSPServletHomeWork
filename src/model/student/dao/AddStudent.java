package model.student.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.student.dto.StudentDTO;

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/addstudent")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentDTO student = new StudentDTO(Integer.valueOf(request.getParameter("id")),request.getParameter("name"));
		StudentDAO dao = new StudentDAO();
		/*System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("name"));
*/		try {
			if(dao.addStudents(student)){
				response.getWriter().write("Success");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			response.getWriter().write("Fail");
		}
		
	}

}
