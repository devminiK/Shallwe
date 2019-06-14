package hmjm.bean.test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hmjm.bean.test.productCategoryVO;

public class productCategoryDAO {
	public static productCategoryDAO instance = new productCategoryDAO();
	public static productCategoryDAO getInstance() { return instance;}
	
	private productCategoryDAO() {};
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
	

	public ArrayList<productCategoryVO> getAllCategory(String c_coderef) {
		ArrayList<productCategoryVO> alist = new ArrayList<productCategoryVO>();
		try { conn = getConnection();
		String sql = "select * from product_category where c_coderef = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,c_coderef);
		rs= pstmt.executeQuery();
		while(rs.next()) {
			productCategoryVO vo = new productCategoryVO();
			vo.setC_name(rs.getString("c_name"));
			vo.setC_code(rs.getString("c_code"));
			vo.setC_coderef(rs.getString("c_coderef"));
			alist.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
			}finally {
				if(rs != null){try {rs.close();}catch(SQLException e) {}}
				if(pstmt != null){try {pstmt.close();}catch(SQLException e) {}}
				if(conn != null){try {conn.close();}catch(SQLException e) {}}
				}
				return alist;
				}

	}
