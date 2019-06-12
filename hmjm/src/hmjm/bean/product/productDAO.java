package hmjm.bean.product;
/* ���� �ۼ� */
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hmjm.bean.product.*;


public class productDAO {
	public static productDAO instance = new productDAO();
	public static productDAO getInstance() { return instance; }

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

	
	
	//�ۼ��� ���� ��� �� DB�� ����_ok
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
			pstmt.setInt(5, product.getP_time());
			pstmt.setInt(6, product.getP_cost());
			pstmt.setString(7, product.getP_memo());
			pstmt.setInt(8, product.getP_count_min());
			pstmt.setInt(9, product.getP_count_max());
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
	
	//��ǰ ��ȣ�� ������ ��������..ing
		public productVO getProduct(int p_num)
				throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			productVO vo = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select * from product where p_num = ?");
				pstmt.setInt(1, p_num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					vo = new productVO();
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

	//�ش� ��ȣ�� ���� ������ �����´�. _����  �Ķ���� �̸��Ϸ� ��, ���� p_num���� ������ �� -..?
	public productVO getProduct2(String p_email)
			throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		productVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from product where p_email = ?");
			pstmt.setString(1, p_email);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo = new productVO();
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


	//���� ������ �� �˻��ϱ�_ok
	public int getProductNum() {
		int x = 0;

		try {
			conn = getConnection();

			String sql ="select last_number from user_sequences where sequence_name=upper('product_seq')";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				x = rs.getInt(1);	//ù��° �÷� �� ������(1���� �����ϱ⶧��)
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x-1;	//���� ������ ���� +1�� ���� ������ ������ 1�� ����
	}

	//���ʿ�..?  //�ش� ��ȣ�� ��ǰ�� �����ϴ��� ���θ� Ȯ���ϱ� ���� , �Ķ���� ���Ŀ�  p_num ���� �����Ұ�
	/*
	public boolean productCheck(int p_num) {
		boolean result = false;

		try {
			conn = getConnection();
			String sql ="select * from product where p_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = true;
			}else {
				result = false;
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
	*/


	//����� ��ü ���� ���� �� 0611���Ƽ���
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
				x= rs.getInt(1); //0���ƴϰ� 1������ ����
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




	//...?
	public List getProduct(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List productList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from product order by p_num desc,?,?");
			pstmt.setInt(1, start); 
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				productList = new ArrayList(end); 
				do{ 
					productVO vo= new productVO();
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
					productList.add(vo);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}


		return productList;
	}
}