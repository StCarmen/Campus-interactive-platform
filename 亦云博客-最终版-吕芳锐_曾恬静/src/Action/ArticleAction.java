package Action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.User;
import Bean.Comment;
import Impl.ArticleImpl;

/**
 * Servlet implementation class ArticleAction
 */
@WebServlet("/ArticleAction")
public class ArticleAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		if(type.equals("add")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String userid= request.getParameter("userid");
			System.out.println("ArticleAction 36 接收到标题:"+title);
			System.out.println(content);
			System.out.println("ArticleAction 37 接收到内容:"+content.trim());
			boolean b = false;
			try {
				b = ArticleImpl.addArticle(title,content,Integer.parseInt(userid));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}else if(type.equals("addmycomments")) {
			String username = request.getParameter("username");
			String comments = request.getParameter("comments");
			String articleid = request.getParameter("articleid");
			String publishtime = request.getParameter("publishtime");
			String userid=request.getParameter("userid");
			int ui= Integer.parseInt(userid);
			int ai= Integer.parseInt(articleid);
			boolean b = ArticleImpl.addComments(username,comments,articleid,publishtime,userid);
			if(b) {
				//如果成功,把登录状态存进session(session的意思百度一下)
				//1.生成User信息
			/*	Comment comment =new Comment();
				comment.setUsername(username);
				comment.setarticleid(ai);
				comment.setcontent(comments);
				comment.setpublishtime(publishtime);
				comment.setuserid(ui);
				
				
				//2.把User装进session里面
				request.getSession(true).setAttribute("comment", user);*/
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
