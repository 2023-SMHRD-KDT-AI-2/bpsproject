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



@WebServlet("/Login")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// 기능처리
		UserInfoDAO dao = new UserInfoDAO();
		
		userInfo user = new userInfo();
		user.setEmail(id);
		user.setPw(pw);
		
		String name = dao.login(user);
		
		// view 처리
		// 실패 - LoginFail.jsp
		
		String url = "";
		
		if(name != null) {
			// 성공 - LoginSuccess.jsp
			// ~~님 환영합니다 
			// 페이지 이동시 name값 공유
			request.setAttribute("name", name);
			url = "WEB-INF/Main.jsp";
			
		}else {
			request.setAttribute("name", name);
			url = "WEB-INF/Login.jsp";
			
		}
		
		RequestDispatcher rd =  request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		
		
		
		
		
	}

}
