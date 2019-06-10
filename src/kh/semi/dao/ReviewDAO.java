package kh.semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.semi.dto.ReviewDTO;

public class ReviewDAO
{
	private DataSource ds;

	public ReviewDAO() throws Exception
	{
		Context ctx = new InitialContext();
		Context compenv = (Context)ctx.lookup("java:/comp/env");
		this.ds = (DataSource)compenv.lookup("jdbc");
	}

	public Connection getConnection() throws Exception
	{
		return ds.getConnection();
	}

	public int insertReview(String c_id, String m_id, String contents, String star, Date date) throws Exception
	{
		String sql = "insert into REVIEW values(re_seq_seq.nextval, ?, ?, ?, ?, ?, default, default)";
		try
		(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				)
		{
			pstat.setString(1, c_id);
			pstat.setString(2, m_id);
			pstat.setString(3, contents);
			pstat.setString(4, star);
			pstat.setDate(5, date);

			int result = pstat.executeUpdate();
			con.commit();

			return result;
		}
	}
	public List<ReviewDTO> selectAll(int start, int end, int classId) throws Exception{
		String sql = "select * from (select row_number() over(order by re_seq desc) as rown, review.* from review where re_classid = ?) where rown between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setInt(1, classId);
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			ResultSet rs = pstat.executeQuery();

			List<ReviewDTO> list = new ArrayList<>();

			while(rs.next()) {
				int re_seq = rs.getInt("RE_SEQ");
				int re_classId = rs.getInt("RE_CLASSID");
				String re_userId = rs.getString("RE_USERID");
				String re_review = rs.getString("RE_REVIEW");
				String star = rs.getString("RE_STAR");
				String re_star = this.viewStar(star);
				Date re_date = rs.getDate("RE_DATE");
				Date re_writeDate = rs.getDate("RE_WRITEDATE");
				int re_like = rs.getInt("RE_LIKE");

				ReviewDTO dto = new ReviewDTO(re_seq, re_classId, re_userId, re_review, re_star, re_date, re_writeDate, re_like);
				list.add(dto);
			}
			return list;
		}
	}

	// 별점 보여주기
	public String viewStar(String star) {
		String result="";
		if(star.contentEquals("1")) {
			result = "★☆☆☆☆";
		}else if(star.contentEquals("2")) {
			result = "★★☆☆☆";
		}else if(star.contentEquals("3")) {
			result = "★★★☆☆";
		}else if(star.contentEquals("4")) {
			result = "★★★★☆";
		}else if(star.contentEquals("5")) {
			result = "★★★★★";

		}else {
			result =  "";
		}
		return result;
	}


	public int boardCount(int classId)throws Exception {
		String sql="select count(*) from review where re_classId = ?";
		int result = 0;
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, classId);
			ResultSet rs = pstat.executeQuery();
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}
			return result;
		}
	}

	public String getNavi(int currentPage, int recordTotalCount, int recordCountPerPage, int classId) {

		int naviCountPerPage = 5;

		int pageTotalCount=0;

		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}


		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}


		int startNavi = (currentPage -1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage-1);
		// 현재 위치에 따른 네비 시작과 끝을 구하기

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		//네비 끝값이 최대 페이지 번호를 넘어가면 최대 페이지번호로 네비 끝값을 설정한다.

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev=false;
		}

		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();
		if(needPrev) {
			int prev = startNavi -1;
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='index.review?classId="+ classId + "&currentPage=" + prev +"'>Previous</a></li>");
		}

		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='index.review?classId="+ classId + "&currentPage=" + i +"'>"+ i + " " +"</a></li>");
		}
		if(needNext) {
			int next = endNavi + 1;
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='index.review?classId="+ classId +"&currentPage=" + next +"'>Next</a></li>");
		}
		System.out.println(sb);
		return sb.toString();
	}

	public int clickLike(int seq, String loginId)throws Exception{
		String sql = "insert into likes values(?, ?)";
		try
		(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				)
		{
			pstat.setInt(1, seq);
			pstat.setString(2, loginId);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int countLike(int re_seq)throws Exception {
		String sql = "select * from review where RE_SEQ = ?";
		int result = 0;
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setInt(1, re_seq);
			ResultSet rs = pstat.executeQuery();
			while(rs.next()) {
				result = rs.getInt("RE_LIKE");
			}
			return result;
		}
	}
	
	public void updateLike(int re_seq, int countLike)throws Exception {
		String sql = "update review set RE_LIKE = ? where RE_SEQ = ?";
		try( 
				Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);
				){ 
			pstat.setInt(1, ++countLike); 
			pstat.setInt(2, re_seq); 
			pstat.executeUpdate();
			con.commit(); 
		}
	}
	
	//클래스 평균 별점 업데이트
	public int updateAveStar(int Star, int classId)throws Exception {
		String sql= "UPDATE classinfo SET INFO_AVGSTAR = ? WHERE INFO_CLASSID = ?";
		
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				)
			{
			pstat.setInt(1, Star);
			pstat.setInt(2, classId);
			con.commit();
			int result = pstat.executeUpdate();
			if(result>0) {
				System.out.println("별점 업데이트 성공");
			}else {
				System.out.println("별점 업데이트 실패");
			}
			return result;
		}
	
	}
	
	//평균 별점 구하기
	public int aveStar(int classId)throws Exception{
		// 선택한 클래스에 작성된 리뷰에서 뽑은 별점들
		String sql = "select re_star from review where re_classId = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, classId);
			ResultSet rs = pstat.executeQuery();
			
			List<ReviewDTO> starList = new ArrayList<>();
			int sum = 0;
			while(rs.next()) {
				String re_star = rs.getString("RE_STAR");
				ReviewDTO dto = new ReviewDTO(re_star);
				starList.add(dto);
			}
			  for(int i = 0; i < starList.size(); i++) { 
				  int star = Integer.parseInt(starList.get(i).getStar());
				  sum =sum + star; 
			  }
			  if(sum==0) {
				  return 0;
			  }else {
					int aveStar =  sum / starList.size();
					return aveStar;
			  }
		}
	}

	
	public boolean overlapCheck(int seq, String id) throws Exception
	{
		String sql = "select * from likes where l_seq = ? and l_userid = ?";
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setInt(1, seq);
			pstat.setString(2, id);
			try
			(
				ResultSet rs = pstat.executeQuery();
			)
			{
				return rs.next();
			}
		}
	}
	public boolean overlapReviewCheck(int classid, String id) throws Exception
	{
		String sql = "select * from REVIEW where re_classid = ? and re_userid = ?";
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setInt(1, classid);
			pstat.setString(2, id);
			try
			(
				ResultSet rs = pstat.executeQuery();
			)
			{
				return rs.next();
			}
		}
	}
	
	public boolean checkReview(int classId) throws Exception{
		String sql = "select * from review where re_classId = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, classId);
			ResultSet rs = pstat.executeQuery();
			return rs.next();
		}
	}
}
