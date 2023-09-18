package com.moon.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/fileDown")
public class fileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String path = "C:\\Users\\SMHRD\\Desktop\\Core_Project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\bps\\file\\";
		
		String filename = (String) request.getParameter("filename");
		
		String downLoadFile = path + filename;
				
		File f = new File(downLoadFile);
		
		FileInputStream in = new FileInputStream(downLoadFile);
		
		filename = new String(filename.getBytes("utf-8"), "8859_1");
		
		response.setContentType("application/octet-stream");							
		// 8비트로 된 데이터(지정되지 않은 파일 형식)
		response.setHeader("Content-Disposition", "attachment; filename=" + filename ); 
		// 파일 링크를 클릭했을때 다운로드 화면이 출력되게 처리함
		
		OutputStream out = response.getOutputStream();
		
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

}
