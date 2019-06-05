package hmjm.bean.product;
/* ���� �ۼ� */
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hmjm.bean.product.*;


public class productDAO {
	public static productDAO instance = new productDAO();
	public static productDAO getInstance() {
		return instance;
	}

	private productDAO() {};

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
	/*
	private int p_num;			//���� ������ȣ(����)
	private String p_email;		//Ʃ���� �̸���	-�����ð�
	private String p_category;	//��� ��ǰ(����)�� ī�װ�
	private String p_classname;	//��� ��ǰ(����)�� �̸�
	private String p_self;		//Ʃ���� �ڱ� �Ұ�
	private String p_class1;	//�Ұ�_Ʃ�ͼҰ�
	private String p_class2;	//�Ұ�_Ʃ�ͼҰ�
	private String p_class3;	//�Ұ�_Ʃ�ͼҰ�
	private String p_class4;	//�Ұ�_Ʃ�ͼҰ�
	private String p_time;		//���� �ҿ� �ð�
	private String p_cost;		//����
	private int p_count_min;	//�ο� �ּ� �ο�
	private int p_count_max;	//�ο� �ִ� �ο�
	private String p_memo;		//�� ���̴� ��
	private String imgsrc;		//�̹��������� ������������ ���� �߰� �ۼ�
	 */

	//�ۼ��� ���� ��� �� DB�� ����
	public void insertProduct(productVO product) {	    

		String sql="";
		try {
			conn = getConnection(); 
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();

			sql = "insert into product values(product_seq.nextval,?,?,?,?,?,?,?,?,?,?,? ?,?)"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getP_email());
			pstmt.setString(2, product.getP_category());
			pstmt.setString(3, product.getP_classname());
			pstmt.setString(4, product.getP_self());
			pstmt.setString(5, product.getP_time());
			pstmt.setInt(6, product.getP_cost());
			pstmt.setString(7, product.getP_memo());
			pstmt.setInt(8, product.getP_count_min());
			pstmt.setInt(9, product.getP_count_max());
			pstmt.setString(10, product.getP_class1());
			pstmt.setString(11, product.getP_class1());
			pstmt.setString(12, product.getP_class3());
			pstmt.setString(13, product.getP_class4());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}


}
