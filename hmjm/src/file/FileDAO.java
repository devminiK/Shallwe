package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/*test용 파일, 추후 삭제할것_성민*/
public class FileDAO {

	public static FileDAO instance = new FileDAO();
	public static FileDAO getInstance() { return instance; }

	private FileDAO() {};

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
	//version1
	public int insert1(String fileName, String fileRealName) {	    
		String sql="";
		try {
			conn = getConnection(); 
			sql = "insert into filetest values(?,?)"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			
			return pstmt.executeUpdate(); //정상 반환 되면 1이 출력
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return -1;
	}
	
	//version2
	public void insert2(FileVO vo) {	    
		String sql="";
		try {
			conn = getConnection(); 
			sql = "insert into filetest values(?,?)"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getFileName());
			pstmt.setString(2, vo.getFileRealName());
			
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
