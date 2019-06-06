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

import kh.semi.dao.NoticeDAO;

@WebServlet("*.notice")
public class NoticeServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException 
	{
		String url = request.getRequestURI().substring(request.getContextPath().length() + 1);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		
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
				
				String writer = request.getParameter("writer");
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				
				int result = dao.insertNew(writer, title, contents);
				
				if(result > 0)
				{
					request.getRequestDispatcher("NoticeWrite.jsp").forward(request, response);
				}
				else
				{
					response.sendRedirect("error.html");
				}
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else if(url.equals("list.notice"))
		{
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
