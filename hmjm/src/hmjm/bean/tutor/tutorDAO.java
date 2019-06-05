package hmjm.bean.tutor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import hmjm.bean.tutor.tutorVO;

public class tutorDAO {
	private static tutorDAO instance = new tutorDAO();
	public static tutorDAO getInstance() {
		return instance;
	}
	private tutorDAO() {}
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() {
		try {
			Context ctx = new InitialContext(); //context.xml. ���� ȹ��
			Context env = (Context)ctx.lookup("java:comp/env"); //ctx���� java�� ȯ�漳����Ҹ� ȹ��
			DataSource ds = (DataSource)env.lookup("jdbc/xe"); //Ŀ�ؼ� ��ü
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void insertTutor(tutorVO vo) {
		try {
			conn = getConnection();
			String sql = "insert into tutor values (tutor_seq.nextval,?,?,?,?,?,sysdate,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getT_selfimg());
			pstmt.setString(2, vo.getT_school());
			pstmt.setString(3, vo.getT_major());
			pstmt.setString(4, vo.getT_idcard());
			pstmt.setString(5, vo.getT_c());
			pstmt.setString(6, vo.getT_email());
			pstmt.setString(7, vo.getT_nick());
		
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
	}
	
	public tutorVO getMember(String t_email)
			throws Exception{
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				tutorVO vo = null;
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement(
					"select * from tutor where t_email = ?");
					pstmt.setString(1, t_email);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						vo = new tutorVO();
						vo.setT_num(rs.getInt("t_num"));
						vo.setT_selfimg(rs.getString("t_selfimg"));
						vo.setT_school(rs.getString("t_school"));
						vo.setT_major(rs.getString("t_major"));
						vo.setT_idcard(rs.getString("t_idcard"));
						vo.setT_c(rs.getString("t_c"));
						vo.setT_reg(rs.getTimestamp("t_reg"));
						vo.setT_email(rs.getString("t_email"));
						vo.setT_nick(rs.getString("t_nick"));
						
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
	
	//���� �ڿ��ڰ� Ʃ�͵���� �ߴ��� ���ߴ��� üũ�� ����, �׽�Ʈ ���� ����_����
	public boolean userCheck(String t_email) 
			throws Exception {
				Connection conn = null;
		        PreparedStatement pstmt = null;
				ResultSet rs= null;
				boolean result=false;
		        
				try {
		            conn = getConnection();
		            
		            pstmt = conn.prepareStatement(
		            	"select passwd from TUTOR where t_email = ?");
		            pstmt.setString(1, t_email);
		            rs= pstmt.executeQuery();

					if(rs.next()){
						String estr= rs.getString("t_email"); 
						if(estr!= null)//�̸����� tutor���̺� ��������������, null��
							result=true;
						//else
							//result= false; //��й�ȣ Ʋ��
					}else
						result= false;//�ش� ���̵� ����
					
		        } catch(Exception ex) {
		            ex.printStackTrace();
		        } finally {
					if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
				return result;
			}
	
	public boolean tutorCheck(String t_email) {
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from tutor where t_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_email);
			
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
	

	public void updateTutor(tutorVO vo)//Ʃ�� ���� ����
			throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update tutor set t_school=?, t_major=?, t_idcard=?, t_c=?, t_nick=? where t_email=?");		
			pstmt.setString(1, vo.getT_school());
			pstmt.setString(2, vo.getT_major());
			pstmt.setString(3, vo.getT_idcard());
			pstmt.setString(4, vo.getT_c());
			pstmt.setString(5, vo.getT_nick());
			pstmt.setString(6, vo.getT_email());
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
}
	
	
	
	
	
	
	
	
	
	
	
