package servlet;

import java.io.IOException;
import java.util.ArrayList;
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
import vo.ArticlePage;
import vo.Comment;

@WebServlet("/board")
public class BoardServlet extends HttpServlet {
	private BoardService service = BoardService.getInstance();
	private CommentService commentService = CommentService.getInstance();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		String path = "";
		
		if (task==null || task.equals("boardList")) {
			String pageStr = request.getParameter("p");
			int page = 1;
			
			if (pageStr != null && !pageStr.isEmpty() ) {
				page = Integer.parseInt(pageStr);
			}
			
			ArticlePage articlePage = service.makePage(page);
			
			request.setAttribute("articlePage", articlePage);
			
			path = "board_list.jsp";			
		} else if (task.equals("writeForm")) {
			HttpSession session = request.getSession();
			String loginId = (String)session.getAttribute("loginId");
			
			if (loginId==null || loginId.isEmpty()) {
				path = "login_form.jsp";
			} else {
				path = "write_form.jsp";
			}
			
			request.setAttribute("replyNum", 0);
		} else if (task.equals("read")) {
			HttpSession session = request.getSession();
			String loginId = (String)session.getAttribute("loginId");
			String articleNumStr = request.getParameter("articleNum");
			int articleNum = 0;
			
			if (articleNumStr != null && !articleNumStr.isEmpty()) {
				articleNum = Integer.parseInt(articleNumStr);
			}
			
			Article article = service.read(loginId, articleNum);
			List<Comment> commentList = commentService.read(articleNum);
			
			// 줄바꿈 인식 작업
			String contents = article.getContents();
			contents = contents.replace("\r\n","<br>");
			article.setContents(contents);
			
			if (article!=null) {
				request.setAttribute("article", article);
				if (commentList!=null) {
					request.setAttribute("commentList", commentList);
				}
				path = "read.jsp";
			} else {
				path = "article_not_found.jsp";
			}
			
		} else if (task.equals("updateForm")) {
			String articleNumStr = request.getParameter("articleNum");
			int articleNum = 0;
			
			if (articleNumStr != null && !articleNumStr.isEmpty()) {
				articleNum = Integer.parseInt(articleNumStr);
			}
			
			Article original = service.readWithoutReadCount(articleNum);
			request.setAttribute("original", original);
			
			path = "update_form.jsp";
		} else if (task.equals("deleteForm")) {
			String articleNumStr = request.getParameter("articleNum");
			int articleNum = 0;
			if (articleNumStr!=null && articleNumStr.length()>0) {
				articleNum = Integer.parseInt(articleNumStr);
			}
			
			request.setAttribute("articleNum", articleNum);
			path = "delete_form.jsp";
		} else if (task.equals("replyForm")) {
			HttpSession session = request.getSession();
			String loginId = (String)session.getAttribute("loginId");
			
			if (loginId==null || loginId.isEmpty()) {
				path = "login_form.jsp";
			} else {
				path = "write_form.jsp";
			}
			
			String articleNumStr = request.getParameter("articleNum");
			int articleNum = 0;
			
			if (articleNumStr != null && !articleNumStr.isEmpty()) {
				articleNum = Integer.parseInt(articleNumStr);
			}
			
			Article original = service.readWithoutReadCount(articleNum);
			request.setAttribute("original", original);
			
			String reply = "reply";
			request.setAttribute("reply", reply);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String task = request.getParameter("task");
		String path = "";
		
		if (task!=null && task.equals("write")) {
			Article article = new Article();
			article.setWriter(request.getParameter("writer"));
			article.setTitle(request.getParameter("title"));
			article.setContents(request.getParameter("contents"));
			
			String reply = request.getParameter("reply");
			
			if (reply==null || reply.isEmpty()) {
				int bList;
				if (service.selectArticleCount() == 0) {
					bList = 1;
				} else {
					bList = service.selectMaxList()+1;
				}
				article.setbList(bList);
				article.setbLevel(0);
				article.setbRidx(0);

			} else {
				String replyNumStr = request.getParameter("replyNum");
				List<Integer> checkList = new ArrayList<>();
				int replyNum = 0, bList, bLevel = 0, bRidx = 0;
				if (replyNumStr != null && !replyNumStr.isEmpty()) {
					replyNum = Integer.parseInt(replyNumStr);
				}
				
				checkList = service.checkLevelRidx(replyNum);
				
				bList = service.getListNumber(replyNum);
				bLevel = checkList.get(0);
				bRidx = checkList.get(1);
				
				article.setbList(bList);
				article.setbLevel(bLevel+1);
				article.setbRidx(bRidx+1);
				
				service.increaseRidx(bList, bRidx);
			}
			
			boolean result = service.write(article);
			
			if(result==true) {
				path = "write_success.jsp";
			} else {
				path = "write_fail.jsp";
			}
			
		} else if (task!=null && task.equals("update")) {
			HttpSession session = request.getSession();
			String loginId = (String) session.getAttribute("loginId");
			
			if (loginId !=null && !loginId.isEmpty() && loginId.equals(request.getParameter("writer"))) {
				Article article = new Article();
				article.setWriter(request.getParameter("writer"));
				article.setTitle(request.getParameter("title"));
				article.setContents(request.getParameter("contents"));
				
				String articleNumStr = request.getParameter("articleNum");
				int articleNum = 0;
				if (articleNumStr!=null && articleNumStr.length()>0) {
					articleNum = Integer.parseInt(articleNumStr);
				}
				article.setArticleNum(articleNum);
				
				if(service.update(article)) {
					request.setAttribute("articleNum", article.getArticleNum());
					path = "update_success.jsp";
				} else {
					path = "update_fail.jsp";
				}
			} else {
				path = "update_fail.jsp";
			}
			
		} else if (task!=null && task.equals("delete")) {
			HttpSession session = request.getSession();
			String loginId = (String) session.getAttribute("loginId");
			
			if (loginId !=null && !loginId.isEmpty()) {
				String articleNumStr = request.getParameter("articleNum");
				int articleNum = 0;
				if (articleNumStr!=null && articleNumStr.length()>0) {
					articleNum = Integer.parseInt(articleNumStr);
				}
				String writer = service.checkWriter(articleNum);
				
				if(loginId.equals(writer) && service.delete(articleNum)) {
					path = "delete_success.jsp";
				} else {
					path = "delete_fail.jsp";
				}
			} else {
				path = "delete_fail.jsp";
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
	
}
