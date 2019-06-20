<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "hmjm.bean.buy.*" %>
<%@ page import = "hmjm.bean.tutor.*" %>
<%@ page import = "hmjm.bean.classtime.*" %>
<%@ page import = "hmjm.bean.classimg.*" %>
<%@ page import = "java.util.List" %>
<jsp:useBean id="vo" class="hmjm.bean.tutor.tutorVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>

<%
	
	
	String id = "test@naver.com";
	
	int num = Integer.parseInt(request.getParameter("p_num"));
	String pageNum = request.getParameter("pageNum");

	//classtimeDAO time = classtimeDAO.getInstance();
	//classtimeVO t = time.getClasstime(num);

	//classimgDAO aa  = classimgDAO.getInstance();
	//classimgVO bb = aa.getImg(num);
//내수업인지 신청한 수업인지 구별하기 위해 불러오는 값..테스트중

	tutorDAO tu = tutorDAO.getInstance();
	tutorVO e = tu.getMember(id);
	
	buyDAO buyer = buyDAO.getInstance();
	buyVO b = buyer.getBuy(id);
	buyVO c =buyer.getBuy2(num);
	int bbb = c.getB_productnumber();
	
//////////////////////////////////////////
	productDAO dbPro = productDAO.getInstance();
	productVO v = dbPro.getProduct(num);
	
	productVO tutor = dbPro.getProduct4(id);
	//int ttt = tutor.getP_num();
%>
<% 	
if(id!==null){
	if(ee!=null){
		if(vd!=null){
			if(vc!=null){
				내가등록한글
				}else{
					if(b!=null){
						if(c!=null){
								구매한글
								}else{
									신청하기
								}
			
							}else{
								청하기
								}
					
				}
			
		}else{
				if(b!=null){
					if(c!=null){
						구매한글
						}else{
							신청하기
						}
			
					}else{
						신청하기
						}
			
				}
				
		}else{
				if(b!=null){
					if(c!=null){
						구매한글
					}else{
						신청하기
					}
			
				}else{
					신청하기
				}	
			
			}
	}else{
		비로그인 신청
	}

%>



		
		