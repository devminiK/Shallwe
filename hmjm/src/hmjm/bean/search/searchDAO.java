package hmjm.bean.search;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

import hmjm.bean.product.productVO;

public class searchDAO {
	private static searchDAO instance = new searchDAO();
	public static searchDAO getInstance() {
		return instance;
	}
	private searchDAO() {}
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Connection getConnection() {
		try {
			Context ctx = new InitialContext(); //context.xml. Á¤º¸ È¹µæ
			Context env = (Context)ctx.lookup("java:comp/env"); //ctx¿¡¼­ javaÀÇ È¯°æ¼³Á¤¿ä¼Ò¸¸ È¹µæ
			DataSource ds = (DataSource)env.lookup("jdbc/xe"); //Ä¿³Ø¼Ç °´Ã¼
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public ArrayList<productVO> getAllProduct(String search){
		ArrayList<productVO> list = new ArrayList<productVO>();
		try {
			conn = getConnection();
			String sql =
				"select * from product where"
				+ " (p_classname || p_class1 || p_class2 || p_class3 || p_class4 || p_category || p_self)"
				+ " like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			list = new ArrayList<productVO>();
			while(rs.next()) {
				productVO vo = new productVO();
				vo.setP_classname(rs.getString("p_classname"));
				vo.setP_class1(rs.getString("p_class1"));
				vo.setP_class2(rs.getString("p_class2"));
				vo.setP_class3(rs.getString("p_class3"));
				vo.setP_class4(rs.getString("p_class4"));
				vo.setP_category(rs.getString("p_category"));
				vo.setP_self(rs.getString("p_self"));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return list;
	}
	
}
