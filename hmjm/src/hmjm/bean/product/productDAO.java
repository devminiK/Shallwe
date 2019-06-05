package hmjm.bean.product;
/* ���� �ۼ� */
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
	private int p_num;			//���� ������ȣ
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
	
	//�ۼ��� ������ ������ǰ���(product), db����
	//�ۼ��� �Խñ��� db�� ����
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
