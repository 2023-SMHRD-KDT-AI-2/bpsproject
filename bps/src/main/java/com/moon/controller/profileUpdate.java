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
import com.moon.model.login;
import com.moon.model.userInfo;

/**
 * Servlet implementation class profileUpdate
 */
@WebServlet("/profileUpdate")
public class profileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
    
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("inputId");
		String name = request.getParameter("inputName");
		String phone = request.getParameter("inputPhone");
		String pw = request.getParameter("newPass");
		UserInfoDAO dao = new UserInfoDAO();
		
		
		System.out.println(id);
		
		HttpSession session = request.getSession();
		
		userInfo info = new userInfo();
		
		
		
		if(id != null && name != null) {
		info.setId(id);
		info.setName(name);
		
		dao.profile(info);
		
		session.setAttribute("name", name);
		
		
		}else if(id != null && phone != null) {
			info.setId(id);
			info.setPhone(phone);
			dao.p_profile(info);
			
			session.setAttribute("phone", phone);
		}else if(id != null && pw != null) {
			info.setId(id);
			info.setPw(pw);
			dao.pw_profile(info);
		}
		
		
		
		String url = "WEB-INF/MyPage.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
