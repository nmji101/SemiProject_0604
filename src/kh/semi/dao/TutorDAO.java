package kh.semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kh.semi.dto.ClassInfoDTO;
import kh.semi.dto.UfileDTO;

public class TutorDAO {
	ClassInfoDTO dto = new ClassInfoDTO();
	UfileDAO udao = new UfileDAO();
	UfileDTO udto = new UfileDTO();
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "semi";
		String pw = "semi";
		return DriverManager.getConnection(url,user,pw);
	}
	

	public ClassInfoDTO content(int num) throws Exception{ //클래스 수정하려고 제목 클릭
		String sql = "select * from classinfo where info_classid=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, num);
			ResultSet rs = pstat.executeQuery();
			if(rs.next()) {
				dto.setInfo_classid(rs.getInt("info_classid"));
				dto.setInfo_tutorid(rs.getString("info_tutorid"));
				dto.setInfo_category(rs.getString("info_category"));
				dto.setInfo_title(rs.getString("info_title"));
				dto.setInfo_explain(rs.getString("info_explain"));
				dto.setInfo_intro(rs.getString("info_intro"));
				dto.setInfo_addr1(rs.getString("info_addr1"));
				dto.setInfo_addr2(rs.getString("info_addr2"));
				dto.setInfo_addr3(rs.getString("info_addr3"));
				dto.setInfo_addr4(rs.getString("info_addr4"));
				
				dto.setInfo_maxperson(rs.getInt("info_maxperson"));
				dto.setInfo_price(rs.getInt("info_price"));
				dto.setInfo_start(rs.getString("info_start"));
				dto.setInfo_end(rs.getString("info_end"));
				dto.setInfo_date(rs.getString("info_date"));
	}return dto;
		}
	}

	
	
	public int delete(int info_classid) throws Exception{//게시글 삭제하기
		String sql = "delete from classinfo where info_classid=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, info_classid);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public int update(int num, ClassInfoDTO dto) throws Exception{//클래스 수정하기 버튼 클릭
		String sql = "update classinfo set info_category = ?, info_title = ?, info_explain = ?, info_addr1=?,info_addr2=?,info_addr3=?,info_addr4=?,"
				+ "info_maxperson=?, info_price=?, info_start=?, info_end=? where info_classid=?";
		
	  
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			  //pstat.setString(1, dto.getInfo_tutorid());//1번 튜터아이디
		      pstat.setString(1, dto.getInfo_category());//2번 카테고리
		      pstat.setString(2, dto.getInfo_title());//3번 타이틀
		      pstat.setString(3, dto.getInfo_explain());//4번 클래스설명
		     // pstat.setString(5, dto.getInfo_intro());//5번 튜터소개
		      pstat.setString(4, dto.getInfo_addr1()); //6번 우편번호
		      pstat.setString(5, dto.getInfo_addr2());//7번 도로명
		      pstat.setString(6, dto.getInfo_addr3());//8번 지번
		      pstat.setString(7, dto.getInfo_addr4());//9번 상세주소
		      pstat.setInt(8,  dto.getInfo_maxperson());//10번 희망인원
		      pstat.setInt(9,  dto.getInfo_price());//11번 희망금액
		      //pstat.setString(12, dto.getInfo_img1());//12번 이미지1
		      //pstat.setString(13,  dto.getInfo_img2());//13번 이미지2
		     // pstat.setString(14,  dto.getInfo_img3());//14번 이미지3
		      pstat.setString(10, dto.getInfo_start());//15번 시작날짜
		      pstat.setString(11, dto.getInfo_end());//16번 끝 날짜
		      pstat.setInt(12, num);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	   public int test(ClassInfoDTO dto)    throws Exception{ 
		      //                                                                                    1,2,3,4,5,6,7,8,9, 10,11
		      String sql = "insert into classinfo values(info_classid_seq.nextval,?,?,?,?,?,?,?, ?,?, ?, ?, "
		      //        12,13,14,15,16,     17        18      19
		            + " ?,  ?, ?, ?, ? , default,default,default)";
		      Connection con = this.getConnection();
		      PreparedStatement pstat = con.prepareStatement(sql);
		      
		   
		      pstat.setString(1, dto.getInfo_tutorid());//1번 튜터아이디
		      pstat.setString(2, dto.getInfo_category());//2번 카테고리
		      pstat.setString(3, dto.getInfo_title());//3번 타이틀
		      pstat.setString(4, dto.getInfo_explain());//4번 클래스설명
		      pstat.setString(5, dto.getInfo_intro());//5번 튜터소개
		      pstat.setString(6, dto.getInfo_addr1()); //6번 우편번호
		      pstat.setString(7, dto.getInfo_addr2());//7번 도로명
		      pstat.setString(8, dto.getInfo_addr3());//8번 지번
		      pstat.setString(9, dto.getInfo_addr4());//9번 상세주소
		      pstat.setInt(10,  dto.getInfo_maxperson());//10번 희망인원
		      pstat.setInt(11,  dto.getInfo_price());//11번 희망금액
		      pstat.setString(12, dto.getInfo_img1());//12번 이미지1
		      pstat.setString(13,  dto.getInfo_img2());//13번 이미지2
		      pstat.setString(14,  dto.getInfo_img3());//14번 이미지3
		      pstat.setString(15, dto.getInfo_start());//15번 시작날짜
		      pstat.setString(16, dto.getInfo_end());//16번 끝 날짜
//		      pstat.setString(17, dto.getInfo_date());//17번 클래스 등록일
//		      pstat.setString(18, dto.getInfo_avgstar());//18번 별점통계
//		      pstat.setInt(19, dto.getInfo_click());//19번 조회수
		      
		      int result = pstat.executeUpdate();
		      con.commit();
		      con.close();
		      return result;    
		   }
	
	
	
}
