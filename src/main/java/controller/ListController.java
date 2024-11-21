package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ListDTO;
import service.ListService;
import serviceImpl.ListServiceImpl;

/**
 * Servlet implementation class ListController
 */
@WebServlet("/List/*")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		String pathInfo = req.getPathInfo();
		ListService ls = new ListServiceImpl();

		if (pathInfo.equals("/list")) {

			List<ListDTO> dto = ls.ListAll();

			req.setAttribute("dto", dto);

			// view 페이지로 이동
		} else if (pathInfo.equals("/view")) {
			int listno = Integer.parseInt(req.getParameter("no"));

			ListDTO dto = ls.ListOne(listno);
			ls.PlusCount(listno);

			req.setAttribute("dto", dto);

			// 수정 페이지로 이동
		} else if (pathInfo.equals("/modify")) {

		}

		req.setAttribute("layout", pathInfo);
		req.getRequestDispatcher("/layout.jsp").forward(req, resp);
	}

}
