package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.moon.model.UserInfoDAO;
import com.moon.model.userInfo;





@WebServlet("/infoDel")
public class infoDel extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("utf-8");
		
		String company = request.getParameter("company");
		String email = request.getParameter("email");
		
		UserInfoDAO dao = new UserInfoDAO();
		userInfo info = new userInfo();
		
		System.out.println(company);
		System.out.println(email);
		
		info.setComNum(company);
		info.setEmail(email);
		
	
		dao.app_del(info);
		
		String url = "WEB-INF/MemberManagement.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
