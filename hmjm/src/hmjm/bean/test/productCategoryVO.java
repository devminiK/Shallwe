package hmjm.bean.test;

public class productCategoryVO {
	
/* 
 * c_name varchar2(50)    not null,
   c_code varchar2(50)    not null,
   c_coderef  varchar2(50)    null,
 
 */
	
	private String c_name;
	private String c_code;
	private String c_coderef;
	
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public String getC_coderef() {
		return c_coderef;
	}
	public void setC_coderef(String c_coderef) {
		this.c_coderef = c_coderef;
	}
	
	
}
