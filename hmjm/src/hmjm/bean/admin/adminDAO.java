package hmjm.bean.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hmjm.bean.member.memberDAO;
import hmjm.bean.member.memberVO;
import hmjm.bean.product.productVO;
import hmjm.bean.review.reviewVO;
import hmjm.bean.message.messageVO;
import hmjm.bean.tutor.tutorVO;


public class adminDAO {
	private static adminDAO instance = new adminDAO();
	public static adminDAO getInstance() {
		return instance;
	}
	private adminDAO() {}
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
	
	//admin login check
	public boolean adminLoginCheck(String aid, String apw) {
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from member where m_email=? and m_pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aid);
			pstmt.setString(2, apw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
		}
		return result;
	}
	
	/********** member info start **********/
	//member list
	public ArrayList<memberVO> getAllMember(){
		ArrayList<memberVO> list = null;
		try {
			conn = getConnection();
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<memberVO>();
			while(rs.next()) {
				memberVO vo = new memberVO();
				vo.setM_num(rs.getInt("m_num"));
				vo.setM_email(rs.getString("m_email"));
				vo.setM_pw(rs.getString("m_pw"));
				vo.setM_name(rs.getString("m_name"));
				vo.setM_phone(rs.getString("m_phone"));
				vo.setM_reg(rs.getTimestamp("m_reg"));
				vo.setM_usertype(rs.getInt("m_usertype"));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
		}
		return list;
	}
	
	//get member info
	public memberVO getMember(int num)
			throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		memberVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from member where m_num= ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo = new memberVO();
				vo.setM_num(rs.getInt("m_num"));
				vo.setM_email(rs.getString("m_email"));
				vo.setM_pw(rs.getString("m_pw"));
				vo.setM_name(rs.getString("m_name"));
				vo.setM_phone(rs.getString("m_phone"));
				vo.setM_reg(rs.getTimestamp("m_reg"));
				vo.setM_usertype(rs.getInt("m_usertype"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return vo;
	}
	
	//edit member info
	public void updateMember(memberVO vo)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"update member set m_name=?,m_phone=?,m_pw=?, m_usertype=?, m_email=? where m_num=?");
			pstmt.setString(1, vo.getM_name());
			pstmt.setString(2, vo.getM_phone());
			pstmt.setString(3, vo.getM_pw());
			pstmt.setInt(4, vo.getM_usertype());
			pstmt.setString(5, vo.getM_email());
			pstmt.setInt(6, vo.getM_num());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	//delete member
	public void zeroMember(int num)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"update member set m_usertype=0 where m_num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	//delete account
	public void deleteAccount(int num)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"delete from member where m_num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	//count members
	public int getMemberCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from member");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); //Ã¹¹øÂ° ÄÃ·³ °ª
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; 
	}
	/********** member info end **********/
	
	
	/********** product info start **********/
	
	/********** product info end **********/
	
	
	/********** message info start **********/
	
	/********** message info end **********/
	
}
