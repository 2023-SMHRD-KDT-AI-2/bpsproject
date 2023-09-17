package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.moon.model.Depart;
import com.moon.model.departDAO;





@WebServlet("/departDel")
public class departDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		
		
		String depart = request.getParameter("dep");
		String depart_call = request.getParameter("tel");
		String depart_name = request.getParameter("dep_name");
		String ex = request.getParameter("ex");
		String email = request.getParameter("email");
		
		departDAO dao = new departDAO();
		Depart de = new Depart();

	
		de.setEmail(email);
		de.setEx(ex);
		de.setDepart_call(depart_call);
		de.setDepart_name(depart_name);
		de.setDepart(depart);
		
		dao.departDel(de);
		String url = "goDepart";
		

		RequestDispatcher rd =  request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}
