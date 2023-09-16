package com.moon.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.moon.model.UserInfoDAO;
import com.moon.model.compInfo;
import com.moon.model.login;
import com.moon.model.userInfo;

@WebServlet("/Login")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// 기능처리
		UserInfoDAO dao = new UserInfoDAO();

		login user = new login();

		user.setEmail(id);

	

		login userAll = dao.info_data(user);
		String url = "";
		
		if (userAll == null) {
			url = "goLogin";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('존재하지않는아이디입니다.'); location.href='" + url + "';</script>");
			writer.close();
		}

		if (!userAll.getPw().equals(pw)) {
			url = "goLogin";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('비밀번호가 틀렸습니다.'); location.href='" + url + "';</script>");
			writer.close();
		} else {

			String name = userAll.getName();
			String admin = userAll.getAdmin();
			String logo = userAll.getLogo();
			String compName = userAll.getComp_name();
			String iid = userAll.getId();

			request.setAttribute("name", name);
			request.setAttribute("admin", admin);
			request.setAttribute("logo", logo);
			request.setAttribute("compName", compName);
			request.setAttribute("id", iid);
			
			url = "WEB-INF/Main.jsp";

		}
		
		
		if(userAll.getSign_date() == null) {
			url = "goLogin";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('승인되지 않은 아이디 입니다.'); location.href='" + url + "';</script>");
			writer.close();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
