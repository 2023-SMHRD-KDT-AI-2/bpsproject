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



@WebServlet("/fileInsert")
public class fileInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		

		
request.setCharacterEncoding("UTF-8");
		
		String path = request.getServletContext().getRealPath("file");
		
		// 저장하고자 하는 파일의 최대 크기 지정
		int maxSize = 1024 * 1024 * 50000; // 5mb
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
		
		
		String company = multi.getParameter("company");
		String file_add = multi.getFilesystemName("file");
		String file_name = multi.getOriginalFileName("file");
		
		fileDriveDAO dao = new fileDriveDAO();
		
		fileDrive fileDrive = new fileDrive();
		fileDrive.setFile_name(file_name);
		fileDrive.setFile_add(file_add);
		fileDrive.setCompany(company);
		
		
		int cnt = dao.fileInsert(fileDrive);
		
		String url ="";
		
		if(cnt>0) {
			url="goFileDrive";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('파일이 업로드 되었습니다.'); location.href='" + url + "';</script>");
			writer.close();
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}else {
			url="goFileDrive";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('파일이 업로드가 실패 되었습니다.'); location.href='" + url + "';</script>");
			writer.close();
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
		
				
		
	
		
	}

}
