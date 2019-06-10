package hmjm.bean.product;
/* ���� �ۼ� */
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hmjm.bean.product.*;
import web.bean.vo.MemberVO;


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
			
			sql = "insert into product values(product_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getP_email());
			pstmt.setString(2, product.getP_category());
			pstmt.setString(3, product.getP_classname());
			pstmt.setString(4, product.getP_self());
			pstmt.setString(5, product.getP_time());
			pstmt.setInt(6, product.getP_cost());
			pstmt.setInt(7, product.getP_count_min());
			pstmt.setInt(8, product.getP_count_max());
			pstmt.setString(9, product.getP_memo());
			pstmt.setString(10, product.getP_class1());
			pstmt.setString(11, product.getP_class2());
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
	
	//�ش� ��ȣ�� ���� ������ �����´�. _����� �̸��Ϸ� ��
	public productVO getProduct(String p_email) {
		productVO vo = null;
		
		try {
				conn = getConnection();
				String sql= "select * from product where p_email = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, p_email);
				rs = pstmt.executeQuery();
				
				rs.next();
				vo = new productVO();
				vo.setP_num(rs.getInt("p_num"));
				vo.setP_email(rs.getString("p_email"));
				vo.setP_category(rs.getString("p_category"));
				vo.setP_classname(rs.getString("p_classname"));
				vo.setP_self(rs.getString("p_self"));
				vo.setP_time(rs.getString("p_time"));
				vo.setP_cost(rs.getInt("p_cost"));
				vo.setP_memo(rs.getString("p_memo"));
				vo.setP_count_min(rs.getInt("p_count_min"));
				vo.setP_count_max(rs.getInt("p_count_max"));
				vo.setP_class1(rs.getString("p_class1"));
				vo.setP_class2(rs.getString("p_class2"));
				vo.setP_class3(rs.getString("p_class3"));
				vo.setP_class4(rs.getString("p_class4"));
				
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
			return vo;
			}
	


}
