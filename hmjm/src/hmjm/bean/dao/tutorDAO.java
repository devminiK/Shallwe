package hmjm.bean.dao;

import java.sql.*;
import javax.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hmjm.bean.vo.*;

public class tutorDAO {
	private static tutorDAO instance = new tutorDAO();
	private static tutorDAO getInstance() {
		return instance;
	}
	private tutorDAO() {}
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
	
	public void insertTutor(tutorVO vo) {
		try {
			conn = getConnection();
			String sql = "insert into tutor values (tutor_seq.nextval,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getT_nick());
			pstmt.setString(2, vo.getT_selfimg());
			pstmt.setString(3, vo.getT_school());
			pstmt.setString(4, vo.getT_major());
			pstmt.setInt(5, vo.getT_idcard());
			pstmt.setString(6, vo.getT_c());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
	}
}


