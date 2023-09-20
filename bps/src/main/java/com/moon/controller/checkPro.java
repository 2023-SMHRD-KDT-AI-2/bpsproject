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

import com.moon.model.attend;
import com.moon.model.attendDAO;


@WebServlet("/checkPro")

public class checkPro extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String attend = request.getParameter("attend");
		
		String idx = id.split("@")[0];
		
		System.out.println(id);
		System.out.println(attend);
		
		attendDAO dao = new attendDAO();
		
		attend info = new attend();
		
		info.setId(idx);
		info.setAttend_info(attend);
		
		int cnt = dao.attend_in(info);
		
		String url ="";
		
		if(cnt>0) {
			url="goMain";
			
			
		}else {
			url="goMain";
		}
		
				
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		


	
	}

}
