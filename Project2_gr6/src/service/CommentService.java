package service;

import java.util.Date;
import java.util.List;

import dao.CommentDao;
import vo.Comment;

public class CommentService {
	
	private static CommentService instance;
	public static CommentService getInstance() {
		if (instance==null) {
			instance = new CommentService();
		}
		return instance;
	}
	private CommentService() {
	}
	
	private CommentDao dao = CommentDao.getInstance();

	public boolean write(Comment comment, String reply) {
		comment.setWriteTime(new Date());
		int articleNum = comment.getArticleNum();
		
		if (dao.countComment(articleNum)==0) {
			comment.setcRidx(0);
		} else if(reply==null || reply.isEmpty()){
			comment.setcRidx(dao.selectMaxList(articleNum)+1);
		} else {
			int ridx = comment.getcRidx();
			dao.increaseRidx(articleNum, ridx);
			comment.setcRidx(ridx+1);
		}
		
		if (dao.insert(comment)>0) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<Comment> read(int articleNum) {
		List<Comment> commentList = dao.selectCommentList(articleNum);
		return commentList;
	}
	
}
