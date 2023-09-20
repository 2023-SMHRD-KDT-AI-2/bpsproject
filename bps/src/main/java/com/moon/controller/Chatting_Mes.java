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

import com.moon.model.ChattingDAO;
import com.moon.model.ChattingDTO;
import com.moon.model.UserInfoDAO;
import com.moon.model.userInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/Chatting_Mes")
public class Chatting_Mes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String mes_text = request.getParameter("mes_text");
		String host = request.getParameter("host");
		String guest = request.getParameter("guest");
		String select_room = request.getParameter("select_room");

		
		
		ArrayList<userInfo> list_info = new ArrayList<>();

		UserInfoDAO dao = new UserInfoDAO();

		list_info = dao.detailed(host);
		String host_name = list_info.get(0).getName();
		String host_comp = list_info.get(0).getCompany();

		list_info = dao.detailed(guest);
		String guest_name = list_info.get(0).getName();
		
		System.out.println(mes_text);
		System.out.println(host);
		System.out.println(guest);
		System.out.println(host_name);
		System.out.println(host_comp);
		System.out.println(guest_name);

		
		
		ArrayList<ChattingDTO> list_chat = new ArrayList<>();

		ChattingDTO chatDTO = new ChattingDTO();
		ChattingDAO chatDAO = new ChattingDAO();

		chatDTO.setHost_email(host);
		chatDTO.setHost_email_sub(host);
		chatDTO.setGuest_email(guest);
		chatDTO.setGuest_email_sub(guest);

		list_chat = chatDAO.show_room(chatDTO);

		if (list_chat.isEmpty()) {
			chatDTO.setHost_email(guest);
			chatDTO.setHost_email_sub(guest);
			chatDTO.setGuest_email(host);
			chatDTO.setGuest_email_sub(host);

			list_chat = chatDAO.show_room(chatDTO);
			
			if (list_chat.isEmpty()) {
				chatDTO.setHost_email(host);
				chatDTO.setGuest_email(guest);
				int cnt = chatDAO.chat_room_in(chatDTO);
				
				if (cnt > 0) {
				chatDTO.setCompany(host_comp);
				chatDTO.setHost_email_sub(host);
				chatDTO.setGuest_email_sub(guest);

				chatDTO.setHost_email(host);
				chatDTO.setHost_name(host_name);
				chatDTO.setSend_mes(mes_text);
				chatDAO.chat_mes_in(chatDTO);
				
				String url = "Chatting?select_room="+select_room;

				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
				
				}
			} else {
				
				chatDTO.setCompany(host_comp);
				chatDTO.setHost_email_sub(guest);
				chatDTO.setGuest_email_sub(host);

				chatDTO.setHost_email(host);
				chatDTO.setHost_name(host_name);
				chatDTO.setSend_mes(mes_text);
				chatDAO.chat_mes_in(chatDTO);
				
				String url = "Chatting?select_room="+select_room;

				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
				
			}
		} else {
			
			chatDTO.setCompany(host_comp);
			chatDTO.setHost_email_sub(host);
			chatDTO.setGuest_email_sub(guest);

			chatDTO.setHost_email(host);
			chatDTO.setHost_name(host_name);
			chatDTO.setSend_mes(mes_text);
			chatDAO.chat_mes_in(chatDTO);
			
			String url = "Chatting?select_room="+select_room;

			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
	}

}
