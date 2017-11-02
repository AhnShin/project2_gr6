package vo;

import java.util.Date;

public class Comment {
	private int commentNum;
	private int articleNum;
	private String writer;
	private Date writeTime;
	private String contents;
	private int cLevel;
	private int cRidx;
	
	public Comment(int commentNum, int articleNum, String writer, Date writeTime, String contents, 
			int cLevel, int cRidx) {
		this.commentNum = commentNum;
		this.articleNum = articleNum;
		this.writer = writer;
		this.writeTime = writeTime;
		this.contents = contents;
		this.cLevel = cLevel;
		this.cRidx = cRidx;
	}
	
	public Comment() {
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getArticleNum() {
		return articleNum;
	}

	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public int getcLevel() {
		return cLevel;
	}

	public void setcLevel(int cLevel) {
		this.cLevel = cLevel;
	}

	public int getcRidx() {
		return cRidx;
	}

	public void setcRidx(int cRidx) {
		this.cRidx = cRidx;
	}

	@Override
	public String toString() {
		return "Comment [commentNum=" + commentNum + ", articleNum=" + articleNum + ", writer=" + writer
				+ ", writeTime=" + writeTime + ", contents=" + contents + ", cLevel=" + cLevel + ", cRidx=" + cRidx
				+ "]";
	}

}
