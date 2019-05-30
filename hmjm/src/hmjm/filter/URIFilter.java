package hmjm.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.FileWriter;
import java.util.Date;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class URIFilter implements Filter {
	
	
	PrintWriter writer = null;
	Date day = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		try {
			//�ش� ��η� �� ����ϵ����Ѵ�.
			writer = new PrintWriter(new FileWriter("d://log//market.log"), true);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();			
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		
		//��¥ �Է�
		day = new Date();
		writer.print("["+day+"] ");				
		
	    writer.println(req.getRequestURI());   //� �������� ����Ǵ��� ����Ѵ�.
	   
	    chain.doFilter(request, response);	//�帧�� �̾������� ����.

		
		
		
		
	}
	
	@Override
	public void destroy() {	
		
		writer.close();//�������
	}
}
