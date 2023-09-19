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
@WebServlet("/api/schedule/delete")
public class ScheduleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");

		scheduleDAO dao = new scheduleDAO();

		dao.scheduleDelete(id);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write("{}");
	}

}
