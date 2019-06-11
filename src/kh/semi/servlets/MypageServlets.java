package kh.semi.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import kh.semi.dao.MyClassListDAO;
import kh.semi.dao.PersonDAO;
import kh.semi.dao.ReviewDAO;
import kh.semi.dao.UpgradeDAO;
import kh.semi.dto.DoClassDTO;
import kh.semi.dto.MyClassListDTO;
import kh.semi.dto.PersonDTO;


@WebServlet("*.mypage")
public class MypageServlets extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	static int recordCountPerPage = 3;
	static int naviCountPerPage = 5;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String url = request.getRequestURI().substring(request.getContextPath().length() + 1);
		System.out.println(request.getRemoteAddr()+"님 접속:"+url);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String m_id = (String)request.getSession().getAttribute("loginId");
		
		if(m_id == null)
		{
			System.out.println("세션에 아이디 없음");
			response.sendRedirect("Login.jsp");
		}
		else
		{
			System.out.println(url);
			if(url.equals("doing.mypage"))
			{
				try
				{
					PersonDAO dao = new PersonDAO();
					PersonDTO dto = dao.selectById(m_id);
					
					request.setAttribute("dto", dto);
					
					DoClassDAO dcdao = new DoClassDAO();
					
					int currentPage;
					currentPage = Integer.parseInt(request.getParameter("page"));

					List<DoClassDTO> list = dcdao.selectDoingClass(m_id, currentPage);
					
					for(int i = 1 ; i <= list.size() ; i++)
					{
						String tutorId = list.get(i-1).getTutorId();
						list.get(i-1).setTutorId(dao.selectById(tutorId).getM_nickname());
					}
					
					int recordTotalCount = dcdao.selectDoingCount(m_id);
					
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
				
					request.getRequestDispatcher("/WEB-INF/MypageDoing.jsp?page="+currentPage).forward(request, response);
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			else if(url.equals("done.mypage"))
			{
				
				try
				{
					PersonDAO dao = new PersonDAO();
					PersonDTO dto = dao.selectById(m_id);
					
					request.setAttribute("dto", dto);
					
					DoClassDAO dcdao = new DoClassDAO();
					
					int currentPage;
					currentPage = Integer.parseInt(request.getParameter("page"));
					
					List<DoClassDTO> list = dcdao.selectDoneClass(m_id, currentPage);
					for(int i = 1 ; i <= list.size() ; i++)
					{
						String tutorId = list.get(i-1).getTutorId();
						list.get(i-1).setTutorId(dao.selectById(tutorId).getM_nickname());
					}
					
					ReviewDAO rdao = new ReviewDAO();
					
					List<String> strList = new ArrayList<String>();
					
					for(int i = 1 ; i <= list.size() ; i++)
					{
						int classId = list.get(i-1).getClassId();
						if(rdao.overlapReviewCheck(classId, m_id))
						{
							strList.add("true");
						}
						else
						{
							strList.add("false");
						}
					}
					
					request.setAttribute("strList", strList);
					
					int recordTotalCount = dcdao.selectDoneCount(m_id);
					
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
				
					request.getRequestDispatcher("/WEB-INF/MypageDone.jsp?page="+currentPage).forward(request, response);
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			else if(url.equals("person.mypage"))
			{
				try
				{
					PersonDAO dao = new PersonDAO();
					PersonDTO dto = dao.selectById(m_id);
					request.setAttribute("dto", dto);
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("/WEB-INF/MypagePerson.jsp").forward(request, response);
			
			}
			else if(url.equals("update.mypage"))
			{
				try
				{
					PersonDAO dao = new PersonDAO();
					
					//연령대 설정
					try
					{
						String ageRange = request.getParameter("agerange");
						int intAge = Integer.parseInt(ageRange);
						
						if(intAge % 10 == 0)
						{
							if((10 <= intAge) && (intAge <= 90))
							{
								System.out.println("연령대 통과");
								dao.updateAgerangeById(""+intAge, m_id);
							}
							else
							{
								System.out.println("연령대가 10 ~ 90 이 아니다.");
								dao.updateAgerangeById("기타", m_id);
							}
						}
						else
						{
							System.out.println("연령대 숫자가 10으로 나눠지지 않는다.");
							dao.updateAgerangeById("기타", m_id);
						}
					}
					catch (Exception e) 
					{
						System.out.println("연령대 기타");
						dao.updateAgerangeById("기타", m_id);
					}
					
					
					//성별 설정 부분
					try
					{
						String gender = request.getParameter("gender");
						if((gender.equals("M")) || (gender.equals("F")))
						{
							System.out.println("성별 통과");
							dao.updateGenderById(gender, m_id);
						}	
						else
						{
							System.out.println("성별 없음");
							dao.updateGenderById("없음", m_id);
						}
					}
					catch (Exception e) 
					{
						System.out.println("성별 없음");
						dao.updateGenderById("없음", m_id);
					}
					
					
					//관심사 설정 부분
					try
					{
						String[] attention = request.getParameterValues("attention");
						String collection = "";
						
						for(int i = 1 ; i <= attention.length ; i++)
						{
							if(((attention[i-1].equals("at1") || attention[i-1].equals("at2")) || (attention[i-1].equals("at3") || attention[i-1].equals("at4"))) || attention[i-1].equals("at5"))
							{
								collection = "[ ";
								
								for(int j = 1 ; j <= attention.length ; j++)
								{
									if(j == attention.length)
									{
										collection = collection + "\"" + attention[j-1] + "\"";
									}
									else
									{
										collection = collection + "\"" + attention[j-1] + "\"" + ", ";
									}
								}
								
								collection = collection + " ]";
							}
							else
							{
								System.out.println("관심사에 이상한 값이 들어있다.");
								collection = "";
								break;
							}
						}
						System.out.println("관심사 통과");
						dao.updateAttentionById(collection, m_id);
					}
					catch (Exception e) 
					{
						System.out.println("관심사 없음");
						dao.updateAttentionById("", m_id);
					}
					
					
					//닉네임 설정 부분
					try
					{
						String m_nickname = request.getParameter("nickname").replaceAll("<script>", "asdasdasdasdasdasd");
						m_nickname = m_nickname.replaceAll("<", "");
						m_nickname = m_nickname.replaceAll(">", "");
						m_nickname = m_nickname.replaceAll(" ", "");
						
						if((1 <= m_nickname.length()) && (m_nickname.length() <= 6))
						{
							System.out.println("닉네임 통과");
							dao.updateNicknameById(m_nickname, m_id);
							response.sendRedirect("person.mypage");
						}
						else
						{
							System.out.println("닉네임이 길이가 1 ~ 6 이 아님");
							response.sendRedirect("error.html");
						}
					}
					catch(Exception e)
					{
						System.out.println("닉네임이 Null");
						response.sendRedirect("error.html");
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
					response.sendRedirect("error.html");
				}
			}
			else if(url.equals("changePw.mypage"))
			{
				request.getRequestDispatcher("/WEB-INF/MypageChangePW.jsp").forward(request, response);
			}
			else if(url.equals("pw.mypage"))
			{
				try
				{
					String pw = request.getParameter("pw").replace("<script>", "asdasdasdasdasdasd");
					String pwc = request.getParameter("pwc").replace("<script>", "asdasdasdasdasdasd");
					
					System.out.println(pw);
					System.out.println(pwc);
					
					if(((6 <= pw.length()) && (pw.length() <= 12)) && ((6 <= pwc.length()) && (pwc.length() <= 12)))
					{
						System.out.println("길이 통과");
						if(pw.equals(pwc))
						{
							System.out.println("문자 일치 통과");
							Pattern p = Pattern.compile("[a-z|A-Z|0-9]", Pattern.CASE_INSENSITIVE);
							Matcher m = p.matcher(pw);
							boolean check = m.find();
							
							if(!check)
							{
								System.out.println("정규식 통과");
								try
								{
									PersonDAO dao = new PersonDAO();
									String changedPW = dao.toSha256(pw);
									
									dao.updatePwById(changedPW, m_id);
									response.sendRedirect("close.html");
								}
								catch(Exception e)
								{
									e.printStackTrace();
									response.sendRedirect("error.html");
								}
							}
							else
							{
								System.out.println("정규식 ERRRRRRROR");
								response.sendRedirect("error.html");
							}
						}
						else
						{
							System.out.println("문자 일치 ERRRRRRROR");
							response.sendRedirect("error.html");
						}
					}
					else
					{
						System.out.println("길이 ERRRRRRROR");
						response.sendRedirect("error.html");
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
					response.sendRedirect("error.html");
				}
			}
			else if(url.equals("changeImg.mypage"))
			{
				request.getRequestDispatcher("/WEB-INF/MypageChangeImg.jsp").forward(request, response);
			}
			else if(url.equals("img.mypage"))
			{
				String rootPath = this.getServletContext().getRealPath("/");
				String filePath = rootPath + "files";
				System.out.println(filePath);
				
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
					FileItem fi = sfu.parseRequest(request).get(0);
					PersonDAO dao = new PersonDAO();	
					
					String src = dao.selectImgById(m_id);
					src = src.substring(10,src.length());
					src = src.substring(0,src.length()-1);
					
					File delFile = new File(rootPath + src);
					if(delFile.exists())
					{
						delFile.delete();
					}
						
					if(fi.getSize() == 0)
					{
						response.sendRedirect("error.html");
					}
					else
					{
						while(true)
						{
							try
							{
								String tmpName = System.currentTimeMillis() + "_" + fi.getName();
								fi.write(new File(filePath + "/" + tmpName));
								
								String file = "<img src=\"/files/"+tmpName+"\">";
								dao.updateImgById(file,m_id);
								
								break;
							}
							catch(org.apache.commons.io.FileExistsException e)
							{
								System.out.println("파일 이름 재설정");
							}
							catch(Exception e)
							{
								e.printStackTrace();
							}
						}
						response.sendRedirect("close.html");
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
					response.sendRedirect("close.html");
				}
				
			}
			else if(url.equals("review.mypage"))
			{
				request.setAttribute("m_id", request.getParameter("m_id"));
				request.setAttribute("c_id", request.getParameter("c_id"));
				request.setAttribute("date", request.getParameter("date"));
				request.setAttribute("title", request.getParameter("title"));
				
				
				System.out.println();
				
				request.getRequestDispatcher("/WEB-INF/MypageWriteReview.jsp").forward(request, response);
			}
			else if(url.equals("writeReview.mypage"))
			{
				try
				{
					ReviewDAO dao = new ReviewDAO();
					DoClassDAO dcdao = new DoClassDAO();
					
					String time = request.getParameter("date");
					
					int year = Integer.parseInt(time.substring(2,4));
					int month = Integer.parseInt(time.substring(5,7));
					int day = Integer.parseInt(time.substring(8,10));
					
					@SuppressWarnings("deprecation")
					Date date = new Date(year, month-1, day);
					
					int c_id = Integer.parseInt(request.getParameter("c_id"));
					String req_m_id = request.getParameter("m_id");
					
					if(dcdao.existCheck(req_m_id, c_id))
					{
						if(m_id.equals(req_m_id))
						{
							if(!dao.overlapReviewCheck(c_id, req_m_id))
							{
								dao.insertReview(request.getParameter("c_id"),
									request.getParameter("m_id"),
									request.getParameter("text").replaceAll("<script>","").replaceAll("<Script>",""), 
									request.getParameter("star"),
									date
									);
								
								response.sendRedirect("close.html");
							}
							else
							{
								System.out.println(" 이미 리뷰를 작성함 ");
								response.sendRedirect("error.html");
							}
						}
						else
						{
							System.out.println("아이디가 이상하다.");
							response.sendRedirect("error.html");
						}
					}
					else
					{
						System.out.println("classdoing에 없다");
						response.sendRedirect("error.html");
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
					response.sendRedirect("error.html");
				}
				
			}
			else if(url.equals("tutor.mypage"))
			{System.out.println("튜터페이지 접속");
				try
				{
					PersonDAO pdao = new PersonDAO();
					PersonDTO pdto = pdao.selectById(m_id);
					MyClassListDTO mydto = new MyClassListDTO();
					MyClassListDAO mydao = new MyClassListDAO();
					MemberDAO mdao = new MemberDAO();
					request.setAttribute("dto", pdto);
					
					
					if(pdto.getM_type().equals("tutor"))
					{
						request.setAttribute("check", "tutor");
					}
					else
					{
						UpgradeDAO udao = new UpgradeDAO();
						Boolean check = udao.selectById(pdto.getM_id());
						request.setAttribute("check", ""+check);
					}
					String id = (String) request.getSession().getAttribute("loginId");
					List<MyClassListDTO>  page = mydao.selectByPage(id);
					request.setAttribute("page",page);
					
					
				String visitorid = (String) request.getSession().getAttribute("loginId");
				if(mdao.selectTypeById(visitorid).equals("tutor")){
					request.getRequestDispatcher("/WEB-INF/ForTutor.jsp").forward(request, response);
				}else{
					request.getRequestDispatcher("/WEB-INF/MypageApplyTutor.jsp").forward(request, response);
				}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
//				request.getRequestDispatcher("/WEB-INF/MypageApplyTutor.jsp").forward(request, response);
//				
//				request.getRequestDispatcher("ForTutor.jsp").forward(request, response);
			}
			else if(url.equals("apply.mypage"))
			{
				try
				{
					String id = request.getParameter("id");
					String nickname = request.getParameter("nickname");
					
					if(id.equals(m_id))
					{
						UpgradeDAO dao = new UpgradeDAO();
						int result = dao.insertNew(id, nickname);
						
						if(result > 0)
						{
							response.sendRedirect("tutor.mypage");
						}
						else
						{
							response.sendRedirect("error.html");
						}
					}
					else
					{
						System.out.println("request 로 넘어온 id 값이 현재 로그인한 id 와 다르다.");
						response.sendRedirect("error.html");
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
					response.sendRedirect("error.html");
				}
			}
			else if(url.equals("leave.mypage"))
			{
				try
				{
					String id = request.getParameter("id");
					String pw = request.getParameter("pw");
					if(id.equals(m_id))
					{
						
							PersonDAO dao = new PersonDAO();
							int result = dao.deleteById(id, dao.toSha256(pw));
							
							if(result > 0)
							{
								System.out.println("회원 탈퇴 완료");
								request.getSession().invalidate();
								response.sendRedirect("start.main");
							}
							else
							{
								System.out.println("DB 삭제 중 오류");
								response.sendRedirect("error.html");
							}
					}
					else
					{
						System.out.println("세션의 아이디와 req로 넘어온 아이디가 다르다");
						response.sendRedirect("error.html");
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
					response.sendRedirect("error.html");
				}
			}
			else if(url.equals("kakaoleave.mypage"))
			{
				try
				{
					String id = request.getParameter("id");
					String type = (String)request.getSession().getAttribute("loginType");
					
					if(id.equals(m_id))
					{
						if(type.equals("kakao"))
						{
							PersonDAO dao = new PersonDAO();
							int result = dao.deleteKakao(id);
								
							if(result > 0)
							{
								System.out.println("회원 탈퇴 완료");
								request.getSession().invalidate();
								response.sendRedirect("start.main");
							}
							else
							{
								System.out.println("DB 삭제 중 오류");
								response.sendRedirect("error.html");
							}
						}
						else
						{
							System.out.println("회원 타입이 카카오가 아니다.");
							response.sendRedirect("error.html");
						}
					}
					else
					{
						System.out.println("세션의 아이디와 req로 넘어온 아이디가 다르다");
						response.sendRedirect("error.html");
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
					response.sendRedirect("error.html");
				}
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}
	
}
