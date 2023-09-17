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

import com.moon.model.PositionDAO;
import com.moon.model.position;




@WebServlet("/positioninsert")
public class positionInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String url = "goPosition";
		String position = request.getParameter("position");
		String ex = request.getParameter("ex");
		String email = request.getParameter("email");
		
		
		if (position.equals("") && ex.equals("")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('입력할 내용이 없습니다.'); window.history.back();</script>"); 
			writer.close();
		} else if (ex.equals("")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('설명을 입력하세요.'); window.history.back();</script>"); 
			writer.close();
		} else if (position.equals("")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('직급을 입력하세요.'); window.history.back();</script>"); 
			writer.close();
		} else {
			
		
		
		
		PositionDAO dao = new PositionDAO();
		position posi = new position();
		posi.setEmail(email);
		posi.setEx(ex);
		posi.setPosition_name(position);
		
		
		
		
		position po = new position();
		po.setEmail(email);
		po.setPosition_name(position);
		
		po = dao.positionCheck(po);
		
		
		
		if (po != null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('이미 존재하는 직급입니다.'); location.href='"+url+"';</script>"); 
			writer.close();
		} else {
			dao.positioninsert(posi);
			
			RequestDispatcher rd =  request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
		
		
		
		}
		
	}

}


