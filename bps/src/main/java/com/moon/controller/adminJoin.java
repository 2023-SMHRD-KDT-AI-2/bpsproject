package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.model.UserInfoDAO;
import com.moon.model.userInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/adminJoin")
public class adminJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String path = request.getServletContext().getRealPath("file");
		
		// 저장하고자 하는 파일의 최대 크기 지정
		int maxSize = 1024 * 1024 * 5; // 5mb
		String encoding = "utf-8";
		
		// 파일을 업로드하기 위해 필요한 request 객체
		MultipartRequest multi = new MultipartRequest(
				request,
				path,
				maxSize,
				encoding,
				new DefaultFileRenamePolicy()
				// └> 파일 업로드 시 중복되는 이름을 방지할 수 있는 객체! 
				);
		
		
		String inputEmail1 = multi.getParameter("inputEmail1");
		String inputEmail2 = multi.getParameter("inputEmail2");
		String pw = multi.getParameter("pw");
		String inputName = multi.getParameter("inputName");
		String inputPhone1 = multi.getParameter("inputPhone1");
		String inputPhone2 = multi.getParameter("inputPhone2");
		String inputPhone3 = multi.getParameter("inputPhone3");
		String address = multi.getParameter("address");
		String address_detail = multi.getParameter("address_detail");
		String companyName = multi.getParameter("compName");
		String compNum = multi.getParameter("compNum");
		String compLogo = multi.getFilesystemName("comLogo");
		
		UserInfoDAO dao = new UserInfoDAO();
		
		userInfo user = new userInfo();
		user.setAddress(address+" "+address_detail);
		user.setComImg(compLogo);
		user.setComNum(compNum);
		user.setCompany(companyName);
		user.setEmail(inputEmail1+"@"+inputEmail2);
		user.setId(inputEmail1);
		user.setName(inputName);
		user.setPhone(inputPhone1+"-"+inputPhone2+"-"+inputPhone3);
		user.setPw(pw);
		user.setAdmin("Yes");
		
		int cnt = dao.adminJoin(user);
		
		String url ="";
		
		if(cnt>0) {
			url="WEB-INF/Login.jsp";
			
			
		}else {
			url="WEB-INF/AdminSingIn.jsp";
		}
		
				
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}
		
		
	
}
