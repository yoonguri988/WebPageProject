package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.Member.MemberAllAction;

@WebServlet(urlPatterns= {"*.do"},
initParams = {@WebInitParam(name="properties",
								value="method.properties")})
public class ControllerMethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Properties pr = new Properties();
	private MemberAllAction action = new MemberAllAction();
	private Class[] paramType= new Class[] {
			HttpServletRequest.class, HttpServletResponse.class
	};
	@Override
	public void init(ServletConfig config) throws ServletException{
		String props = config.getInitParameter("properties");
		FileInputStream f =null;
		try {
			f = new FileInputStream
			(config.getServletContext().getRealPath("/")+"WEB-INF/"+props);
			pr.load(f);
			f.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Object[] paramObjs = new Object[] {request,response};
		ActionForward forward = null;
		String command = null;
		try {
			System.out.println(request.getRequestURI());
			System.out.println(request.getContextPath());
			command = request.getRequestURI().substring
					(request.getContextPath().length());
			String methodName = pr.getProperty(command);
			Method method = MemberAllAction.class.getMethod(methodName, paramType);
			forward =(ActionForward)method.invoke(action, paramObjs);
		}catch(NullPointerException e) {
			forward = new ActionForward();
			e.printStackTrace();
		}catch(Exception e) {
			throw new ServletException(e);
		}
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getView());
			}else {
				if(forward.getView()==null) {
					forward.setView(command.replace(".do", ".jsp"));
				}
				RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
				disp.forward(request, response);
			}
		}else response.sendRedirect("nopage.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
