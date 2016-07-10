package model.student.dao;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class DeleteStudent
 */
@WebServlet("/deletestudent")
public class DeleteStudent extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
		 StudentDAO studentdao = new StudentDAO();
		 try {
			 if(studentdao.deleteStudent(id)){
				 response.getWriter().write("Delete Successful");
			 }
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			 response.getWriter().write("Delete fail");
		}
	}

}
