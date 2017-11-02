package service;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import dao.SeatDao;
import dao.TicketingDao;
import vo.Movie;

public class TicketingService {
	private static TicketingService instance;
	public static TicketingService getInstance() {
		if (instance==null) {
			instance = new TicketingService();
		}
		return instance;
	}
	private TicketingService() {
	}
	
	private TicketingDao dao = TicketingDao.getInstance();
	private SeatDao seatDao = SeatDao.getInstance();
	
	public List<Movie> selectAllMovie() {
		List<Movie> movieList = new ArrayList<>();
		movieList = dao.selectAllMovie();
		return movieList;
	}
	
	public Movie selectMovie(int movieNum) {
		return dao.selectMovie(movieNum); 
	}
	
	public int selectMovieNum(String id) {
		return dao.selectMovieNum(id);
	}
	
	public String selectSeat(String id) {
		return dao.selectSeat(id);
	}
	
	public String cancelTicketing(String id) {
		String seat = "";
		seat = dao.selectSeat(id);
		dao.cancelTicketing(id);
		return seat;
	}
	
	public void cancelSeat(int movieNum, String seat) {
		System.out.println("TicketingService.cancel:"+movieNum+"/"+seat);
		List<Integer> seatList = seatDao.reservationCheck(movieNum);
		StringTokenizer tokenizer = new StringTokenizer(seat, " ");
		for (int i =0; tokenizer.hasMoreTokens(); i++) {
			String token = tokenizer.nextToken();
			System.out.println((Integer.parseInt(token)-1)+"/"+seatList.size());
			seatList.set(Integer.parseInt(token)-1, 0);
		}
		
		seatDao.reservationUpdate(movieNum, seatList);
	}
}
