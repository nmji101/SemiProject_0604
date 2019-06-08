package kh.semi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.semi.dto.ClassInfoDTO;
import kh.semi.dto.MyClassListDTO;

public class MyClassListDAO {
<<<<<<< HEAD

=======
	MyClassListDTO mydto = new MyClassListDTO();
>>>>>>> fe997f9d8a62429d45d7b2bafd0fdcc458fa7b9d
	ClassInfoDTO dto = new ClassInfoDTO();
	
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "semi";
		String pw = "semi";
		return DriverManager.getConnection(url,user,pw);
	}
	

	
	public List<MyClassListDTO> selectByPage(String info_tutorid) throws Exception{
		String sql = "select *  from ( select row_number() over(order by info_classid desc)as num, classinfo.* from classinfo) where info_tutorid = ? ";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				
				){
			List<MyClassListDTO> page = new ArrayList<>();
			pstat.setString(1, info_tutorid);
			ResultSet rs = pstat.executeQuery();
		
			while(rs.next()) {//DB에서 목록 다 끌어야하니까 while
				String info_category = rs.getString("info_category");
				String info_title = rs.getString("info_title");
<<<<<<< HEAD
				int info_classid = rs.getInt("info_classid");
				String info_date = rs.getString("info_date");
				MyClassListDTO listdto = new MyClassListDTO(info_category,info_title,info_date,info_classid);
=======
				String info_explain = rs.getString("info_explain");
				String info_date = rs.getString("info_date");
				MyClassListDTO listdto = new MyClassListDTO(info_category,info_title,info_explain,info_date);
>>>>>>> fe997f9d8a62429d45d7b2bafd0fdcc458fa7b9d
				page.add(listdto);
			}
			return page;
		}
	}
	
	public int countBoard() throws Exception{//테이블 board의  갯수 return 메서드
		String sql = "select count(*) aa from classinfo";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt("aa");
		}
	}
	

	
	public String getNavi(int currentPage) throws Exception {//게시판 네비
		//new BoardDAO().countBoard();
		int recordTotalCount = new MyClassListDAO().countBoard(); //전체 글 갯수
		int recordCountPerPage = 10; //한 페이지당 글 갯수
		int naviCountPerPage = 10;	// 한 페이지에 네비게이터 갯수
		int pageTotalCount = 10; //총 페이지 갯수

		
		if(recordTotalCount%recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount/recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount/recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage=1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = (currentPage -1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi+ (naviCountPerPage - 1) ;//무작정 9를 더하지 말자

		if(endNavi> pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi ==1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}//boolean값으로 판단만 하기
		StringBuilder sb = new StringBuilder();
		if(needPrev) {
			sb.append("<이전 ");
		}
		for(int i = startNavi;i<=endNavi;i++) {
			sb.append("<a href='goboard.board?currentPage="+i+"'>"+i+" "+"</a>");
		}
		if(needNext) {
			sb.append("다음>");
		}
		return sb.toString();
	}//게시판 네비 끝
	
	
}
