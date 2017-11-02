package service;

import dao.MemberDao;
import vo.Member;

public class MemberService {
	private MemberDao dao = MemberDao.getInstance();
	
	private static MemberService instance;
	public static MemberService getInstance() {
		if(instance==null) {
			instance = new MemberService();
		}
		return instance;
	}
	private MemberService() {
	}
	
	public String selectIdCount(String id) {
		int checkId = dao.selectIdCount(id);
		String checkResult;
		
		if (checkId==0) {
			checkResult = "��밡���� ID�Դϴ�";
		} else {
			checkResult = "�̹� ������� ID�Դϴ�";
		}
		
		return checkResult;
	}
	
	public boolean joinMember (Member member) {
		if (dao.insert(member)>0) {
			return true;
		} else {
			return false;
		}
	}
	
	public String login(String id, String pw) {
		String loginId = dao.selectIdUsingIdPw(id, pw);
		return loginId;
	}
	
	
}
