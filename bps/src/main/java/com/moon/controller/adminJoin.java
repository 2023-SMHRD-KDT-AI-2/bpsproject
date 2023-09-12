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

@WebServlet("/adminJoin")
public class adminJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String inputEmail1 = request.getParameter("inputEmail1");
		String inputEmail2 = request.getParameter("inputEmail2");
		String pw = request.getParameter("pw");
		String inputName = request.getParameter("inputName");
		String inputPhone1 = request.getParameter("inputPhone1");
		String inputPhone2 = request.getParameter("inputPhone2");
		String inputPhone3 = request.getParameter("inputPhone3");
		String address = request.getParameter("address");
		String address_detail = request.getParameter("address_detail");
		String companyName = request.getParameter("compName");
		String compNum = request.getParameter("compNum");
		String compLogo = request.getParameter("comLogo");
		
		UserInfoDAO dao = new UserInfoDAO();
		userInfo user = 
				new userInfo(inputEmail1,pw,inputName,inputEmail1+"@"+inputEmail2,
						address+" "+address_detail,inputPhone1+inputPhone2+inputPhone3,companyName,compNum,compLogo);
		
		int cnt = dao.adminJoin(user);
		
		String url ="";
		
		if(cnt>0) {
			url="WEB-INF/Main.jsp";
			
			
		}else {
			url="WEB-INF/AdminSingIn.jsp";
		}
		
				
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}
		
		
	
}
