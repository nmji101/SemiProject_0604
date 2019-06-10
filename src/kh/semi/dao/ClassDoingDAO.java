package kh.semi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.semi.dto.ClassDoingDTO;

public class ClassDoingDAO {
	private DataSource ds;
	
	public ClassDoingDAO() throws Exception
	{
		Context ctx = new InitialContext();
		Context compenv = (Context)ctx.lookup("java:/comp/env");
		this.ds = (DataSource)compenv.lookup("jdbc");
	}
	
	public Connection getConnection() throws Exception
	{
		return ds.getConnection();
	}
	
	public int insertClassDoing(ClassDoingDTO dto) throws Exception{
		String sql = "insert into classdoing values(do_seq_seq.nextval,?,?,default,default,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setInt(1, dto.getDo_classid());
				pstat.setString(2, dto.getDo_userid());
				pstat.setString(3, dto.getDo_date());
				
				int result = pstat.executeUpdate();
				con.commit();
				return result;		
		}
	}	
}
