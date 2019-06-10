package kh.semi.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import kh.semi.dao.DoClassDAO;
import kh.semi.dao.MemberDAO;
import kh.semi.dao.NoticeDAO;
import kh.semi.dao.PersonDAO;
import kh.semi.dto.DoClassDTO;
import kh.semi.dto.NoticeDTO;

@WebServlet("*.notice")
public class NoticeServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	static int recordCountPerPage = 10;
	static int naviCountPerPage = 10;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException 
	{
		String url = request.getRequestURI().substring(request.getContextPath().length() + 1);
		System.out.println(request.getRemoteAddr()+"님 접속:"+url);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		
		String id = (String)request.getSession().getAttribute("loginId");
		
		System.out.println(url);
		
		if(url.equals("upload.notice"))
		{
			String rootPath = this.getServletContext().getRealPath("/");
			String filePath = rootPath + "files";
			
			File uploadPath = new File(filePath);
			if(!uploadPath.exists())
			{
				uploadPath.mkdir();
			}
			
			DiskFileItemFactory diskFactory = new DiskFileItemFactory();
			diskFactory.setRepository(new File(rootPath + "WEB-INF/temp"));
			
			ServletFileUpload sfu = new ServletFileUpload(diskFactory);
			sfu.setFileSizeMax(10 * 1024 * 1024);
			
			try
			{
				List<FileItem> items = sfu.parseRequest(request);
				for(FileItem fi : items)
				{
					if(fi.getSize() == 0)
					{
						continue;
					}
					while(true)
					{
						try
						{
							String tmpName = System.currentTimeMillis() + "_" + fi.getName();
							
							fi.write(new File(filePath + "/" + tmpName));
							pw.print(tmpName);
							break;
						}
						catch(org.apache.commons.io.FileExistsException e)
						{
							System.out.println("파일 이름 재설정");
						}
					}
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else if(url.equals("write.notice"))
		{
			try
			{
				NoticeDAO dao = new NoticeDAO();
				PersonDAO pdao = new PersonDAO();
				MemberDAO mdao = new MemberDAO();
				
				String type = mdao.selectTypeById(id);
				
				if(type.equals("admin"))
				{
					String writer = request.getParameter("writer");
					String title = request.getParameter("title");
					String contents = request.getParameter("contents");
					
					writer = writer.replaceAll("<script>", "");
					title = title.replaceAll("<script>", "");
					contents = contents.replaceAll("<script>", "");
					writer = writer.replaceAll("<Script>", "");
					title = title.replaceAll("<Script>", "");
					contents = contents.replaceAll("<Script>", "");
					
					if(title == null)
					{
						title = "제목 없음";
					}
					if(contents == null)
					{
						contents = "내용 없음";
					}
					
					writer = pdao.selectById(writer).getM_nickname();
					
					int result = dao.insertNew(writer, title, contents);
					
					if(result > 0)
					{
						response.sendRedirect("list.notice?page=1");
					}
					else
					{
						System.out.println(" Insert Error ");
						response.sendRedirect("error.html");
					}
				}
				else
				{
					System.out.println("m_type != admin ");
					response.sendRedirect("error.html");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}
		else if(url.equals("writePage.notice"))
		{
			request.getRequestDispatcher("/WEB-INF/NoticeWrite.jsp").forward(request, response);
		}
		else if(url.equals("list.notice"))
		{
			try
			{
				MemberDAO mdao = new MemberDAO();
				String m_id = (String)request.getSession().getAttribute("loginId");
				String type = mdao.selectTypeById(m_id);
				
				request.setAttribute("type", type);
				
				NoticeDAO dao = new NoticeDAO();
				
				int currentPage;

				currentPage = Integer.parseInt(request.getParameter("page"));
				
				List<NoticeDTO> list = dao.selectList(currentPage);
				
				int recordTotalCount = dao.selectCount();
				
				int pageTotalCount;
				
				boolean needPrev = true;
				boolean needNext = true;
				
				if( recordTotalCount % recordCountPerPage == 0)
				{
					pageTotalCount = recordTotalCount / recordCountPerPage;
				}
				else
				{
					pageTotalCount = recordTotalCount / recordCountPerPage + 1;
				}

				if(currentPage < 1)
				{
					currentPage = 1;
				}
				else if(currentPage > pageTotalCount)
				{
					currentPage = pageTotalCount;
				}
				
				int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
				int endNavi = startNavi + naviCountPerPage - 1;
				if(endNavi > pageTotalCount)
				{
					endNavi = pageTotalCount;
				}
				
				if(startNavi == 1)
				{
					needPrev = false;
				}
				if(endNavi == pageTotalCount)
				{
					needNext = false;
				}
				
				request.setAttribute("list", list);
				request.setAttribute("listsize", list.size());
				
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("needPrev", needPrev);
				request.setAttribute("needNext", needNext);
				request.setAttribute("startNavi", startNavi);
				request.setAttribute("endNavi", endNavi);
			
				request.getRequestDispatcher("NoticeView.jsp?page="+currentPage).forward(request, response);
			}
			catch (Exception e) 
			{
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}
		else if(url.equals("detail.notice"))
		{
			int seq = Integer.parseInt(request.getParameter("seq"));
			try
			{
				MemberDAO mdao = new MemberDAO();
				String m_id = (String)request.getSession().getAttribute("loginId");
				String type = mdao.selectTypeById(m_id);
				
				request.setAttribute("type", type);
				
				NoticeDAO dao = new NoticeDAO();
				NoticeDTO dto = dao.selectDetail(seq);
				
				request.setAttribute("dto", dto);
				
				request.getRequestDispatcher("NoticeDetail.jsp").forward(request, response);
			}
			catch(Exception e)
			{
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}
		else if(url.equals("delete.notice"))
		{
			try
			{
				MemberDAO mdao = new MemberDAO();
				String type = mdao.selectTypeById(id);
				
				if(type.equals("admin"))
				{
					int seq = Integer.parseInt(request.getParameter("seq"));
					NoticeDAO dao = new NoticeDAO();
					
					int result = dao.deleteBySeq(seq);
					
					if(result > 0)
					{
						response.sendRedirect("list.notice?page=1");
					}
					else
					{
						response.sendRedirect("error.html");
					}
				}
				else
				{
					System.out.println("m_type != admin ");
					response.sendRedirect("error.html");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
			
		}
		else if(url.equals("passon.notice"))
		{
			try
			{
				int seq = Integer.parseInt(request.getParameter("seq"));
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				
				request.setAttribute("seq", seq);
				request.setAttribute("title", title);
				request.setAttribute("contents", contents);
				
				request.getRequestDispatcher("/WEB-INF/NoticeUpdate.jsp").forward(request, response);
			}
			catch(Exception e)
			{
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}
		else if(url.equals("update.notice"))
		{
			try
			{
				int seq = Integer.parseInt(request.getParameter("seq"));
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				
				
				title = title.replaceAll("<script>", "");
				contents = contents.replaceAll("<script>", "");
				title = title.replaceAll("<Script>", "");
				contents = contents.replaceAll("<Script>", "");
				
				if(title == null)
				{
					title = "제목 없음";
				}
				if(contents == null)
				{
					contents = "내용 없음";
				}
				
				NoticeDAO dao = new NoticeDAO();
				int result1 = dao.updateTitleBySeq(title, seq);
				int result2 = dao.updateContentsBySeq(contents, seq);
				
				if(!(result1 > 0) || !(result2 > 0))
				{
					response.sendRedirect("error.html");
				}
				else
				{
					response.sendRedirect("list.notice?page=1");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
