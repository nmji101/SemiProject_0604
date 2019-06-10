package kh.semi.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.dao.GoogleDAO;
import kh.semi.dto.GoogleDTO;
import kh.semi.dto.GoogleDTO2;


@WebServlet("*.google")
public class GoogleController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String URI = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = URI.substring(ctx.length());
		try {
			GoogleDTO dto = new GoogleDTO();
			GoogleDAO dao = new GoogleDAO();


			if(command.equals("/statistics.google")) {
				try {
					List<GoogleDTO> result1 = dao.selectDay();
					request.setAttribute("result1", result1);

					List<GoogleDTO2> result2 = dao.selectWeek();
					request.setAttribute("result2", result2);

					List<GoogleDTO> result3 = dao.selectMonth();
					request.setAttribute("result3",result3);

					List<GoogleDTO> gender = dao.selectMonthGender();
					request.setAttribute("gender",gender);
					request.getRequestDispatcher("Statistics.jsp").forward(request, response);
				}catch(Exception e) {
					e.printStackTrace();
				}

			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
