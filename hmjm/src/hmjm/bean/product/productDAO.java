package hmjm.bean.product;
/* 성민 작성 */
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
	private int p_num;			//수업 고유번호
	private String p_email;		//튜터의 이메일	-가져올것
	private String p_category;	//등록 상품(수업)의 카테고리
	private String p_classname;	//등록 상품(수업)의 이름
	private String p_self;		//튜터의 자기 소개
	private String p_class1;	//소개_튜터소개
	private String p_class2;	//소개_튜터소개
	private String p_class3;	//소개_튜터소개
	private String p_class4;	//소개_튜터소개
	private String p_time;		//수업 소요 시간
	private String p_cost;		//가격
	private int p_count_min;	//인원 최소 인원
	private int p_count_max;	//인원 최대 인원
	private String p_memo;		//덧 붙이는 말
	private String imgsrc;		//이미지파일을 가져오기위한 변수 추가 작성
	 */
	
	//작성한 정보로 수업상품등록(product), db삽입
	//작성한 게시글을 db에 삽입
		 public void insertProduct(productVO product) {	    
		    
		      int num=article.getNum();
		      int ref=article.getRef();
		      int re_step=article.getRe_step();
		      int re_level=article.getRe_level();
		      
		      int number=0;
		      String sql="";
		      try {
		         conn = getConnection(); 
		         pstmt = conn.prepareStatement("select max(num) from board");
		         rs = pstmt.executeQuery();
		         if (rs.next()) 
		            number=rs.getInt(1)+1;   
		         else
		            number=1; 
		         
		         if (num!=0) 
		         { 
		            sql="update board set re_step=re_step+1 where ref= ? and re_step> ?";
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setInt(1, ref);
		            pstmt.setInt(2, re_step);
		            pstmt.executeUpdate();
		            re_step=re_step+1;
		            re_level=re_level+1;
		         }else{ 
		            ref=number;
		            re_step=0;
		            re_level=0;
		         }
		 
		         sql = "insert into board(num,writer,email,subject,passwd,reg_date,";
		         sql+="ref,re_step,re_level,content,ip) values(board_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
		            pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, article.getWriter());
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
	

}
