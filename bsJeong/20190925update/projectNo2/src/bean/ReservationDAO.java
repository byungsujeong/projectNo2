package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ReservationDAO {

	public void insert(ReservationDTO dto) throws Exception {

		// 2. DB처리
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		// 3) SQL문 객체화
		String sql = "insert into reservation (reservenum, regnum, reservedate, reservename, etc, additional, nowstate) values(?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getResnum());
		ps.setString(2, dto.getRegnum());
		ps.setString(3, dto.getReservedate());
		ps.setString(4, dto.getReservename());
		ps.setString(5, dto.getEtc());
		ps.setString(6, dto.getAdditional());
		ps.setString(7, dto.getNowstate());

		// 4) SQL문 실행 요청
		ps.execute();

		ps.close();
		con.close();

	}
		
}
