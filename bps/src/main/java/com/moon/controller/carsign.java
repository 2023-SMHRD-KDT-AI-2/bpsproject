package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.model.carInfo;
import com.moon.model.carInfoDAO;

@WebServlet("/carsign")
public class carsign extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		
		String carName = request.getParameter("carName");
		String carNum = request.getParameter("carNum");
		String manufac = request.getParameter("manufac");
		String compNum = request.getParameter("compNum");
		String name = request.getParameter("name");
		String compName = request.getParameter("compName");
		String depart = request.getParameter("depart");
		
		carInfoDAO dao = new carInfoDAO();
		
		carInfo carinfo = new carInfo();
		
		
		carinfo.setCarName(carName);
		carinfo.setCarNum(carNum);
		carinfo.setCompNum(compNum);
		carinfo.setManufac(manufac);
		carinfo.setDepart(depart);
		carinfo.setCompany(compName);
		carinfo.setName(name);
		
		
		
		int cnt = dao.carSign(carinfo);
		
		String url ="";
		
		if(cnt>0) {
			url="WEB-INF/DepartmentManagement.jsp";
			
			
		}else {
			url="WEB-INF/DepartmentManagement.jsp";
		}
		
				
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}
		
		
		
	

}
