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

import service.SeatService;
import service.TicketingService;
import vo.SeatVO;

@WebServlet("/seat")
public class SeatServlet extends HttpServlet {
	SeatService seatService = SeatService.getInstance();
	TicketingService service = TicketingService.getInstance();
	///////////////////////////////////////////////////////////////////////

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String task = request.getParameter("task");
		String path = "";
		if (task != null && task.equals("seatForm")) {
			HttpSession session = request.getSession();
			String loginId = (String) session.getAttribute("loginId");
			
			String movieNumStr = request.getParameter("movieNum");
			int movieNum = 0;
			if (movieNumStr != null && !movieNumStr.isEmpty()) {
				movieNum = Integer.parseInt(movieNumStr);
			}
			
			int payCheck = 0;
			payCheck = service.selectMovieNum(loginId);
			if (payCheck>0) {
				request.setAttribute("exist", "exist");
			}

			SeatVO testVO = new SeatVO();
			testVO.setMovieNum(movieNum);
			testVO = seatService.reservationSeat(testVO.getMovieNum());
			System.out.println("get부분" + testVO.toString());

			request.setAttribute("testVO", testVO);

			path = "seatForm.jsp";
		}
		RequestDispatcher dispatcer = request.getRequestDispatcher(path);
		dispatcer.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String task = request.getParameter("task");
		String path = "";

		if (task.equals("seatOk")) {
			String[] checkArray = request.getParameterValues("seat");
			
			if (checkArray==null) {
				path = "seat_select_empty.jsp";
			} else {
				HttpSession session = request.getSession();
				String loginId = (String) session.getAttribute("loginId");
	
				String[] checkArray2 = request.getParameterValues("seat2");
				String paySeat = "";
				ArrayList<String> checkArrayAll = new ArrayList<>();
				System.out.println("getSeat end");
	
				System.out.println("멤버가 받는 체부분");
				if (checkArray2!=null) {
					for (String seatNum2 : checkArray2) {
						System.out.println(seatNum2);
						checkArrayAll.add(seatNum2);
					}
				}
				System.out.println("getSeat start");
				if (checkArray!=null) {
					for (String seatNum : checkArray) {
						System.out.println(seatNum);
						checkArrayAll.add(seatNum);
						paySeat = paySeat + seatNum + " ";
					}
				}
	
				System.out.println("list 출력");
				for (String seatNumAll : checkArrayAll) {
					System.out.println(seatNumAll);
				}
	
				System.out.println("---------------");
	
				SeatVO seatVO = new SeatVO(checkArrayAll);
				System.out.println(checkArrayAll.size());
	
				String movieNumStr = request.getParameter("movieNum");
				int movieNum = 0;
	
				if (movieNumStr != null && !movieNumStr.isEmpty()) {
					movieNum = Integer.parseInt(movieNumStr);
				}
	
				seatVO.setMovieNum(movieNum);
	
				seatService.insertPay(loginId, movieNum, paySeat);
	
				System.out.println("post부분" + seatVO.toString());
	
				if (loginId == null || loginId.isEmpty()) {
					path = "complete_form.jsp";
				} else if(seatService.checkSeat(seatVO)) {
					String ticketing = request.getParameter("ticketing");
					if (ticketing != null && ticketing.equals("cancel")) {
						String seat = "";
						seat = service.cancelTicketing(loginId); // 취소하면서 seatList빼냄
						service.cancelSeat(movieNum, seat);
					}
	
					movieNum = service.selectMovieNum(loginId);
					request.setAttribute("movie", service.selectMovie(movieNum));
	
					String seat = service.selectSeat(loginId);
					request.setAttribute("seat", seat);
	
					path = "complete_form.jsp";
				}
			
			}
			// if(seatService.checkSeat(seatVO)) {
			// path = "complete_form.jsp";
			// }else {
			// path = "seat_fail.jsp";
			// }
		}
		RequestDispatcher dispatcer = request.getRequestDispatcher(path);
		dispatcer.forward(request, response);

	}
}
