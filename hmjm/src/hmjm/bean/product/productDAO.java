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

	
	
	//�ۼ��� ���� ��� �� DB�� ����_����ok
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
			pstmt.setString(5, product.getP_class1());
			pstmt.setString(6, product.getP_class2());
			pstmt.setString(7, product.getP_class3());
			pstmt.setString(8, product.getP_class4());
			pstmt.setInt(9, product.getP_time());
			pstmt.setInt(10, product.getP_cost());
			pstmt.setInt(11, product.getP_count_min());
			pstmt.setInt(12, product.getP_count_max());
			pstmt.setString(13, product.getP_memo());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
		//��ǰ ��ȣ�� ������ ��������_����ok
		public productVO getProduct(int p_num)
				throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			productVO vo = null;
			String sql="";
			try {
				conn = getConnection();
				sql ="select * from product where p_num = ?";
				pstmt = conn.prepareStatement(sql);
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

	//������ȣ�� ���̵� ��ġ�� ����� �������� �����ϱ� ����
		
	public productVO getProduct2(String id,int num)
			throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		productVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from product where p_email = ? and p_num=?");
			pstmt.setString(1,id);
			pstmt.setInt(2, num);
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
	
	public productVO getProduct3(String p_category)
			throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		productVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from product where p_category = ?");
			pstmt.setString(1, p_category);
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
	public productVO getProduct4(String p_email)
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

	//���� ������ �� �˻��ϱ�_����ok
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
//Ʃ�ͺ� ���� �� �ľ��ϱ�����
	public int getProductCount2(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from product where p_email=?");
			pstmt.setString(1, id);
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


	//��ü����Ʈ
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
	//���� ī�װ� ����Ʈ
	public List getProductSub(String cate, int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List cateSubList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select p_num,p_email,p_category,p_classname,p_self,p_time,p_cost,p_memo,p_count_min,p_count_max,p_class1,p_class2,p_class3,p_class4,r"
					+ " from(select p_num,p_email,p_category,p_classname,p_self,p_time,p_cost,p_memo,p_count_min,p_count_max,p_class1,p_class2,p_class3,p_class4,rownum r"
					+ " from(select * from product where p_category =? order by p_num)"
					+ " order by p_num) where r>=? and r<=?");
			pstmt.setString(1, cate);
			pstmt.setInt(2, start); 
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cateSubList = new ArrayList(end); 
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
					cateSubList.add(vo);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return cateSubList;
	}
	//Ʃ�Ͱ� ����� ��������Ʈ
	public List getProductTutor(String email, int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List tutorProductList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select p_num,p_email,p_category,p_classname,p_self,p_time,p_cost,p_memo,p_count_min,p_count_max,p_class1,p_class2,p_class3,p_class4,r"
					+ " from(select p_num,p_email,p_category,p_classname,p_self,p_time,p_cost,p_memo,p_count_min,p_count_max,p_class1,p_class2,p_class3,p_class4,rownum r"
					+ " from(select * from product where p_email =? order by p_num)"
					+ " order by p_num) where r>=? and r<=?");
			pstmt.setString(1, email);
			pstmt.setInt(2, start); 
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				tutorProductList = new ArrayList(end); 
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
					tutorProductList.add(vo);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return tutorProductList;
	}
}
