package com.moon.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.model.schedule;
import com.moon.model.scheduleDAO;

/**
 * Servlet implementation class ScheduleRead
 */
@WebServlet("/api/schedule/insert")
public class ScheduleInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String department = request.getParameter("department");
		String name = request.getParameter("name");
		String employeeId = request.getParameter("empid");
		String title = request.getParameter("title");
		String detail = request.getParameter("detail");
		String addDate = request.getParameter("adddate");

		schedule sc = new schedule();
		scheduleDAO dao = new scheduleDAO();

		sc.setDepartment(department);
		sc.setName(name);
		sc.setEmployee_id(employeeId);
		sc.setTitle(title);
		sc.setDetail(detail);
		sc.setAdd_date(addDate);
		dao.scheduleInsert(sc);
		
		ArrayList<String> jsonResponseStringList = new ArrayList<>();
		
		jsonResponseStringList.add("{");
		jsonResponseStringList.add(keyValueToString("department", department, false));
		jsonResponseStringList.add(keyValueToString("name", name, false));
		jsonResponseStringList.add(keyValueToString("empid", employeeId, false));
		jsonResponseStringList.add(keyValueToString("title", title, false));
		jsonResponseStringList.add(keyValueToString("detail", detail, true));
		jsonResponseStringList.add("}");
		
		String jsonResponse = String.join("", jsonResponseStringList);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(jsonResponse);
	}
	
	
	
	private String keyValueToString(String key, String value, boolean end) {
		String endString = "";
		if (!end) endString = ",";
		return String.format("\"%s\":\"%s\"%s", key, value, endString);
	}
	
	

}
