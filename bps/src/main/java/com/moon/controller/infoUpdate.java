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

@WebServlet("/infoUp")
public class infoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		
	
		String company = request.getParameter("company");
		String email = request.getParameter("email");
		String depart = request.getParameter("depart");
		String position = request.getParameter("position");
		String tel = request.getParameter("tel");
		
		UserInfoDAO dao = new UserInfoDAO();
		userInfo info = new userInfo();
		
		info.setComNum(company);
		info.setEmail(email);
		info.setDepart(depart);
		info.setPhone(tel);
		info.setPosition(position);
		
		dao.app_Up(info);
		
		String url = "WEB-INF/MemberManagement.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}
