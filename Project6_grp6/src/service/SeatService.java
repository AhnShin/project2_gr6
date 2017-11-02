package service;

import dao.SeatDao;
import vo.SeatVO;

public class SeatService {
	// ���񽺰� �۾� ����� DB ��ɾ� ���� �ʿ��� �� ����� ��ü
	private SeatDao dao = SeatDao.getInstance();
///////////////////////////////////////////////////////////	
	// singleton
	private static SeatService instance;
	public static SeatService getInstance() {
		if(instance==null)
			instance = new SeatService();
		return instance;
	}
	private SeatService() {}
//////////////////////////////////////////////////////////
	public boolean checkSeat(SeatVO seatVO) {
		if(dao.insertSeat(seatVO)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public SeatVO reservationSeat(int movieNum) {
		SeatVO seatVO = new SeatVO();
		seatVO = dao.reservation(movieNum);
		return seatVO;
	}
	
	public void insertPay(String id, int movieNum, String seat) {
		dao.insertPay(id, movieNum, seat);
	}
}
