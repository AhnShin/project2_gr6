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

import service.TicketingService;
import vo.Movie;

@WebServlet ("/ticketing") //øπ∏≈ ∆‰¿Ã¡ˆ
public class TicketingServlet extends HttpServlet {
	TicketingService service = TicketingService.getInstance();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		String path = "";
		
		if (task == null || task.equals("ticketingForm")) {
			List<Movie> movieList = new ArrayList<>();
			movieList = service.selectAllMovie();
			request.setAttribute("movieList", movieList);
			path = "ticketing_form.jsp";
		} else if (task.equals("completeForm")) {
			HttpSession session = request.getSession();
			String loginId = (String) session.getAttribute("loginId");
			
			if (loginId == null || loginId.isEmpty()) {
				path = "complete_form.jsp";
			} else {
				String ticketing = request.getParameter("ticketing");
				if (ticketing!=null&& ticketing.equals("cancel")) {
					String seat = "";
					seat = service.cancelTicketing(loginId); // √Îº“«œ∏Èº≠ seatListª©≥ø
					
					int movieNum = 0;
					movieNum = service.selectMovieNum(loginId);
					
					service.cancelSeat(movieNum, seat);
				}
				
				int movieNum = service.selectMovieNum(loginId);
				request.setAttribute("movie", service.selectMovie(movieNum));
				
				String seat = service.selectSeat(loginId);
				request.setAttribute("seat", seat);
				
				path = "complete_form.jsp";
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		String path = "";
		
		if (task != null && task.equals("completeForm")) {
			HttpSession session = request.getSession();
			String loginId = (String) session.getAttribute("loginId");
			
			if (loginId == null || loginId.isEmpty()) {
				path = "complete_form.jsp";
			} else {
				String ticketing = request.getParameter("ticketing");
				if (ticketing!=null&& ticketing.equals("cancel")) {
					String seat = "";
					int movieNum = 0;
					movieNum = service.selectMovieNum(loginId);

					seat = service.cancelTicketing(loginId); // √Îº“«œ∏Èº≠ seatListª©≥ø
					System.out.println("movienum"+movieNum);
					service.cancelSeat(movieNum, seat);
				}
				
				path = "complete_form.jsp";
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
	
}
