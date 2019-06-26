/* 
 * 검색기능 DAO, productVO사용
 * hmjm/Home/header.jsp
 * hmjm/Home/search.jsp
 */
package hmjm.bean.search;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

import hmjm.bean.product.productVO;

public class searchDAO {
	private static searchDAO instance = new searchDAO();
	public static searchDAO getInstance() {
		return instance;
	}
	private searchDAO() {}
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Connection getConnection() {
		try {
			Context ctx = new InitialContext(); //context.xml. 정보 획득
			Context env = (Context)ctx.lookup("java:comp/env"); //ctx에서 java의 환경설정요소만 획득
			DataSource ds = (DataSource)env.lookup("jdbc/xe"); //커넥션 객체
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/*
	 *  product 테이블의 
	 * classname/class1/class2/class3/class4/category/self 컬럼의 내용에서
	 * 입력한 글자와 일치하는 내용을 전부 표시
	 */
	public ArrayList<productVO> getAllProduct(String search){
		ArrayList<productVO> list = new ArrayList<productVO>();
		try {
			conn = getConnection();
			String sql =
				"select * from product where"
				+ " (p_classname || p_class1 || p_class2 || p_class3 || p_class4 || p_category || p_self)"
				+ " like ? order by p_num";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			list = new ArrayList<productVO>();
			while(rs.next()) {
				productVO vo = new productVO();
				vo.setP_num(rs.getInt("p_num"));
				vo.setP_classname(rs.getString("p_classname"));
				vo.setP_class1(rs.getString("p_class1"));
				vo.setP_class2(rs.getString("p_class2"));
				vo.setP_class3(rs.getString("p_class3"));
				vo.setP_class4(rs.getString("p_class4"));
				vo.setP_category(rs.getString("p_category"));
				vo.setP_self(rs.getString("p_self"));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return list;
	}
	
}
