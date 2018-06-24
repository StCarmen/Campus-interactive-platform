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
	
	
	//���ݸ���num��ȡ���µ���Ŀ����������󷵻�
	public static Article[] getArticles(int num) {
		Article[] as = new Article[num];
		for(int i=0;i<as.length;i++) {
			as[i]= new Article();
			as[i].setTitle("title"+i);
			as[i].setContent("content"+i);
		}
		
		//����ͨ��һϵ����������������
		//Ŀǰ�׶ν������Ǳ���java������������
		//����sql�����ʹ��һЩ������������ order by��
		
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
	//���ݸ���num��ȡ���µ���Ŀ,key�ǹؼ��֣�sort�����򷽷���Ĭ��0����������󷵻�
		public static Article[] getArticles(String key,String sort) throws SQLException {
			
			
			//����ͨ��һϵ����������������
			//Ŀǰ�׶ν������Ǳ���java������������
			//����sql�����ʹ��һЩ������������ order by��
			
			DBConnector d=new DBConnector();
			String sql="select * from article where (title Like \"%"+ key + "%\" )or(content Like \"%"+ key + "%\" )";
			
			switch(sort) {
			case "0":sql+="order by id desc";break;
			case "1":sql+="order by click desc";break;
			case "2":sql+="order by flag desc";break;
			}
			
			ResultSet re=d.excuteQuery(sql);
			
			// ���α��ƶ������һ����

			re.last(); 

			// �õ���ǰ�� row number���� JDBC �У�row number ��1��ʼ������������൱������

			int rowCount = re.getRow(); 

			//��ʱ�α�ִ�������һ�У�������Ǻ��滹���ͷ��ʼ���� next()������������������ǿ��Խ��α��ƶ�����һ��ǰ��

			re.beforeFirst(); 

			// ͨ�������ⲽ�������������ǻظ��˽��������ʼ״̬�����ղ�ѯ������״̬��
			
			
			
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
