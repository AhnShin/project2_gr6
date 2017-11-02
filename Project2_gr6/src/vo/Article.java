package vo;

import java.util.Date;

public class Article {
	private int articleNum;
	private String title;
	private String writer;
	private int readCount;
	private Date writeTime;
	private String contents;
	private int bList; 
	private int bLevel;
	private int bRidx;
	
	public Article(int articleNum, String title, String writer, int readCount, Date writeTime, String contents,
			int bList, int bLevel, int bRidx) {
		this.articleNum = articleNum;
		this.title = title;
		this.writer = writer;
		this.readCount = readCount;
		this.writeTime = writeTime;
		this.contents = contents;
		this.bList = bList;
		this.bLevel = bLevel;
		this.bRidx = bRidx;
	}
	
	public Article() {
	}

	public int getArticleNum() {
		return articleNum;
	}

	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public Date getWriteTime() {
		return writeTime;
	}

	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getbList() {
		return bList;
	}

	public void setbList(int bList) {
		this.bList = bList;
	}

	public int getbLevel() {
		return bLevel;
	}

	public void setbLevel(int bLevel) {
		this.bLevel = bLevel;
	}

	public int getbRidx() {
		return bRidx;
	}

	public void setbRidx(int bRidx) {
		this.bRidx = bRidx;
	}

	@Override
	public String toString() {
		return "Article [articleNum=" + articleNum + ", title=" + title + ", writer=" + writer + ", readCount="
				+ readCount + ", writeTime=" + writeTime + ", contents=" + contents + ", bList=" + bList + ", bLevel="
				+ bLevel + ", bRidx=" + bRidx + "]";
	}
	
	
}
