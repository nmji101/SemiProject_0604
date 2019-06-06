package kh.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.semi.dto.DoClassDTO;
import kh.semi.dto.NoticeDTO;

public class NoticeDAO
{
	private DataSource ds;
	
	public NoticeDAO() throws Exception
	{
		Context ctx = new InitialContext();
		Context compenv = (Context)ctx.lookup("java:/comp/env");
		this.ds = (DataSource)compenv.lookup("jdbc");
	}
	
	public Connection getConnection() throws Exception
	{
		return ds.getConnection();
	}
	
	public int insertNew(String writer, String title, String contents) throws Exception
	{
		String sql = "insert into notice values(no_seq_seq.nextval, ?, ?, ?, default)";
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setString(1, writer);
			pstat.setString(2, title);
			pstat.setString(3, contents);

			int result = pstat.executeUpdate();
			con.commit();

			return result;
		}
	}
	public List<NoticeDTO> selectList(int page) throws Exception
	{
		String sql = "select * from (select row_number() over(order by no_seq) as rown, notice.* from notice) WHERE ROWN BETWEEN ? and ?";

		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setInt(1, page * 3 - 2);
			pstat.setInt(2, page * 3);
			try
			(
				ResultSet rs = pstat.executeQuery();
			)
			{
				while(rs.next())
				{
					list.add(new NoticeDTO());
				}
				
				return list;
			}
		}
	}
}
