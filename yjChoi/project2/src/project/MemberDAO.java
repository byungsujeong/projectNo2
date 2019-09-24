package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import project.MemberDTO;

public class MemberDAO {
	public void insert(MemberDTO dto) throws Exception {
		//2. DB 로 전송한다.
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("2. DB 연결 OK.");
		
		//3) sql문 객체화
		String sql = "insert into members values (?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getMid());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getBirth());
		ps.setString(5, dto.getGender());
		ps.setString(6, dto.getEmail());
		ps.setString(7, dto.getTel());
		System.out.println("3. sql 객체화 OK.");
		
		//4) sql문 실행 요청
		ps.executeUpdate();
		System.out.println("4. sql 실행 요청 OK.");		
		
		
		ps.close();
		con.close();

	}
	
	public MemberDTO select(MemberDTO dto) throws Exception {
		//2. DB 로 전송한다.
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("2. DB 연결 OK.");
		
		//3) sql문 객체화
		String sql = "select * from members where mid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getMid());

		System.out.println("3. sql 객체화 OK.");
		
		//4) sql문 실행 요청
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql 실행 요청 OK.");		
		
		if (rs.next()) {
			
			//ORM ( object : 자바 rdb : table항목 mapping)
			dto.setMid(rs.getString(1));
			dto.setPw(rs.getString(2));
			dto.setName(rs.getString(3));
			dto.setBirth(rs.getString(4));			
			dto.setGender(rs.getString(5));			
			dto.setEmail(rs.getString(6));			
			dto.setTel(rs.getString(7));			
		}
		rs.close();
		ps.close();
		con.close();
		
		return dto;
		
	}
	public ArrayList<WorkerDTO> search(WorkerDTO dto) throws Exception {
		//2. DB 로 전송한다.
		//검색결과를 dto 로 받는다.
		//
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		
		//3) sql문 객체화
		String sql = "select wnum from worker where type1 = ? and address1 =? and address2 = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getType1());
		ps.setString(2, dto.getAddress1());
		ps.setString(3, dto.getAddress2());
		
		System.out.println("3. sql wnum 검색 OK.");
		
		//4) sql문 실행 요청
		ResultSet rs = ps.executeQuery();
		ArrayList<WorkerDTO> list = new ArrayList<WorkerDTO>();
		while (rs.next()) {
			dto = new WorkerDTO();
			//ORM ( object : 자바 rdb : table항목 mapping)
			dto.setWnum(rs.getInt(1));
			list.add(dto);
		}
		//list에 있는 wnum 과 dto에 있는 시작, 끝 날짜 이용해서 wnum 검색
		
		
		rs.close();
		ps.close();
		con.close();
		
		
	}
	
	public ArrayList<MemberDTO> selectAll() throws Exception {
		//2. DB 로 전송한다.
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("2. DB 연결 OK.");
		
		//3) sql문 객체화
		String sql = "select * from members";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql 객체화 OK.");
		
		//4) sql문 실행 요청
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql 실행 요청 OK.");		
		MemberDTO dto2 = null;
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		while (rs.next()) {
			dto2 = new MemberDTO();
			//ORM ( object : 자바 rdb : table항목 mapping)
			dto2.setMid(rs.getString(1));
			dto2.setPw(rs.getString(2));
			dto2.setName(rs.getString(3));
			dto2.setBirth(rs.getString(4));			
			dto2.setGender(rs.getString(5));			
			dto2.setEmail(rs.getString(6));			
			dto2.setTel(rs.getString(7));		
			list.add(dto2);
		}
		
		
		rs.close();
		ps.close();
		con.close();
		return list;
		
	}
	
	public void update(String pw, String name, String gender, String email, String tel, String mid) throws Exception {

		// 2. DB 연결
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("2. DB 연결 성공");

		// 3. SQL 문 결정

		String sql = "update members set pw = ?, name = ?, gender =?, email = ?, tel = ? where mid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, pw);
		ps.setString(2, name);
		ps.setString(3, gender);
		ps.setString(4, email);
		ps.setString(5, tel);
		ps.setString(6, mid);
		ps.executeUpdate();

		System.out.println("3. SQL문 결정 성공");

		// SQL문 전송 요청

		System.out.println("4. SQL문 전송 요청 성공");
		ps.close();
		con.close();
	}
	public void delete(String mid) throws Exception {
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("2. DB 연결 성공");

		// 3. SQL 문 결정

		String sql = "delete from members where mid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mid);
		ps.executeUpdate();

		System.out.println("3. SQL문 결정 성공");

		// SQL문 전송 요청

		System.out.println("4. SQL문 전송 요청 성공");
		ps.close();
		con.close();
	}
}
