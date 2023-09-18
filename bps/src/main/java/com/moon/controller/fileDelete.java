package com.moon.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.moon.model.fileDrive;
import com.moon.model.fileDriveDAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@WebServlet("/fileDel")
public class fileDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String filename = (String) request.getParameter("filename");
		String fileadd = (String) request.getParameter("fileadd");
		String company = (String) request.getParameter("company");
		
		
		fileDriveDAO dao = new fileDriveDAO();
		
		fileDrive fileDrive = new fileDrive();
		fileDrive.setFile_name(filename);
		fileDrive.setFile_add(fileadd);
		fileDrive.setCompany(company);
		
		int cnt = dao.fileDel(fileDrive);

		String url ="";

		if(cnt>0) {
			url="goFileDrive";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('파일이 삭제 되었습니다.'); location.href='" + url + "';</script>");
			writer.close();
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}else {
			url="goFileDrive";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('파일이 삭제가 실패 되었습니다.'); location.href='" + url + "';</script>");
			writer.close();
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
		
	
	}

}
