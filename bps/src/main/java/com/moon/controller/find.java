package com.moon.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.moon.model.UserInfoDAO;
import com.moon.model.login;

@WebServlet("/find")
public class find extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		UserInfoDAO dao = new UserInfoDAO();

		login user = new login();
	
		
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String id = request.getParameter("id");
// out.print >> ajax 통신에서는 result를 돌려주는 의미임
		//out.print(id);
	System.out.println(id);
	System.out.println(name);
		System.out.println(phone);
		if(id == null) {
		user.setPhone(phone);
		user.setName(name);
		}else {
			user.setPhone(phone);
			user.setName(name);
			user.setId(id);
		}
		//user.setPhone(phone);
		
		ArrayList<login> check = dao.find_id(user);

		JSONObject jobj = new JSONObject();
		//System.out.println(check.get(0).getId());
		
		System.out.println(check.get(0).getPhone());
	
		int idCheck = 0;

		
			
		if(id == null && check.get(0).getName() != null && check.get(0).getPhone() != null){
			
			
			jobj.put("id", check.get(0).getId());
			out.print(jobj);
		}else if(id != null){
			jobj.put("pw", check.get(0).getPw());
			out.print(jobj);
		}
		
		else if (jobj.isNull(name)) {

			idCheck = 0;
			
			out.print(idCheck);

		
		
		}
		
	}

}
