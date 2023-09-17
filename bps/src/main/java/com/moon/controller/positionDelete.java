package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.moon.model.PositionDAO;
import com.moon.model.position;




@WebServlet("/positionDel")
public class positionDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("utf-8");
		
		String position = request.getParameter("position");
		String ex = request.getParameter("ex");
		String email = request.getParameter("email");
		
		
		PositionDAO dao = new PositionDAO();
		position posi = new position();
		posi.setEmail(email);
		posi.setEx(ex);
		posi.setPosition_name(position);
		
		dao.positionDel(posi);
		String url = "goPosition";
		

		RequestDispatcher rd =  request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}


