package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.model.UserInfoDAO;
import com.moon.model.userInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/goAppInfoUp")
public class GoAppInfoUp extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String position = request.getParameter("position");
		String depart = request.getParameter("depart");
		String company = request.getParameter("company");
		
		System.out.println(email);
		System.out.println(position);
		System.out.println(depart);
		System.out.println(company);
		
		UserInfoDAO dao = new UserInfoDAO();
		userInfo info = new userInfo();
		info.setEmail(email);
		info.setPosition(position);
		info.setDepart(depart);
		info.setComNum(company);
		
		dao.app_info_Up(info);
		
		String url = "WEB-INF/MemberManagement.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		
	}

}
