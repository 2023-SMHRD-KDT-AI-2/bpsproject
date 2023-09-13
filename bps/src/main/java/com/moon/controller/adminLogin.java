package com.moon.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.model.UserInfoDAO;
import com.moon.model.compInfo;
import com.moon.model.login;
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
		
		login user = new login();
		
		user.setEmail(id);
		user.setPw(pw);
		
		login userAll = dao.info_data(user);
		
		
	
		
		
		// view 처리
		// 실패 - LoginFail.jsp
		
		String url = "";
		
		if(userAll != null) {
			// 성공 - LoginSuccess.jsp
			// ~~님 환영합니다 
			// 페이지 이동시 name값 공유
			String name = userAll.getName();
			String admin = userAll.getAdmin();
			String logo = userAll.getLogo();
			String compName = userAll.getComp_name();
			
			request.setAttribute("name", name);
			request.setAttribute("admin", admin);
			request.setAttribute("logo", logo);
			request.setAttribute("compName", compName);
			url = "WEB-INF/Main.jsp";
			
		}else if (userAll == null){
			url = "goLogin";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그인실패'); location.href='"+url+"';</script>"); 
			writer.close();
		}
		
		RequestDispatcher rd =  request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		
		
		
		
		
	}

}
