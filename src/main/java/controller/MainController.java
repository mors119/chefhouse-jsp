package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	service()는 총괄적인 처리를 담당하고, doGet()과 doPost()는 각각 GET과 POST 요청에 대한 세부적인 처리를 담당하는 메서드 
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

//		ListService ls = new ListServiceImpl();
//		List<ListDTO> list = ls.ListAll();
//
//		req.setAttribute("list", list);
		req.setAttribute("layout", "/main");
		req.getRequestDispatcher("/layout.jsp").forward(req, resp);
	}

}
