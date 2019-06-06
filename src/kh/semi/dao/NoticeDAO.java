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
		String sql = "select * from (select row_number() over(order by no_seq desc) as rown, notice.* from notice) WHERE ROWN BETWEEN ? and ?";

		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setInt(1, page * 10 - 9);
			pstat.setInt(2, page * 10);
			try
			(
				ResultSet rs = pstat.executeQuery();
			)
			{
				while(rs.next())
				{
					list.add(new NoticeDTO(rs.getInt("no_seq"), rs.getString("no_writer"), rs.getString("no_title"), rs.getString("no_contents"), rs.getDate("no_time")));
				}
				
				return list;
			}
		}
	}
	public int selectCount() throws Exception
	{
		String sql = "select count(*) from notice";
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			ResultSet rs = pstat.executeQuery();
		)
		{
			if(rs.next())
			{
				int count = rs.getInt("count(*)");
				return count;
			}
			else
			{
				return 0;
			}
		}
	}
	public NoticeDTO selectDetail(int seq) throws Exception
	{
		String sql = "select * from notice where no_seq = ?";
			
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setInt(1, seq);
			try
			(
				ResultSet rs = pstat.executeQuery();
			)
			{
				if(rs.next())
				{
					return new NoticeDTO(rs.getInt("no_seq"), rs.getString("no_writer"), rs.getString("no_title"), rs.getString("no_contents"), rs.getDate("no_time"));
				}
				return null;
			}
		}
	}
}
