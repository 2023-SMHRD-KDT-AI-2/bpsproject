package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.model.NoticeBoard;
import com.moon.model.NoticeBoardDAO;

@WebServlet("/boardDetail")
public class boardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		String num = request.getParameter("num");
		
		int num_n = Integer.parseInt(num);
		
		NoticeBoardDAO dao = new NoticeBoardDAO();
		
		NoticeBoard board = dao.detail(num_n);
		
		request.setAttribute("detail", board);
		
		String moveUrl = "WEB-INF/BoardDetail.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(moveUrl);
		rd.forward(request, response);
}

}
