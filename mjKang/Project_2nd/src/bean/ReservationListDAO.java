//BbsDAO.java

package bean;

import java.sql.*;
import java.util.ArrayList;

public class ReservationListDAO {
	
	
	public void acceptupdate(ReservationListDTO dto) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("rdao DB연결 완료..");
		
		String sql = "update reservationlist set state=? where wNum=? and reserveNum=?";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("워커아이디"+dto.wNum);
		System.out.println("예약번호"+dto.reserveNum);
		ps.setInt(1, dto.getState());
		ps.setString(2, dto.getwNum());
		ps.setString(3, dto.getReserveNum());
		System.out.println("rdao 3. sql문 객체화 ok..");
		
		// 4) SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("rdao 4. sql문 실행 요청 ok..");
		
		ps.close();
		con.close();
	}//예약수락
	
	public void refuseupdate(ReservationListDTO dto) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("rdao DB연결 완료..");
		
		String sql = "update reservationlist set state=? where wNum=? and reserveNum=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getState());
		ps.setString(2, dto.getwNum());
		ps.setString(3, dto.getReserveNum());
		System.out.println("rdao 3. sql문 객체화 ok..");
		
		// 4) SQL문 실행 요청
		ps.execute();
		System.out.println("rdao 4. sql문 실행 요청 ok..");
		
		ps.close();
		con.close();
	}//예약거절

	/*public ArrayList<ReservationListDTO> select(ReservationListDTO dto) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("DB연결 완료..");

		String sql = "select * from reservationlist where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		System.out.println("3. sql문 객체화 ok..");

		// 4) SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 실행 요청 ok.. select");
		ReservationListDTO dto2 = null;
		ArrayList<ReservationListDTO> list = new ArrayList<ReservationListDTO>();
		while (rs.next()) {
			dto2 = new ReservationListDTO();
			dto2.setId(rs.getString(2));
			dto2.setCheckdate(rs.getString(3));
			dto2.setContent(rs.getString(4));
			list.add(dto2);
		}
		System.out.println("5. list 삽입 완료");
		return list;
	} */
	
	  public ArrayList<ReservationListDTO> selectAll(ReservationListDTO dto) throws Exception {
	  
	  DBConnectionMgr mgr = DBConnectionMgr.getInstance(); 
	  Connection con = mgr.getConnection(); 
	  System.out.println("DB연결 완료..");
	  
	  String sql = "select * from reservationlist where wNum=?"; 
	  PreparedStatement ps = con.prepareStatement(sql); 
	  ps.setString(1, dto.getwNum());
	  System.out.println("3. sql문 객체화 ok..");
	  
	  // 4) SQL문 실행 요청 
	  ResultSet rs = ps.executeQuery();
	  System.out.println("4. sql문 실행 요청 ok.."); 
	  ReservationListDTO dto2 = null;
	  ArrayList<ReservationListDTO> list = new ArrayList<ReservationListDTO>(); 
	  while(rs.next()) { 
	  dto2 = new ReservationListDTO(); 
	  dto2.setReserveNum(rs.getString(1));
	  dto2.setwNum(rs.getString(2)); 
	  dto2.setRegNum(rs.getString(3));
	  dto2.setReserveDate(rs.getString(4));
	  dto2.setReserveName(rs.getString(5));
	  dto2.setType1(rs.getString(6));
	  dto2.setAddress1(rs.getString(7));
	  dto2.setState(rs.getInt(8));
	  list.add(dto2); 
	  } 
	  return list; 
	 }
	 
}
