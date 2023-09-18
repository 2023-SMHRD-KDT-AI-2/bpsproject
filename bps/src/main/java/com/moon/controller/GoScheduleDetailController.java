package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.moon.model.schedule;
import com.moon.model.scheduleDAO;

@WebServlet("/goScheduleDetail")
public class GoScheduleDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("num");
		HttpSession session = request.getSession();
		scheduleDAO dao = new scheduleDAO();
		schedule result = dao.scheduleSelectById(id);
		
		request.setCharacterEncoding("UTF-8");
		
		String url = "WEB-INF/ScheduleDetail.jsp";
		
		session.setAttribute("department", result.getDepartment());
		session.setAttribute("name", result.getName());
		session.setAttribute("empid", result.getEmployee_id());
		session.setAttribute("title", result.getTitle());
		session.setAttribute("detail", result.getDetail());
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	
	}

}
