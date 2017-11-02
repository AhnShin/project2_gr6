package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import service.CommentService;
import vo.Article;
import vo.Comment;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
	private CommentService service = CommentService.getInstance();
	private BoardService boardService = BoardService.getInstance();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		String path = "";
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String task = request.getParameter("task");
		String path = "";
		
		if (task!=null && task.equals("write")) {
			HttpSession session = request.getSession();
			String loginId = (String) session.getAttribute("loginId");
			
			if (loginId!=null && !loginId.isEmpty()) {
				String articleNumStr = request.getParameter("articleNum");
				int articleNum = 0;
				if (articleNumStr!=null && !articleNumStr.isEmpty()) {
					articleNum = Integer.parseInt(articleNumStr);
				}
				Comment comment = new Comment();
				comment.setArticleNum(articleNum);
				comment.setWriter(request.getParameter("writer"));
				comment.setContents(request.getParameter("comment"));
				
				Article article = boardService.readWithoutReadCount(articleNum);
				if (article!=null) {
					request.setAttribute("article", article);
				}
				
				String reply = request.getParameter("reply");
				String ridxStr = request.getParameter("ridx");
				
				int ridx = 0;
				if (ridxStr!=null && !ridxStr.isEmpty()) {
					ridx = Integer.parseInt(ridxStr);
				}
				comment.setcRidx(ridx);
				
				if (reply==null || reply.isEmpty()) {
					comment.setcLevel(0);
				} else {
					String levelStr = request.getParameter("level");
					
					int level = 0;
					if (levelStr!=null && !levelStr.isEmpty()) {
						level = Integer.parseInt(levelStr);
					}
					comment.setcLevel(level+1);
				}
				
				boolean result = service.write(comment, reply);
				List<Comment> commentList = service.read(articleNum);
				
				if (result && commentList!=null) {
					request.setAttribute("commentList", commentList);
					path = "read.jsp";
				} else {
					path = "comment_fail.jsp";
				}
				
			}
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}
}
