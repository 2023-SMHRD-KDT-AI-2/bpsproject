package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.model.message;
import com.moon.model.messageDAO;



@WebServlet("/SendMessage")
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("UTF-8");
	
		// 2. 데이터 수집(메세지 작성 시 사용된 데이터 찾아오기)
		// - sendName, receiveEmail, message
		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		String content = request.getParameter("content");
		
		// 3. 기능처리
		// DAO 접근, 보내고자 하는 데이터 전달
		// 처리결과 받아오기
		messageDAO dao = new messageDAO();
		message msg = new message();
		
		
		msg.setSender(sender);
		msg.setReceiver(receiver);
		msg.setContent(content);
		
		int cnt = dao.sendmsg(msg); 
		
		// 4. view 처리
		// 성공/실패 -> Main.jsp
		
	String url = "WEB-INF/MessageMain.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
