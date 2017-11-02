package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.MemberService;
import vo.Member;

@WebServlet("/member")
public class MemberServlet extends HttpServlet{
	private MemberService service = MemberService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		String path = "";
		
		if (task!=null && task.equals("joinForm")) {
			path = "join_form.jsp";
		} else if (task!=null && task.equals("loginForm")) {
			path = "login_form.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String task = request.getParameter("task");
		String checkId = request.getParameter("keyword");
		String path = "";
		
		if(task!=null && task.equals("join")) {
			Member member = new Member();
			member.setId(request.getParameter("id"));
			member.setPw(request.getParameter("pw"));
			member.setName(request.getParameter("name"));
			member.setPhone(request.getParameter("phone"));
			
			if (service.joinMember(member)) {
				path = "join_success.jsp";
			} else {
				path = "join_fail.jsp";
			}
			
		} else if (task!=null && task.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String loginId = service.login(id, pw);
			
			if (loginId !=null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginId", loginId);
				path = "login_success.jsp";
			} else {
				path = "login_fail.jsp";
			}
		} else if (checkId !=null && !checkId.isEmpty()) {
			response.setContentType("text/json;charset=euc-kr");
			PrintWriter writer = response.getWriter();
			String checkResult = service.selectIdCount(checkId);
			
			Gson gson = new Gson();
			writer.print(gson.toJson(checkResult));
			
			System.out.println(checkResult);
			
		}
		
		if (path!=null && !path.isEmpty()) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		
	}

}
