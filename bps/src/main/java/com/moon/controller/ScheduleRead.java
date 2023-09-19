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
@WebServlet("/api/schedule/read") //🤣 정답
public class ScheduleRead extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String searchDate = request.getParameter("searchdate");
		System.out.println(searchDate);
		
		if(searchDate == null) {
			searchDate = "2023-7-10";
		}
		
		ArrayList<String> jsonResponseStringList = new ArrayList<>();
		ArrayList<String> scheduleStringList = new ArrayList<>();
		
		
		scheduleDAO dao = new scheduleDAO();
		List<schedule> result = dao.scheduleSelectByDate(searchDate);
		
		scheduleStringList.add("[");
		for(schedule item : result) {
//			scheduleStringList.add("{");
//			scheduleStringList.add(keyValueToString("id", String.valueOf(item.getId()), false));
//			scheduleStringList.add(keyValueToString("department", item.getDepartment(), false));
//			scheduleStringList.add(keyValueToString("name", item.getName(), false));
//			scheduleStringList.add(keyValueToString("empit", item.getEmployee_id(), false));
//			scheduleStringList.add(keyValueToString("title", item.getTitle(), false));
//			scheduleStringList.add(keyValueToString("detail", item.getDetail(), true));
//			scheduleStringList.add("}");
			//아까 항목 끝에마다 쉼표가 붙어야 한다 했으니?
			//ㄱ ㄱ 직접해봐
		}
		for(int i = 0; i < result.size(); i++) {
			scheduleStringList.add("{");
			scheduleStringList.add(keyValueToString("id", String.valueOf(result.get(i).getId()), false));
			scheduleStringList.add(keyValueToString("department", result.get(i).getDepartment(), false));
			scheduleStringList.add(keyValueToString("name", result.get(i).getName(), false));
			scheduleStringList.add(keyValueToString("empit", result.get(i).getEmployee_id(), false));
			scheduleStringList.add(keyValueToString("title", result.get(i).getTitle(), false));
			scheduleStringList.add(keyValueToString("detail", result.get(i).getDetail(), true));
			if(i == result.size()-1) {
				scheduleStringList.add("}");
				
			}else{
				scheduleStringList.add("},");
				
			};
		}
		scheduleStringList.add("]");
		
		jsonResponseStringList.add("{");
//		jsonResponseStringList.add(keyValueToString("result", String.join("", scheduleStringList), true));
		jsonResponseStringList.add("\"result\":");
		jsonResponseStringList.add(String.join("", scheduleStringList));
		jsonResponseStringList.add("}");
		
		String jsonResponse = String.join("", jsonResponseStringList);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		if(result.isEmpty()) {
			response.getWriter().write("{\"result\":[]}");
		} else { 
			response.getWriter().write(jsonResponse);
		}
	}
	
	
	
	private String keyValueToString(String key, String value, boolean end) {
		String endString = "";
		if (!end) endString = ",";
		return String.format("\"%s\":\"%s\"%s", key, value, endString);
	}
	
	

}
