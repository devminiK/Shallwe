package hmjm.bean.product;
/* 성민 작성 */
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

	
	
	//작성한 수업 등록 글 DB에 삽입_성민ok
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
	
		//상품 번호로 정보를 꺼내오기_성민ok
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

	//수업번호와 아이디 일치로 등록한 수업인지 구분하기 위해
		
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

	//최종 시퀀스 값 검색하기_성민ok
	public int getProductNum() {
		int x = 0;

		try {
			conn = getConnection();

			String sql ="select last_number from user_sequences where sequence_name=upper('product_seq')";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				x = rs.getInt(1);	//첫번째 컬럼 값 꺼내기(1부터 시작하기때문)
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x-1;	//최종 시퀀스 값은 +1된 값이 나오기 때문에 1을 빼줌
	}

	//저장된 전체 글의 수를 얻어냄 0611건훈수정
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
				x= rs.getInt(1); //0번아니고 1번부터 시작
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
//튜터별 강의 수 파악하기위해
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
				x= rs.getInt(1); //0번아니고 1번부터 시작
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


	//전체리스트
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
	//서브 카테고리 리스트
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
	//튜터가 등록한 수업리스트
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
