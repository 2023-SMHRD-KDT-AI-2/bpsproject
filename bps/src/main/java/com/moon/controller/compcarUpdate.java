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


@WebServlet("/compcarUpdate")
 public class compcarUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String usereason = request.getParameter("usereason");
		String startTime = request.getParameter("startTime");
		String returnTime = request.getParameter("returnTime");
		String carNum = request.getParameter("carNum");
		String compNum = request.getParameter("compNum");
		String name = request.getParameter("name");
		String detail = request.getParameter("reason_detail");
		carInfoDAO dao = new carInfoDAO();
		
		
		
		carInfo carinfo = new carInfo();
		
		carinfo.setCarNum(carNum);
		carinfo.setStart_Date(startTime);
		carinfo.setEnd_date(returnTime);
		carinfo.setName(name);
		carinfo.setCompNum(compNum);
		carinfo.setReasonDetail(detail);
		carinfo.setUsingreason(usereason);
		
		
		int cnt = dao.compCarUpdate(carinfo);
		
		
	
		
		
		String url = "";
		
		
		
		
		if(cnt>0) {
			url="WEB-INF/car_reserv.jsp";
			
		}else {
			url="WEB-INF/car_reserv.jsp";
		}
		
				
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		
	}

}
