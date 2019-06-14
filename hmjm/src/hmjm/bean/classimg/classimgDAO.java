package hmjm.bean.classimg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hmjm.bean.classimg.classimgVO;

public class classimgDAO {	/*���� �ۼ�*/
	
	private static classimgDAO instance = new classimgDAO();
	
	public static classimgDAO getInstance() {
		return instance;
	
	}
	private classimgDAO() {}
	
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
	//(��ǰ ��� ������)�̹��� ����ϱ�_ing(version1)
		public void insertClassimg1(int a, String b, String c) {	      

		      String sql="";  
		      try {
		         conn = getConnection(); 
		        
		         sql = "insert into classimg values(classimg_seq.NEXTVAL,?,?,?)";
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, a);//������ȣ�� �����ͼ� �����Ű��.
		         pstmt.setString(2, b);
		         pstmt.setString(3, c);
		         
		         pstmt.executeUpdate();
		      } catch(Exception ex) {
		         ex.printStackTrace();
		      } finally {
		         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		      }
		   }
		
	//(��ǰ ��� ������)�̹��� ����ϱ�_ing(version2)
	public void insertClassimg(classimgVO classimg) {	      

	      String sql="";  
	      try {
	         conn = getConnection(); 
	        
	         sql = "insert into classimg values(classimg_seq.NEXTVAL,?,?,?)";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, classimg.getCi_classnum());//������ȣ�� �����ͼ� �����Ű��.
	         pstmt.setString(2, classimg.getCi_name());
	         pstmt.setString(3, classimg.getCi_realname());
	         
	         pstmt.executeUpdate();
	      } catch(Exception ex) {
	         ex.printStackTrace();
	      } finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	   }
	
	
	
	//(�ش� ��ǰ��ȣ��) �̹��� ����(��ǰ��ȣ,�̹������) ������_�̿ϼ�
	
	
	//�̹��� ����
	
	//�̹��� ����

}
