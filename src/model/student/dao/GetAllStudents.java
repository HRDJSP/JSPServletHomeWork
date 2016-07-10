package model.student.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.google.gson.Gson;

import configuration.ConnectionManager;
import controller.student.dto.StudentDTO;

/**
 * Servlet implementation class GetAllStudents
 */
@WebServlet("/getallstudents")
public class GetAllStudents extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		{
			//get data
			ArrayList<StudentDTO> student = new StudentDAO().getAllStudents();
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			//String json = new Gson().toJson(student);
			//response.getWriter().write(json);
			JSONArray  json = new JSONArray(student);
			response.getWriter().write(json.toString());

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
