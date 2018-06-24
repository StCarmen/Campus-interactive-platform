package Impl;

import DBConfig.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserImpl {
	public static boolean login(String username,String password) {
		//实际应用时应该通过查询数据库得到结果
		String sql="select * from users " +
				"where (passwd like \""+password+"\") and (username like \""+username+"\") ;";
		DBConnector d=new DBConnector();
		try
		{
			if(d.excuteQuery(sql).next())
			{
				return true;
			}
			else
			{
				return false;
			}
		}catch(Exception err){}
		
		
		return false;
			
			
	}
	public static boolean register(String username,String password) {
		String findmax="select id from users order by id DESC;";
		DBConnector d=new DBConnector();
		ResultSet re=d.excuteQuery(findmax);
		try {
			re.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int max = 0;
		try {
			max = re.getInt("id");
			System.out.print(max);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		max++;
		String s=String.valueOf(max);
		String sql="INSERT INTO users (id, passwd, username) VALUES ("+s+",\'"+password+"\',\'"+username+"\');";
		DBConnector a=new DBConnector();
		if(a.execute(sql))
		{
			return true;

		}
		return false;
				
	}
}