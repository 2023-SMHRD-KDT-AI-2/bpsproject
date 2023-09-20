package com.moon.controller;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.model.NoticeBoard;
import com.moon.model.NoticeBoardDAO;

@WebServlet("/noticeWrite")
public class noticeWrite extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		

		String boardId = request.getParameter("boardId");
		String boardTitle = request.getParameter("boardTitle");
		String userId = request.getParameter("userId");
		String boardDate = request.getParameter("boardDate");
		String boardContent = request.getParameter("boardContent");
		String companyNum = request.getParameter("companyNum");
		String noticeCheck = request.getParameter("noticeCheck");
		

		NoticeBoard nb = new NoticeBoard();

		nb.setBoard_title(boardTitle);
		nb.setBoard_content(boardContent);
		nb.setUserid(userId);
		nb.setCompany_num(companyNum);
		
		NoticeBoardDAO dao = new NoticeBoardDAO();
		
		
		int result = dao.noticeInsert(nb);
				
		
		String url ="";
		
		
		
		if (result > 0) {
			url="goNoticeBoard";
		} else {
			url="WEB-INF/BoardWrite.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
