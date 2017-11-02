package vo;

import java.util.ArrayList;
import java.util.Arrays;

public class SeatVO {
	private int movie_num;
	private int[] seats = new int[20];

	public SeatVO() {
	}
	public SeatVO(ArrayList<String> checkArray) {
		for(int i = 0 ; i < checkArray.size() ; i++) {
			int index = Integer.parseInt(checkArray.get(i));
			seats[index-1]=1;
		}
	}
	
	public int[] getSeats() {
		return seats;
	}
	public void setSeats(int[] seats) {
		this.seats = seats;
	}
	
	public int getMovieNum() {
		return movie_num;
	}
	public int getSeat(int i) {
		return seats[i];
	}
	public void setMovieNum(int movie_num) {
		this.movie_num = movie_num;
	}
	public void setSeat(int[] seat) {
		this.seats = seat;
	}
	@Override
	public String toString() {
		return "SeatVO [movie_num=" + movie_num + ", seat=" + Arrays.toString(seats) + "]";
	}
}
