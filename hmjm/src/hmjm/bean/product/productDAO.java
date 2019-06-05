package hmjm.bean.product;
/* 성민 작성 */
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hmjm.bean.vo.*;
import web.bean.vo.BoardVO;


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
	 * private int p_num;
		private String p_email;
		private String p_category;
		private String p_classname;
		private String p_nick;
		private String p_selfimg;
		private String p_name;
		private String p_self;
		private String p_class;
		private String p_time;
		private String p_cost;
		private int p_student;
		private String p_memo;
		private String imgsrc;	//이미지파일을 가져오기위한 변수 추가 작성
	 * 
	 * 
	 * */
	//어떠한 기능이 필요한지 파악중 .2019.05.31
	
	//작성한 정보로 수업상품등록(product), db삽입
	//작성한 게시글을 db에 삽입
	/*
		 public void insertArticle(productVO product) {	      
		      
		      int number=0;
		      String sql="";
		      try {
		         conn = getConnection(); 
		         pstmt = conn.prepareStatement("select max(num) from product");
		         rs = pstmt.executeQuery();
		         if (rs.next()) 
		            number=rs.getInt(1)+1;   
		         else
		            number=1; 
		         
		 
		         sql = "insert into product(num,writer,email,subject,passwd,reg_date,";
		         sql+="ref,re_step,re_level,content,ip) values(board_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
		            pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, product.getWriter());
		         pstmt.setString(2, article.getEmail());
		         pstmt.setString(3, article.getSubject());
		         pstmt.setString(4, article.getPasswd());
		         pstmt.setTimestamp(5, article.getReg_date());
		         pstmt.setInt(6, ref);
		         pstmt.setInt(7, re_step);
		         pstmt.setInt(8, re_level);
		         pstmt.setString(9, article.getContent());
		         
		         pstmt.setString(10, article.getIp());
		         pstmt.executeUpdate();
		      } catch(Exception ex) {
		         ex.printStackTrace();
		      } finally {
		         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		      }
		   }
	
	
	*/
	

}
