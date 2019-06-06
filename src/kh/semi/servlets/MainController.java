package kh.semi.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.dao.CategoryDAO;
import kh.semi.dto.CategoryDTO;

@WebServlet("/start.main")
public class MainController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAO dao = new CategoryDAO();
		try {
			int count = dao.recordTotalCount();
			request.setAttribute("count", count);
			
			List<CategoryDTO> popularList = dao.getInfoBySelect("info_avgstar", 1, 4);
			request.setAttribute("popularList", popularList );
			
			request.getRequestDispatcher("mainHomePage.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
