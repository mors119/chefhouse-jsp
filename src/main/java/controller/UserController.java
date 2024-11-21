package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

@WebServlet("/User/*")
@MultipartConfig
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// session
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		String pathInfo = req.getPathInfo();
		
		// layout에 이미 .jsp가 있으므로 /login은 불필요하다.
		
		if (pathInfo.equals("/loginSubmit")) {
			String dto="";
			// dto 리턴 후 session
			req.getSession().setAttribute("user", dto);
			resp.sendRedirect("/"); // main
			return;
		} else if(pathInfo.equals("/logout")) {
//			req.getSession().invalidate(); // 전체 비우기
			req.getSession().removeAttribute("user");
			resp.sendRedirect("/"); // main
			return;
		}

		req.setAttribute("layout", pathInfo);
		req.getRequestDispatcher("/layout.jsp").forward(req, resp);
	}
}
