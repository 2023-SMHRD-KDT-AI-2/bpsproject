package com.moon.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.moon.model.Depart;
import com.moon.model.departDAO;


@WebServlet("/departinsert")
public class departInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String url = "goDepart";

		String depart = request.getParameter("depart");
		String dep_name = request.getParameter("dep_name");
		String tel = request.getParameter("tel");
		String ex = request.getParameter("ex");
		String email = request.getParameter("email");

		if (depart.equals("") && ex.equals("") && dep_name.equals("") && tel.equals("")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('입력할 내용이 없습니다.'); window.history.back();</script>");
			writer.close();
		} else if (ex.equals("")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('설명을 입력하세요.'); window.history.back();</script>");
			writer.close();
		} else if (depart.equals("")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('부서를 입력하세요.'); window.history.back();</script>");
			writer.close();
		} else if (dep_name.equals("")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('담당자를 입력하세요.'); window.history.back();</script>");
			writer.close();
		} else if (tel.equals("")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('부서 연락처를 입력하세요.'); window.history.back();</script>");
			writer.close();
		} else {

			departDAO dao = new departDAO();
			Depart de = new Depart();
			de.setEmail(email);
			de.setEx(ex);
			de.setDepart(depart);
			de.setDepart_call(tel);
			de.setDepart_name(dep_name);

			Depart dep = new Depart();
			dep.setEmail(email);
			dep.setDepart(depart);

			dep = dao.departCheck(dep);

			if (dep != null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('이미 존재하는 부서입니다.'); location.href='" + url + "';</script>");
				writer.close();
			} else {
				dao.departInsert(de);

				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
			}

		}

	}
}
