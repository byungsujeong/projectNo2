package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MembersDAO {
	
	public MembersDTO select(MembersDTO dto) throws Exception {
	
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select * from members where mid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getMid());

		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			
			dto.setMid(rs.getString(1));
			dto.setName(rs.getString(3));
				
		}

		rs.close();
		ps.close();
		con.close();

		return dto;
		
	}
	
}
