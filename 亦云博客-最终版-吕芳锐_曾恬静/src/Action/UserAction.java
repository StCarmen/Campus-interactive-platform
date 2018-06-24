package Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.User;
import Impl.UserImpl;

/**
 *  @Webserblet("/UserAction")
 *  为自定义本类浏览器访问地址（相对于项目根路径），一个地址只能对应一个类
 */
@WebServlet("/UserAction")
public class UserAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 通过get方式发送过来的参数接收后执行函数
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//通过request.getParameter 获得对应客户端传过来的参数
		String type = request.getParameter("type");
		if(type.equals("login")) {
			//获得对应参数
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			//UserImpl类里封装好有关User的函数
			boolean b = UserImpl.login(username, password);
			if(b) {
				//如果成功,把登录状态存进session(session的意思百度一下)
				//1.生成User信息
				User user =new User();
				user.setUsername(username);
				user.setPassword(password);
				//2.把User装进session里面
				request.getSession(true).setAttribute("user", user);
				
				//write里面的内容即为写回前端的数据
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}else if(type.equals("exit")) {
			request.getSession().setAttribute("user", null);
			response.getWriter().write("success");
		}else if(type.equals("register")){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			boolean b = UserImpl.register(username, password);
			if(b) {
				//如果成功,把登录状态存进session(session的意思百度一下)
				//1.生成User信息
				User user =new User();
				user.setUsername(username);
				user.setPassword(password);
				//2.把User装进session里面
				request.getSession(true).setAttribute("user", user);
				
				//write里面的内容即为写回前端的数据
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
			
		}
			
	}

	/**
	 * 通过post方式传输的参数接收后执行函数
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 执行Get方式的方法，即无论通过get还是post，统一用get的方法执行
		doGet(request, response);
	}

}
