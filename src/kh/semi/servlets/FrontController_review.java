package kh.semi.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.dao.ReviewDAO;
import kh.semi.dto.ReviewDTO;

@WebServlet("*.review")
public class FrontController_review extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String reqUri = request.getRequestURI();
		String cxtpath = request.getContextPath();
		String cmd = reqUri.substring(cxtpath.length());
		PrintWriter pw = response.getWriter();
		ReviewDTO dto = new ReviewDTO();

		if(cmd.contentEquals("/index.review")) {
			System.out.println("/index.review");
			int currentPage = 0;
			try {
				
				ReviewDAO dao = new ReviewDAO();
				
				String id = (String)request.getSession().getAttribute("loginId");
				
				int classId =Integer.parseInt(request.getParameter("classId"));
				System.out.println("classId :" + classId);
				
				
				String currentPageResult = request.getParameter("currentPage");
				
				if(currentPageResult!=null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));

				}else {
					currentPage = 1;
				}
				int recordCountPerPage = 3;

				int end = currentPage * recordCountPerPage;
				int start = end - (recordCountPerPage-1);
				List<ReviewDTO> list = dao.selectAll(start, end, classId);
				
				for(int i = 1 ; i <= list.size() ; i++)
				{
					int seq  = list.get(i-1).getRe_seq();
					if(dao.overlapCheck(seq, id))
					{
						request.setAttribute("likeCheck"+(i-1), "true");
					}
				}
				
				/*
				 * int aveStar = dao.aveStar(classId); // 평균 별점 dao.updateAveStar(aveStar,
				 * classId);// 평균 별점 업데이트
				 */				
				request.setAttribute("list", list);

				int recordTotalCount = dao.boardCount(classId);
				String resultNavi = dao.getNavi(currentPage, recordTotalCount, recordCountPerPage, classId);
				request.setAttribute("recordTotalCount", recordTotalCount);
				request.setAttribute("resultNavi", resultNavi);
				request.getRequestDispatcher("review.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(cmd.contentEquals("/like.review")) {
			System.out.println("추천");
			String loginId = (String)request.getSession().getAttribute("loginId");
			String r_seq = request.getParameter("re_seq");
			if(loginId != null) {
				System.out.println(loginId);
				String seq = r_seq.substring(15, 16);
				int re_seq = Integer.parseInt(seq);
				try 
				{
					ReviewDAO dao = new ReviewDAO();
					
					if(dao.overlapCheck(re_seq, loginId))
					{
						String str = "이미 추천 하신 리뷰입니다.";
						pw.print(str);
					}
					else
					{
						int result = dao.clickLike(re_seq, loginId);
						if(result>0) 
						{
							int countLike = dao.countLike(re_seq);
							System.out.println(countLike);
							dao.updateLike(re_seq, countLike);
							String str = "추천";
							pw.print(str);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			}else {
				String result = "로그인이 필요합니다";
				pw.print(result);
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
