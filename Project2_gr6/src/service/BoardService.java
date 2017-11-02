package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.BoardDao;
import vo.Article;
import vo.ArticlePage;

public class BoardService {
	private static BoardService instance;
	public static BoardService getInstance() {
		if(instance==null) {
			instance = new BoardService();
		}
		return instance;
	}
	private BoardService() {
	}
	
	private BoardDao dao = BoardDao.getInstance();
	private static final int COUNT_PER_PAGE = 10;
	
	public ArticlePage makePage(int page) {
		int totalArticleCount = dao.selectArticleCount();
		
		int totalPage = totalArticleCount/COUNT_PER_PAGE;
		
		if (totalArticleCount%COUNT_PER_PAGE>0) {
			totalPage++;
		}
		
		int startPage = (page-1)/10*10 + 1;
		
		int endPage = startPage + 9;
		
		if (endPage>totalPage) {
			endPage = totalPage;
		}
		
		int startRow = (page-1)*COUNT_PER_PAGE;
		List<Article> articleList = dao.selectArticleList(startRow, COUNT_PER_PAGE);
		
		return new ArticlePage(articleList, startPage, endPage, page, totalPage);
	}
	
	public boolean write(Article article) {
		
		article.setWriteTime(new Date());
		article.setReadCount(0);
		
		if (dao.insert(article)>0) {
			return true;
		} else {
			return false;
		}
	}
	
	public Article read(String loginId, int articleNum) {
		Article article = dao.select(articleNum);
		if (article==null || article.getWriter().equals(loginId)) {
			return article;
		} else {
			dao.updateReadCount(articleNum);
			article.setReadCount(article.getReadCount()+1);
			return article;
		}
	}
	
	public Article readWithoutReadCount (int articleNum) {
		return dao.select(articleNum);
	}
	
	public boolean update(Article article) {
		article.setWriteTime(new Date());
		if(dao.update(article)>0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int articleNum) {
		if (dao.delete(articleNum)>0) {
			return true;
		} else {
			return false;
		}
	}
	
	public String checkWriter (int articleNum) {
		String writer = dao.checkWriter(articleNum);
		return writer;
	}
	
	public int selectArticleCount() {
		return dao.selectArticleCount();
	}
	
	public int selectMaxList() {
		return dao.selectMaxList();
	}
	
	public int getListNumber (int replyNum) {
		return dao.getListNumber(replyNum);
	}
	
	public List<Integer> checkLevelRidx (int replyNum) {
		List<Integer> checkList = new ArrayList<>();
		checkList = dao.checkLevelRidx(replyNum);
		return checkList;
	}
	
	public void increaseRidx (int list, int ridx) {
		dao.increaseRidx(list, ridx);
	}
	
}
