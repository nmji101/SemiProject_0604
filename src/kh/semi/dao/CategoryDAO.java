package kh.semi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.semi.dto.CategoryDTO;

public class CategoryDAO {

	private DataSource ds;
	
	public CategoryDAO() throws Exception
	{
		Context ctx = new InitialContext();
		Context compenv = (Context)ctx.lookup("java:/comp/env");
		this.ds = (DataSource)compenv.lookup("jdbc");
	}
	
	public Connection getConnection() throws Exception
	{
		return ds.getConnection();
	}


   public List<CategoryDTO> getInfoBySelect(String select, int start, int end) throws Exception {
      String sql = "select row_number() over(order by "+select+") as rown, info_classid, info_title, "
            + "info_addr2, info_avgstar, info_price, info_img1, info_img2, info_img3 from (select row_number() over(order by "+select+") as rown, classinfo.* from classinfo) where rown between ? and ?";
      Connection con = this.getConnection();   
      PreparedStatement pstat = con.prepareStatement(sql);
      //pstat.setString(1, select);      
      pstat.setInt(1, start);
      pstat.setInt(2, end);
      ResultSet rs = pstat.executeQuery();
      List<CategoryDTO> list = new ArrayList<>();
      while(rs.next()) {
         CategoryDTO dto = new CategoryDTO();
         dto.setInfo_title(rs.getString("info_title"));
         dto.setInfo_addr2(rs.getString("info_addr2"));
         dto.setInfo_avgstar(rs.getString("info_avgstar"));
         dto.setInfo_price(rs.getInt("info_price"));
         dto.setInfo_img1(rs.getString("info_img1"));
         dto.setInfo_img2(rs.getString("info_img2"));
         dto.setInfo_img3(rs.getString("info_img3"));
         int classid = rs.getInt("info_classid");
         dto.setInfo_classid(classid);
         //�� �����ο� set
         int count = this.getTotalForCategory(classid);
         dto.setTotalcount(count);

         //Ʃ������ set
         String[] tutor = this.getTutorInfoForCategory(classid);
         dto.setM_nickname(tutor[0]);
         dto.setM_photo(tutor[1]);

         list.add(dto);
      }
      rs.close();
      con.close();
      return list;
   }

   public List<CategoryDTO> getInfoByCategory(String select, String category, int start, int end) throws Exception {
      String sql = "select row_number() over(order by "+ select +") as rown, info_classid, info_title, info_addr2, info_avgstar, info_price, info_img1, info_img2, info_img3 from (select row_number() over(order by "+ select +") as rown, classinfo.* "
            + "from classinfo where info_category= ? ) where rown between ? and ? ";
      Connection con = this.getConnection();   
      PreparedStatement pstat = con.prepareStatement(sql);
      System.out.println(category);
      pstat.setString(1, category);
      pstat.setInt(2, start);
      pstat.setInt(3, end);
      ResultSet rs = pstat.executeQuery();
      List<CategoryDTO> list = new ArrayList<>();
      while(rs.next()) {      
         CategoryDTO dto = new CategoryDTO();
         dto.setInfo_title(rs.getString("info_title"));
         dto.setInfo_addr2(rs.getString("info_addr2"));
         dto.setInfo_avgstar(rs.getString("info_avgstar"));
         dto.setInfo_price(rs.getInt("info_price"));
         dto.setInfo_img1(rs.getString("info_img1"));
         dto.setInfo_img2(rs.getString("info_img2"));
         dto.setInfo_img3(rs.getString("info_img3"));

         int classid = rs.getInt("info_classid");   
         dto.setInfo_classid(classid);
         int count = this.getTotalForCategory(classid);
         dto.setTotalcount(count);

         String[] tutor = this.getTutorInfoForCategory(classid);
         dto.setM_nickname(tutor[0]);
         dto.setM_photo(tutor[1]);

         list.add(dto);   
      }
      con.close();
      return list;
   }


   public List<CategoryDTO> getInfoByLocation1(String select, String addr, int start, int end) throws Exception {
      String sql = "select row_number() over(order by "+ select +") as rown, info_classid, info_title, info_addr2, info_avgstar, info_price, info_img1, info_img2, info_img3 from (select row_number() over(order by "+select+") as rown, classinfo.* "
            + "from classinfo where info_addr2 like ?)  where rown between ? and ?";
      Connection con = this.getConnection();   
      PreparedStatement pstat = con.prepareStatement(sql);
      pstat.setString(1, "%"+addr+"%");
      pstat.setInt(2, start);
      pstat.setInt(3, end);
      ResultSet rs = pstat.executeQuery();
      List<CategoryDTO> list = new ArrayList<>();
      while(rs.next()) {
         CategoryDTO dto = new CategoryDTO();
         dto.setInfo_title(rs.getString("info_title"));
         dto.setInfo_addr2(rs.getString("info_addr2"));
         dto.setInfo_avgstar(rs.getString("info_avgstar"));
         dto.setInfo_price(rs.getInt("info_price"));
         dto.setInfo_img1(rs.getString("info_img1"));
         dto.setInfo_img2(rs.getString("info_img2"));
         dto.setInfo_img3(rs.getString("info_img3"));

         int classid = rs.getInt("info_classid");
         dto.setInfo_classid(classid);
         //�� �����ο� set
         int count = this.getTotalForCategory(classid);
         dto.setTotalcount(count);
         //Ʃ������ set
         String[] tutor = this.getTutorInfoForCategory(classid);
         dto.setM_nickname(tutor[0]);
         dto.setM_photo(tutor[1]);

         list.add(dto);
      }
      con.close();
      return list;
   }
   
   public List<CategoryDTO> getInfoByLocation2(String select, String addr1, String addr2, int start, int end) throws Exception {
	      String sql = "select row_number() over(order by "+ select +") as rown, info_classid, info_title, info_addr2, info_avgstar, info_price, info_img1, info_img2, info_img3 from (select row_number() over(order by "+select+") as rown, classinfo.* "
	            + "from classinfo where info_addr2 like ? or info_addr2 like ?)  where rown between ? and ?";
	      Connection con = this.getConnection();   
	      PreparedStatement pstat = con.prepareStatement(sql);
	      pstat.setString(1, "%"+addr1+"%");
	      pstat.setString(2, "%"+addr2+"%");
	      pstat.setInt(3, start);
	      pstat.setInt(4, end);
	      ResultSet rs = pstat.executeQuery();
	      List<CategoryDTO> list = new ArrayList<>();
	      while(rs.next()) {
	         CategoryDTO dto = new CategoryDTO();
	         dto.setInfo_title(rs.getString("info_title"));
	         dto.setInfo_addr2(rs.getString("info_addr2"));
	         dto.setInfo_avgstar(rs.getString("info_avgstar"));
	         dto.setInfo_price(rs.getInt("info_price"));
	         dto.setInfo_img1(rs.getString("info_img1"));
	         dto.setInfo_img2(rs.getString("info_img2"));
	         dto.setInfo_img3(rs.getString("info_img3"));

	         int classid = rs.getInt("info_classid");
	         dto.setInfo_classid(classid);
	         //�� �����ο� set
	         int count = this.getTotalForCategory(classid);
	         dto.setTotalcount(count);
	         //Ʃ������ set
	         String[] tutor = this.getTutorInfoForCategory(classid);
	         dto.setM_nickname(tutor[0]);
	         dto.setM_photo(tutor[1]);

	         list.add(dto);
	      }
	      con.close();
	      return list;
	   }


   public int getTotalForCategory(int classId) throws Exception {
      String sql = "select count(*) from ClassDoing where do_classId=?";
      Connection con = this.getConnection();
      PreparedStatement pstat = con.prepareStatement(sql);

      pstat.setInt(1, classId);
      ResultSet rs = pstat.executeQuery();
      int result = 0;
      if(rs.next()) {
         result = rs.getInt(1);
      }
      con.close();
      return result;
   }

   public String[] getTutorInfoForCategory(int classID) throws Exception {
      String sql = "select m_nickname, m_photo from ClassInfo, Member where info_tutorId = m_id and info_classid=?";
      Connection con = this.getConnection();
      PreparedStatement pstat = con.prepareStatement(sql);

      pstat.setInt(1, classID);
      ResultSet rs = pstat.executeQuery();
      String[] arr = new String[2];
      if(rs.next()) {
         arr[0] = rs.getString(1);
         arr[1] = rs.getString(2);
      }
      con.close();
      return arr;
   }

   public int recordTotalCount() throws Exception {
      String sql = "select count(*) from classinfo";
      Connection con = this.getConnection();
      PreparedStatement pstat = con.prepareStatement(sql);
      ResultSet rs = pstat.executeQuery();
      int result = 0;
      if(rs.next()) {
         result = rs.getInt(1);
      }
      con.close();
      return result;
   }

   public int getTotalByMenu(String coloumn, String value) throws Exception {
      String sql = "select count(*) from classinfo where "+ coloumn +" like ?";
      Connection con = this.getConnection();   
      PreparedStatement pstat = con.prepareStatement(sql);
      pstat.setString(1, "%"+value+"%");   
      ResultSet rs = pstat.executeQuery();
      int result = 0;
      while(rs.next()) {
         result = rs.getInt(1);
      }
      con.close();
      return result;
   }

   public int getTotalByMenu2(String coloumn1, String value1, String coloumn2, String value2) throws Exception {
	      String sql = "select count(*) from classinfo where "+ coloumn1 +" like ? or " + coloumn2 + " like ?";
	      Connection con = this.getConnection();   
	      PreparedStatement pstat = con.prepareStatement(sql);
	      pstat.setString(1, "%"+value1+"%");
	      pstat.setString(2, "%"+value2+"%");   
	      ResultSet rs = pstat.executeQuery();
	      int result = 0;
	      while(rs.next()) {
	         result = rs.getInt(1);
	      }
	      con.close();
	      return result;
	   }
   
   public static int recordCountPerPage = 6; 
   public static int pageTotalCount = 0;
   public static int startNavi = 0;
   public static int endNavi = 0;
   public List<String> getNavi(int currentPage, int recordTotalCount) throws Exception {
      System.out.println("레코드토탈카운트:"+recordTotalCount);
      int naviCountPerPage = 3;   
      int pageTotalCount = 0; 
      if(recordTotalCount % recordCountPerPage == 0) {
         pageTotalCount = recordTotalCount / recordCountPerPage;
      }else{
         pageTotalCount = recordTotalCount / recordCountPerPage + 1 ;
      }

      if(currentPage < 1) {
         currentPage = 1;
      }else if(currentPage > pageTotalCount) {
         currentPage = pageTotalCount;
      }
      startNavi = (currentPage-1)/naviCountPerPage*naviCountPerPage+1; 
      endNavi = startNavi + (naviCountPerPage-1);

      if(endNavi>pageTotalCount) {
         endNavi = pageTotalCount;
      }
      //      System.out.println("현재 페이지 : " + currentPage);
      //      System.out.println("시작 : " + startNavi);
      //      System.out.println("끝 : " + endNavi);

      boolean needPrev = true;
      boolean needNext = true;

      if(startNavi == 1) {
         needPrev = false;
      }

      if(endNavi == pageTotalCount) {
         needNext = false;
      }
      List<String> list = new ArrayList<String>();
      if(needPrev) {
         list.add("◀ 이전");
      }
      for(int i = startNavi ; i <= endNavi ; i++) {
         list.add(i+"");
      }
      if(needNext) {
         list.add("다음 ▶");
      }
      return list;
   }

   /**
    * 검색단어에 맞는 list return.
    * @param searchParam
    * @return
    * @throws Exception
    */
   public List<CategoryDTO> searchCategoryByWord(int start , int end , String searchParam ) throws Exception{
      String sql = "select row_number() over(order by info_avgstar desc) as rown, info_classid, info_title, "
            + "info_addr2, info_avgstar, info_price, info_img1, info_img2, info_img3 "
            + "from (select row_number() over(order by info_avgstar desc) as rown, classinfo.* from classinfo) where rown between ? and ? and info_title like ? or info_explain like ? ";
      ResultSet rs = null;
      try(
            Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql);
            ){
         pstat.setInt(1, start);
         pstat.setInt(2, end);
         pstat.setString(3, "%"+searchParam+"%");
         pstat.setString(4, "%"+searchParam+"%");

         rs = pstat.executeQuery();
         List<CategoryDTO> list = new ArrayList<>();
         while(rs.next()) {
            CategoryDTO dto = new CategoryDTO();
            dto.setInfo_title(rs.getString("info_title"));
            dto.setInfo_addr2(rs.getString("info_addr2"));
            dto.setInfo_avgstar(rs.getString("info_avgstar"));
            dto.setInfo_price(rs.getInt("info_price"));
            dto.setInfo_img1(rs.getString("info_img1"));
            dto.setInfo_img2(rs.getString("info_img2"));
            dto.setInfo_img3(rs.getString("info_img3"));

            int classid = rs.getInt("info_classid");   
            dto.setInfo_classid(classid);

            int count = this.getTotalForCategory(classid);
            dto.setTotalcount(count);

            String[] tutor = this.getTutorInfoForCategory(classid);
            dto.setM_nickname(tutor[0]);
            dto.setM_photo(tutor[1]);

            list.add(dto);
         }
         return list;
      }finally {
         if(rs!=null) {
            rs.close();
         }
      }
   }


   public int getTotalBySearch(String searchParam) throws Exception {
      String sql = "select count(*) from classinfo where info_title like ? or info_explain like ?";
      ResultSet rs = null;
      try(
            Connection con = this.getConnection();   
            PreparedStatement pstat = con.prepareStatement(sql);
            ){
         pstat.setString(1, "%"+searchParam+"%");   
         pstat.setString(2, "%"+searchParam+"%");
         rs = pstat.executeQuery();
         int result = 0;
         if(rs.next()) {
            result = rs.getInt(1);
         }
         return result;
      }finally {
         if(rs!=null) {
            rs.close();
         }
      }
   }


   


}