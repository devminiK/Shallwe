package hmjm.bean.search;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

import hmjm.bean.product.productVO;
import hmjm.bean.search.searchVO;

public class searchDAO {
	private static searchDAO instance = new searchDAO();
	public static searchDAO getInstance() { return instance; }
	private searchDAO() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
		return ds.getConnection();
	}
	
	public List getArticles(String search) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List searchList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from product where"
					+ " (p_classname || p_class1 || p_class2 || p_class3 || p_class4 || p_category || p_self)"
					+ " like '%?%'");
			pstmt.setString(1, search);		
			
			rs = pstmt.executeQuery();
					if (rs.next()) {
						searchList = new ArrayList(); 
						do{ 
							productVO article= new productVO();
							article.setP_email(rs.getString("p_email"));
							article.setP_classname(rs.getString("p_classname"));
							article.setP_self(rs.getString("p_self"));
							article.setP_cost(rs.getString("p_cost"));
							
							searchList.add(article); 
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return searchList;
	}
	
}
