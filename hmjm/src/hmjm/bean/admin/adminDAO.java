package hmjm.bean.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hmjm.bean.member.memberVO;
import hmjm.bean.product.productVO;
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
	public boolean adminLoginCheck(String apw) {
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from member where m_email='admin' and m_pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, apw);
			//pstmt.setString(2, apw);
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
	//members list
	public ArrayList<memberVO> getAllMember(){
		ArrayList<memberVO> list = null;
		try {
			conn = getConnection();
			String sql = "select * from member order by m_num";
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
			pstmt = conn.prepareStatement("select * from member where m_num= ?");
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
			pstmt = conn.prepareStatement("update member set m_name=?,m_phone=?,m_pw=?, m_usertype=?, m_email=? where m_num=?");
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
	
	//zero member
	public void zeroMember(int num)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update member set m_usertype=0 where m_num=?");
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
			pstmt = conn.prepareStatement("delete from member where m_num=?");
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
				x= rs.getInt(1);
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
	//products list
	public ArrayList<productVO> getAllProduct(){
		ArrayList<productVO> list = null;
		try {
			conn = getConnection();
			String sql = "select * from product order by p_num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<productVO>();
			while(rs.next()) {
				productVO vo = new productVO();
				vo.setP_num(rs.getInt("p_num"));
				vo.setP_email(rs.getString("p_email"));
				vo.setP_category(rs.getString("p_category"));
				vo.setP_classname(rs.getString("p_classname"));
				vo.setP_self(rs.getString("p_self"));
				vo.setP_time(rs.getInt("p_time"));
				vo.setP_cost(rs.getInt("p_cost"));
				vo.setP_memo(rs.getString("p_memo"));
				vo.setP_count_min(rs.getInt("p_count_min"));
				vo.setP_count_max(rs.getInt("p_count_max"));
				vo.setP_class1(rs.getString("p_class1"));
				vo.setP_class2(rs.getString("p_class2"));
				vo.setP_class3(rs.getString("p_class3"));
				vo.setP_class4(rs.getString("p_class4"));
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
	
	//count products
	public int getProductCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from product");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1);
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
	
	//delete product
	public void deleteProduct(int num)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from product where p_num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	//insert product
	//update product
	//get product detail
	/********** product info end **********/
	
	
	/********** message info start **********/
	//messages list
	public ArrayList<messageVO> getAllMsg(){
	ArrayList<messageVO> list = null;
	try {
		conn = getConnection();
		String sql = "select * from message order by s_num";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		list = new ArrayList<messageVO>();
		while(rs.next()) {
			messageVO vo = new messageVO();
			vo.setS_num(rs.getInt("s_num"));
			vo.setS_content(rs.getString("s_content"));
			vo.setS_send(rs.getString("s_send"));
			vo.setS_receive(rs.getString("s_receive"));
			vo.setS_reg(rs.getTimestamp("S_reg"));
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
	
	//count messages
	public int getMsgCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from message");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1);
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
	
	//delete message
		public void deleteMsg(int num)
				throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("delete from message where s_num=?");
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
		}
	/********** message info end **********/
	
		
	/********** tutor info start **********/
	//members list
	public ArrayList<tutorVO> getAllTutor(){
		ArrayList<tutorVO> list = null;
		try {
			conn = getConnection();
			String sql = "select * from tutor order by t_num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<tutorVO>();
			while(rs.next()) {
				tutorVO vo = new tutorVO();
				vo.setT_num(rs.getInt("t_num"));
				vo.setT_school(rs.getString("t_school"));
				vo.setT_major(rs.getString("t_major"));
				vo.setT_idcard(rs.getString("t_idcard"));
				vo.setT_c(rs.getString("t_c"));
				vo.setT_reg(rs.getTimestamp("t_reg"));
				vo.setT_nick(rs.getString("t_nick"));
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
	//count tutors
	public int getTutorCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from tutor");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1);
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
	
	//delete account
	public void deleteTutor(int num)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from tutor where t_num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	/********** tutor info end **********/
}
