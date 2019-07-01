package hmjm.bean.product_cat_region;
/* ���� �ۼ� */
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class productcatregionDAO {
	public static productcatregionDAO instance = new productcatregionDAO();
	public static productcatregionDAO getInstance() { return instance; }

	private productcatregionDAO() {};

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String user="TEAM03", pass="TEAM03";
			String url="jdbc:oracle:thin:@nullmaster.iptime.org:1521:xe";
			conn = DriverManager.getConnection(url,user,pass);	
		}
		catch(Exception e){ e.printStackTrace(); }
		return conn;
	}
	
	//������ȣ�� �ش� ���� �̸� ��������
	public String getRegionName(int num) {
		String reName ="";
		String sql="";
		
		try {
			conn = getConnection();

			sql ="select cr_name from product_cat_region where cr_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				reName = rs.getString(1);	//ù��° �÷� �� ������(1���� �����ϱ⶧��)
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return reName;
	}

}
