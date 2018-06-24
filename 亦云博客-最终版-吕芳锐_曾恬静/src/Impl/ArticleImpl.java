package Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.mysql.fabric.xmlrpc.base.Data;

import Bean.Article;
import DBConfig.DBConnector;


public class ArticleImpl {
	public static boolean addArticle(String title,String content,int userid) throws SQLException {
		
		Data d = new Data();  
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		 String now = df.format(d); 
		 
		 
		 
		 DBConnector d1=new DBConnector();
		 String sql="SELECT count(*) a FROM yiyun.article";
		ResultSet re=d1.excuteQuery(sql);	
		 re.next();
		int num=re.getInt("a")+1;
		
		
		 sql= " insert into  yiyun.article values("+num+",\""+title+"\""+content+"\",\"" +userid+",\""+now+ "\",0,0)";
		 System.out.println(sql);
		 re=d1.excuteQuery(sql);
		 
		return true;
	}
	
	public static boolean addComments(String username,String comments,String articleid,String publishtime,String userid) {
		
		String sql="INSERT INTO discuss (userid, articleid, content,publishtime,username) VALUES (\'"+userid+"\', \'"+articleid+"\', \'"+comments+"\',\'"+publishtime+"\',\'"+userid+"\');";
		DBConnector d=new DBConnector();
		if(d.execute(sql))
		{
			return true;
		}
		return false;

	}	
	
	
	//根据个数num获取文章的数目，进行排序后返回
	public static Article[] getArticles(int num) {
		Article[] as = new Article[num];
		for(int i=0;i<as.length;i++) {
			as[i]= new Article();
			as[i].setTitle("title"+i);
			as[i].setContent("content"+i);
		}
		
		//这里通过一系列排序规则进行排序。
		//目前阶段建议你们别用java进行数组排序
		//可以sql语句中使用一些语句进行排序，如 order by。
		
		DBConnector d=new DBConnector();
		String sql="select * from article order by id";
		
		ResultSet re=d.excuteQuery(sql);
		
		
		for(int i=0;i<as.length;i++) {
			try {
				re.next();
				as[i].setTitle(re.getString("title"));
				as[i].setContent(re.getString("content"));
				as[i].setClick(re.getString("click"));
				as[i].setId(re.getInt("id"));
				as[i].setPublishtime(re.getString("publishtime"));
				as[i].setUserid(re.getInt("userid"));
				as[i].setUsername(re.getString("username"));
				as[i].setFlag(re.getInt("flag"));
				
				System.out.println(as[i].getUsername()); 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return as;
	}
	//根据个数num获取文章的数目,key是关键字，sort是排序方法，默认0；进行排序后返回
		public static Article[] getArticles(String key,String sort) throws SQLException {
			
			
			//这里通过一系列排序规则进行排序。
			//目前阶段建议你们别用java进行数组排序
			//可以sql语句中使用一些语句进行排序，如 order by。
			
			DBConnector d=new DBConnector();
			String sql="select * from article where (title Like \"%"+ key + "%\" )or(content Like \"%"+ key + "%\" )";
			
			switch(sort) {
			case "0":sql+="order by id desc";break;
			case "1":sql+="order by click desc";break;
			case "2":sql+="order by flag desc";break;
			}
			
			ResultSet re=d.excuteQuery(sql);
			
			// 将游标移动到最后一行上

			re.last(); 

			// 得到当前的 row number，在 JDBC 中，row number 从1开始，所以这里就相当于行数

			int rowCount = re.getRow(); 

			//此时游标执行了最后一行，如果我们后面还想从头开始调用 next()遍历整个结果集，我们可以将游标移动到第一行前面

			re.beforeFirst(); 

			// 通过上述这步操作，我们算是回复了结果集到初始状态（即刚查询出来的状态）
			
			
			
			Article[] as = new Article[rowCount];
			for(int i=0;i<as.length;i++) {
				as[i]= new Article();
			}
			
			
			for(int i=0;i<as.length;i++) {
				try {
					re.next();
					as[i].setTitle(re.getString("title"));
					as[i].setContent(re.getString("content"));
					as[i].setClick(re.getString("click"));
					as[i].setId(re.getInt("id"));
					as[i].setPublishtime(re.getString("publishtime"));
					as[i].setUserid(re.getInt("userid"));
					as[i].setUsername(re.getString("username"));
					as[i].setFlag(re.getInt("flag"));
					
					System.out.println(as[i].getUsername()); 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			return as;
		}
		public static Article getArticlesById(String id) throws SQLException {
			
			DBConnector d=new DBConnector();
			//String s= id+"";
			String sql="select * from article where id = "+id;
			System.out.println(sql);
			
			
			ResultSet re=d.excuteQuery(sql);
			
			Article as=new Article();
			re.next();
			as.setTitle(re.getString("title"));
			as.setContent(re.getString("content"));
			as.setClick(re.getString("click"));
			as.setId(re.getInt("id"));
			as.setPublishtime(re.getString("publishtime"));
			as.setUserid(re.getInt("userid"));
			as.setUsername(re.getString("username"));
			as.setFlag(re.getInt("flag"));
			
			
			return as;
			
		}
	public static void main(String[] args) {
		//getArticlesById(10);
	}
}
