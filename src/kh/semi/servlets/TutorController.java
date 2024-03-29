package kh.semi.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.semi.dao.TutorDAO;
import kh.semi.dto.ClassInfoDTO;


@WebServlet("*.tutor")
public class TutorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(request.getRemoteAddr()+"님 접속:"+command);
		try {
			TutorDAO dao = new TutorDAO();
			ClassInfoDTO dto = new ClassInfoDTO();

			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월DD일E요일");
			String time = sdf.format(date);
			PrintWriter pw = response.getWriter();


			String rootPath = request.getServletContext().getRealPath("/");
			String filePath = rootPath + "files" ; 
			String filePath2 = filePath + "/"+time;


			File uploadPath1 = new File(filePath);
			if(!uploadPath1.exists()) {
				uploadPath1.mkdir();
			}
			File uploadPath = new File(filePath2);
			if(!uploadPath.exists()) {
				uploadPath.mkdir();
			}
			//		System.out.println(rootPath);
			//		System.out.println(filePath2);
			System.out.println(filePath2.substring(rootPath.length()));
			String filePathtoImg = filePath2.substring(rootPath.length());
			if(command.equals("/tutor.tutor")){

				try {
					MultipartRequest multi = new MultipartRequest(request, filePath2, 20 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
					Enumeration files = multi.getFileNames();

					dto.setInfo_tutorid(multi.getParameter("tutorid"));
					dto.setInfo_tutorid((String)request.getSession().getAttribute("loginId"));
					dto.setInfo_category(multi.getParameter("down"));
					dto.setInfo_title(multi.getParameter("inputtitle"));
					dto.setInfo_explain(multi.getParameter("explain"));
					dto.setInfo_intro(multi.getParameter("intro"));
					dto.setInfo_addr1(multi.getParameter("addr1"));
					dto.setInfo_addr2(multi.getParameter("addr2"));
					dto.setInfo_addr3(multi.getParameter("addr3"));
					dto.setInfo_addr4(multi.getParameter("addr4"));
					dto.setInfo_maxperson(Integer.parseInt(multi.getParameter("max")));
					dto.setInfo_price(Integer.parseInt(multi.getParameter("cash")));
					
					dto.setInfo_img1(filePathtoImg+"/"+multi.getFilesystemName("img"));
//					if(multi.getFilesystemName("img1")==null) {
//						dto.setInfo_img1("Content/Images/class_default.png");
//					}
					dto.setInfo_img2(filePathtoImg+"/"+multi.getFilesystemName("img2"));
					if(multi.getFilesystemName("img2")==null) {
						dto.setInfo_img2(multi.getFilesystemName("img2"));
					}
					dto.setInfo_img3(filePathtoImg+"/"+multi.getFilesystemName("img3"));
					if(multi.getFilesystemName("img3")==null) {
						dto.setInfo_img3(multi.getFilesystemName("img3"));
					}
					
					
					if(((dto.getInfo_img1() == null) && (dto.getInfo_img2() == null)) && (dto.getInfo_img3() == null))
					{
						System.out.println("1번");
						dto.setInfo_img1("Content/Images/class_default.png");
					}
					else if(((dto.getInfo_img1() != null) && (dto.getInfo_img2() == null)) && (dto.getInfo_img3() == null))
					{
						System.out.println("2번");
					}
					else if(((dto.getInfo_img1() == null) && (dto.getInfo_img2() != null)) && (dto.getInfo_img3() == null))
					{
						System.out.println("3번");
						dto.setInfo_img1(dto.getInfo_img2());
						dto.setInfo_img2(null);
					}
					else if(((dto.getInfo_img1() == null) && (dto.getInfo_img2() == null)) && (dto.getInfo_img3() != null))
					{
						System.out.println("4번");
						dto.setInfo_img1(dto.getInfo_img3());
						dto.setInfo_img3(null);
					}
					else if(((dto.getInfo_img1() != null) && (dto.getInfo_img2() != null)) && (dto.getInfo_img3() == null))
					{
						System.out.println("5번");
					}
					else if(((dto.getInfo_img1() == null) && (dto.getInfo_img2() != null)) && (dto.getInfo_img3() != null))
					{
						System.out.println("6번");
						dto.setInfo_img1(dto.getInfo_img3());
						dto.setInfo_img3(null);
					}
					else if(((dto.getInfo_img1() != null) && (dto.getInfo_img2() == null)) && (dto.getInfo_img3() != null))
					{
						System.out.println("7번");
						dto.setInfo_img2(dto.getInfo_img3());
						dto.setInfo_img3(null);
					}
					else if(((dto.getInfo_img1() != null) && (dto.getInfo_img2() != null)) && (dto.getInfo_img3() != null))
					{
						System.out.println("8번");
					}
				
					
					
					dto.setInfo_start(multi.getParameter("startdate"));
					dto.setInfo_end(multi.getParameter("enddate"));

					int result = dao.test(dto);   
					if(result>0) {
						System.out.println("DB저장완료");
						request.getRequestDispatcher("/WEB-INF/ForTutorAfter.jsp").forward(request, response);
					}  
				}catch(Exception e) {
					e.printStackTrace();
				}
			} 	

			if(command.equals("/click.tutor")) {//클래스 제목클릭
				int info_classid = Integer.parseInt(request.getParameter("info_classid"));
				try {

					dto=dao.content(info_classid);
					request.setAttribute("dto",dto);
					request.getRequestDispatcher("/WEB-INF/ForTutorEdit.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}

			}	
			if(command.equals("/edit.tutor")) {//클래스 수정버튼 클릭
				MultipartRequest multi = new MultipartRequest(request, filePath2, 20 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
				Enumeration files = multi.getFileNames();
				System.out.println(multi.getParameter("info_classid"));
				//System.out.println("수정버튼 클릭함");
				int info_classid = Integer.parseInt(multi.getParameter("info_classid"));
				try {
					dto.setInfo_category(multi.getParameter("down"));
					dto.setInfo_title(multi.getParameter("inputtitle").replaceAll("<script>",""));
					dto.setInfo_explain(multi.getParameter("explain").replaceAll("<script>",""));
					dto.setInfo_addr1(multi.getParameter("addr1"));
					dto.setInfo_addr2(multi.getParameter("addr2"));
					dto.setInfo_addr3(multi.getParameter("addr3"));
					dto.setInfo_addr4(multi.getParameter("addr4"));
					dto.setInfo_maxperson(Integer.parseInt(multi.getParameter("max")));
					dto.setInfo_price(Integer.parseInt(multi.getParameter("cash")));
					dto.setInfo_start(multi.getParameter("startdate"));
					dto.setInfo_end(multi.getParameter("enddate"));
					//System.out.println((multi.getParameter("down")));
					int result =dao.update(info_classid, dto);

					request.getRequestDispatcher("start.main").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}