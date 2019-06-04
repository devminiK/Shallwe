<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="hmjm.bean.dao.memberDAO"%>
<%@ page import="hmjm.bean.vo.memberVO"%>
<%@ page import="hmjm.bean.dao.tutorDAO"%>
<%@ page import="hmjm.bean.vo.tutorVO"%>

<%-- 19.06.04���� �ۼ� , �̿ϼ�, --%>
<%--

 --%>
<%
	request.setCharacterEncoding("UTF-8");
	String preUser = (String) session.getAttribute("loginId");//���� ����,�̸����� ��
	//�Ϲ����� ����
	memberDAO mdao = memberDAO.getInstance();
	memberVO mvo = mdao.getMember(preUser);
	//Ʃ�� ��� ����, �ּ�Ǯ�� �����߻�. �켱 �ּ��޾Ƶ�
	//nick�� �޾ƿ�������
	//tutorDAO tdao = tutorDAO.getInstance();		
	//tutorVO tvo = tdao.getMember(preUser);
%>


<html>
<head>
<title>���� ���</title>
<script language="JavaScript" src="script.js"></script>
<script>
	function div_onoff(v,id){/*���� ��ư value�� ���� ��*/
		if(v=="2"){
			document.getElementById(id).style.display="";//������
		}else
			document.getElementById(id).style.display="none";//����		
	}
</script>
<style>
	 input[type=number]{
		width:80px;	
	}
</style>
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
	<div class="container">
		<form method="post" name="writeform" action="writePro.jsp"
			onsubmit="return writeSave()">
			<%--���� ��ȣ �ڵ� �ο��ؾ��� hidden--%>
			<input type="text" name="num" value="<%=num%>">

			<div>
				<label>[�̸�]</label><%=mvo.getM_name()%>
			</div>
			<%-- 
	<div>
		<label>�г���</label><%=tvo.getT_nick()%>
	</div>
	--%>
			<div>
				<label>[�̸���]</label><%=mvo.getM_email()%>
			</div>

			<div>
				<%--��� �׷� --%>
				<label>���� ��</label> <input type="text" size="40" maxlength="50"
					name="p_classname" placeholder="�̸��� �� ����Ƣ�� �������� �Է��ϼ���!">
			</div>

			<div>
				<%--��� �׷�:select�� �� �� �ֵ��� �����Ұ� --%>
				<label>ī�װ�(��>��)</label>
				<select id="p_category" name="p_category">
					<optgroup label="�α����">
						<option value="archi">����</option>
						<option value="computer" selected>����</option>
					</optgroup>
					<optgroup label="������">
						<option value="history">����</option>
						<option value="lang">����</option>
					</optgroup>
					<optgroup label="�ǹ�����">
						<option value="history">����</option>
						<option value="lang">����</option>
					</optgroup>
					<optgroup label="��Ƽ">
						<option value="history">����</option>
						<option value="lang">����</option>
					</optgroup>
					<optgroup label="����">
						<option value="history">����</option>
						<option value="lang">����</option>
					</optgroup>
					<optgroup label="�ܱ���">
						<option value="history">����</option>
						<option value="lang">����</option>
					</optgroup>
					<optgroup label="����">
						<option value="history">����</option>
						<option value="lang">����</option>
					</optgroup>
					<optgroup label="����������">
						<option value="history">����</option>
						<option value="lang">����</option>
					</optgroup>
					<optgroup label="��Ÿ">
						<option value="history">����</option>
						<option value="lang">����</option>
					</optgroup>
				</select><br />
			</div>

			<div>
				<%--��� �׷� /rows="15" cols="100"�� �����ϱ�--%>
				<label>����Ұ�</label><br>
				<textarea name="p_self" rows="3" cols="5"></textarea>
			</div>
			<div>
				<%--��� �׷� --%>
				<h3>�Ұ��ϱ�</h3>
				<label>Ʃ������</label><br>
				<textarea name="p_class1" rows="3" cols="5"></textarea><br>
				<label>�����Ұ�</label><br>
				<textarea name="p_class2" rows="3" cols="5"></textarea><br>
				<label>���� ���</label><br>
				<textarea name="p_class3" rows="3" cols="5"></textarea><br>
				<label>Ŀ��ŧ��</label><br>
				<textarea name="p_class4" rows="3" cols="5"></textarea>
			</div>

			<div>
				<%--��� �׷� --%>
				<label>�ҿ�ð�</label> 
				<input type="number" name="p_time" min=1>
			</div>
			<div>
				<%--��� �׷� --%>
				<label>����</label> 
				<input type="number" name="p_cost" step="1000" min=0>��
			</div>
			<div>
				<%--��� �׷� --%>
				<label>�ο�</label><br>
				<input type="radio" name="howmany" value="1" onclick="div_onoff(this.value,'con');">1:1 ����<br>
				<input type="radio" name="howmany" value="2" onclick="div_onoff(this.value,'con');">1:N ����
				<div id="con" style="display:none">
					�ּ��ο�: <input type="number" name="p_count_min" min=1>
					�ִ��ο�: <input type="number" name="p_count_max" min=1>
				</div>

			</div><br>
			
			<div>
				<%--��� �׷� --%>
				<label>PS</label><br>
				<textarea name="p_memo" rows="5" cols="100"></textarea>
			</div>

			<input type="submit" value="���� ���"> 
			<input type="reset"	value="��� ���� ���"> 
			<input type="button" value="��Ϻ���"	OnClick="window.location='list.jsp'">
			<%} catch (Exception e) {}%>
		</form>
	</div>
</body>
</html>
