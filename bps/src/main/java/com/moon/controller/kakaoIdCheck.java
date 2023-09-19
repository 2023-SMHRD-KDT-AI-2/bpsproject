package com.moon.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.moon.model.UserInfoDAO;
import com.moon.model.login;


@WebServlet("/kakaoIdCheck")
public class kakaoIdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserInfoDAO dao = new UserInfoDAO();

		login user = new login();

		PrintWriter out = response.getWriter();

		String id = request.getParameter("userId");
		
// out.print >> ajax 통신에서는 result를 돌려주는 의미임
//		out.print(id);
		
		
		user.setId(id);
		
		System.out.println(id);

		ArrayList<login> check = dao.user_id_pw(user);

		JSONObject jobj = new JSONObject();

		
	
		if(jobj.isNull(id)) {
			System.out.println("yes");
		}else {
			System.out.println("false");
		}
		
	
		
		int idCheck = 0;

		

		if(check.get(0).getSign_date() == null){
	
			System.out.println("1");
			idCheck = 0;
			out.print(idCheck);

			
		}else if(check.get(0).getSign_date() != null) {
			System.out.println("2");
			idCheck = 2;
			String name = check.get(0).getName();
			request.setAttribute("name", name);
			
			jobj.put("pw", check.get(0).getPw());
			
			out.print(jobj);
		}
		
		else if (jobj.isNull(id)) {
System.out.println("3");
			idCheck = 1;
			out.print(idCheck);
		}

}

		 // json형식으로
		
		
	
	
	
	
	
	}


