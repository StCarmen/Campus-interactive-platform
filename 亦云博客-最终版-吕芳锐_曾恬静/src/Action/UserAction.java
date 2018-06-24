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
 *  Ϊ�Զ��屾����������ʵ�ַ���������Ŀ��·������һ����ַֻ�ܶ�Ӧһ����
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
	 * ͨ��get��ʽ���͹����Ĳ������պ�ִ�к���
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//ͨ��request.getParameter ��ö�Ӧ�ͻ��˴������Ĳ���
		String type = request.getParameter("type");
		if(type.equals("login")) {
			//��ö�Ӧ����
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			//UserImpl�����װ���й�User�ĺ���
			boolean b = UserImpl.login(username, password);
			if(b) {
				//����ɹ�,�ѵ�¼״̬���session(session����˼�ٶ�һ��)
				//1.����User��Ϣ
				User user =new User();
				user.setUsername(username);
				user.setPassword(password);
				//2.��Userװ��session����
				request.getSession(true).setAttribute("user", user);
				
				//write��������ݼ�Ϊд��ǰ�˵�����
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
				//����ɹ�,�ѵ�¼״̬���session(session����˼�ٶ�һ��)
				//1.����User��Ϣ
				User user =new User();
				user.setUsername(username);
				user.setPassword(password);
				//2.��Userװ��session����
				request.getSession(true).setAttribute("user", user);
				
				//write��������ݼ�Ϊд��ǰ�˵�����
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
			
		}
			
	}

	/**
	 * ͨ��post��ʽ����Ĳ������պ�ִ�к���
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ִ��Get��ʽ�ķ�����������ͨ��get����post��ͳһ��get�ķ���ִ��
		doGet(request, response);
	}

}
