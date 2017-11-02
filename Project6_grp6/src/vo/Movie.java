package vo;

import java.util.Date;

public class Movie {
	private int movieNum;
	private Date movieDate;
	private Date movieTime;
	private String title;
	private String director;
	private String actor;
	
	public Movie(int movieNum, Date movieDate, Date movieTime, String title, String director, String actor) {
		this.movieNum = movieNum;
		this.movieDate = movieDate;
		this.movieTime = movieTime;
		this.title = title;
		this.director = director;
		this.actor = actor;
	}

	public Movie() {
	}

	public int getMovieNum() {
		return movieNum;
	}

	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}

	public Date getMovieDate() {
		return movieDate;
	}

	public void setMovieDate(Date movieDate) {
		this.movieDate = movieDate;
	}

	public Date getMovieTime() {
		return movieTime;
	}

	public void setMovieTime(Date movieTime) {
		this.movieTime = movieTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	@Override
	public String toString() {
		return "Movie [movieNum=" + movieNum + ", movieDate=" + movieDate + ", movieTime=" + movieTime + ", title="
				+ title + ", director=" + director + ", actor=" + actor + "]";
	}
	
	
}
