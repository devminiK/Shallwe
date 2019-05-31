package hmjm.bean.dao;
/* 성민 작성 */
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hmjm.bean.vo.*;


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
	public void insertProduct(productVO product) {
		String
		
	}
	
	
	

}
