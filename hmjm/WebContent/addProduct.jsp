<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="hmjm.bean.dao.memberDAO" %>
<%@ page import="hmjm.bean.vo.memberVO" %>
<%@ page import="hmjm.bean.dao.tutorDAO" %>
<%@ page import="hmjm.bean.vo.tutorVO" %>

<%-- 19.06.03���� �ۼ� , �̿ϼ�, --%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String preUser = (String)session.getAttribute("loginId");//���� ����,�̸����� ��

	//�Ϲ����� ����
	memberDAO mdao = memberDAO.getInstance();	
	memberVO mvo = mdao.getMember(preUser);	
	
	//Ʃ�� ��� ����
	//nick�� �޾ƿ�������
	tutorDAO tdao = tutorDAO.getInstance();		
	tutorVO tvo = tdao.getMember(preUser);
%>


<html>
<head>
<title>���� ���</title>
<script language="JavaScript" src="script.js"></script>
</head>
<%--
	//Ʃ�� ����� �����ʰ�, �������� �� (Ʃ�� ����x(���� ����x)
	if(session.getAttribute("memId")==null){--%>
<%-- 
		<script>
			alert("Ʃ�� �⺻ �Է� �������� [�޴���ȭ ��ȣ], [�ź�/�з� ����] ������ ���� ������ּ���");
			window.location='tutorRegister.jsp';
		</script>
	--%>

<%--}--%>
<%
	int num = 0; //�� ������ȣ
	try {
		if (request.getParameter("num") != null) {//�����϶� ����x
			num = Integer.parseInt(request.getParameter("num"));
		}
%>
<%--
 ������ȣ> �ڵ����� �� �ο�p_num;
�̸���> Ʃ��table���� �����ð�

>�Է�
������p_classname;
�з�	p_category;
����Ұ� p_self;
�����Ұ�p_class;
�ҿ�ð�p_time;
����p_cost;
�ο�p_student;
ps�� p_memo;

private String imgsrc;	//�̹��������� ������������ ���� �߰� �ۼ�
    --%>

<body>
	<b>�������</b>
	<br>
	<form method="post" name="writeform" action="writePro.jsp"
		onsubmit="return writeSave()">
		<%--���� ��ȣ �ڵ� �ο��ؾ��� --%>
		<input type="hidden" name="num" value="<%=num%>">
 
	<div>
		<label>�̸�</label><%=mvo.getM_name() %>
	</div>
	<div>
		<label>�г���</label><%=tvo.getT_nick()%>
	</div>
	<div>
		<label>�̸���</label><%=mvo.getM_email() %>
	</div>

		<div>
			<%--��� �׷� --%>
			<label>���� ��</label> <input type="text" size="40" maxlength="50"
				name="p_classname" placeholder="�̸��� �� ����Ƣ�� �������� �Է��ϼ���!">

		</div>
		<%--select�� �� �� �ֵ��� �����Ұ� --%>
		<div>
			<%--��� �׷� --%>
			<label>��з� & �Һз�</label> <input type="text" size="40" maxlength="30"
				name="p_category">
		</div>
		<div>
			<%--��� �׷� --%>
			<label>����Ұ�</label>
			<textarea name="p_self" rows="15" cols="100"></textarea>
		</div>
		<div>
			<%--��� �׷� --%>
			<label>�����Ұ�</label>
			<textarea name="p_class" rows="15" cols="100"></textarea>
		</div>

		<div>
			<%--��� �׷� --%>
			<label>�ҿ�ð�</label> <input type="text" size="40" maxlength="30"
				name="p_time">
		</div>
		<div>
			<%--��� �׷� --%>
			<label>����</label> <input type="text" size="40" maxlength="30"
				name="p_cost">
		</div>
		<div>
			<%--��� �׷� --%>
			<label>�ο�</label> <input type="text" size="40" maxlength="30"
				name="p_student">
		</div>
		<div>
			<%--��� �׷� --%>
			<label>PS</label>
			<textarea name="p_memo" rows="5" cols="100"></textarea>
		</div>

		<input type="submit" value="���� ���"> <input type="reset"
			value="��� ���� ���"> <input type="button" value="��Ϻ���"
			OnClick="window.location='list.jsp'">

		<%
			} catch (Exception e) {
			}
		%>
	</form>
</body>
</html>
