package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FoodDao;
import dao.MovieDao;
import vo.FileInfoVO;
import vo.MovieVO;

@WebServlet("/index")
public class IndexServlet extends HttpServlet{
	private static MovieDao dao = MovieDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String task = req.getParameter("task");
		String path = "";
		
		if(task!=null || task.equals("home")) {
			// dao 이용해서 파일 전체목록 select 해오기
			List<MovieVO> movieVOList = dao.selectList();
			req.setAttribute("movieVOList", movieVOList);
			path = "home.jsp";
		} 
		RequestDispatcher dispatcher = req.getRequestDispatcher(path);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		
	}
}
