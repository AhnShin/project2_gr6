package vo;

public class MovieVO {
	private int movie_num;
	private String title;
	private String director;
	private int year;
	private String movie_img;
////////////////////////////////////////////////////////////////////////
	public MovieVO(int movie_num, String title, String director, int year, String movie_img) {
	super();
	this.movie_num = movie_num;
	this.title = title;
	this.director = director;
	this.year = year;
	this.movie_img = movie_img;
	}
	
	public MovieVO() {
		
	}
///////////////////////////////////////////////////////////////////////
	public int getMovie_num() {
		return movie_num;
	}

	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
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
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getMovie_img() {
		return movie_img;
	}
	public void setMovie_img(String movie_img) {
		this.movie_img = movie_img;
	}
///////////////////////////////////////////////////////////////////////

	@Override
	public String toString() {
		return "MovieVO [movie_num=" + movie_num + ", title=" + title + ", director=" + director + ", year=" + year
				+ ", movie_img=" + movie_img + "]";
	}
	
	
}
