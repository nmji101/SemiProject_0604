package kh.semi.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.dao.CategoryDAO;
import kh.semi.dao.ClassInfoDAO;
import kh.semi.dao.ReviewDAO;
import kh.semi.dto.CategoryDTO;
import kh.semi.dto.ClassInfoDTO;
import kh.semi.dto.ReviewDTO;

@WebServlet("/start.main")
public class MainController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAO dao = new CategoryDAO();
		try {
			int count = dao.recordTotalCount();
			request.setAttribute("count", count);
			//new MemberDAO().insertAdmin();
			
			List<CategoryDTO> popularList = dao.getInfoBySelect("info_avgstar", 1, 5);
			int num1 = (int)(Math.random()*5+1);
			int num2 = (int)(Math.random()*5+1);
			while(true) {
				if(num1 == num2) {
				num2 = (int)(Math.random()*5+1);
				}else {
					break;
				}
			}
			
			int classId1 = popularList.get(num1-1).getInfo_classid();
			int classId2 = popularList.get(num2-1).getInfo_classid();
			ReviewDAO rdao = new ReviewDAO();
			List<ReviewDTO> review1 = rdao.selectAll(1, 5, classId1);
			List<ReviewDTO> review2 = rdao.selectAll(1, 5, classId2);
			
			ClassInfoDAO cdao = new ClassInfoDAO();
			ClassInfoDTO dto1 = cdao.selectInfoByClassId(classId1);
			ClassInfoDTO dto2 = cdao.selectInfoByClassId(classId2);
			
			request.setAttribute("review1", review1);
			request.setAttribute("review2", review2);
			request.setAttribute("dto1", dto1);
			request.setAttribute("dto2", dto2);
			
			request.getRequestDispatcher("mainHomePage.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
