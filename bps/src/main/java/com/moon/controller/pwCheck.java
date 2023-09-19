package com.moon.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.model.UserInfoDAO;
import com.moon.model.login;
import com.moon.model.userInfo;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

@WebServlet("/pwCheck")

public class pwCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserInfoDAO dao = new UserInfoDAO();

		login user = new login();
	
		
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
// out.print >> ajax 통신에서는 result를 돌려주는 의미임
//		out.print(id);
	
		user.setId(id);
		user.setPw(pw);
		
		login check = dao.user_id(user);
		
		
		int idCheck = 0;

		if (!check.getPw().equals(pw)) {

			idCheck = 0;

		} else{
			
			idCheck = 1;
		}

		out.print(idCheck);
		// json형식으로
		
	
	}

}
