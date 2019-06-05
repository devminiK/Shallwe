<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="hmjm.bean.member.*"%>
<%@ page import="hmjm.bean.tutor.*"%>

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
<link rel="stylesheet" href="/hmjm/css/bootstrap.min.css" />
<title>���� ���</title>
<script language="javascript" src="script.js"></script>
<script language="javascript" type="text/javascript">
	/*��� ��� ��ȿ�� �˻�*/
	function writeSave() {
		var form = document.addProductForm;

		if (form.p_classname.value == "") {
			alert("������ �̸��� �Է��Ͻʽÿ�.");
			form.p_classname.focus();
			return false;
		}
		if (form.p_category.value == "") {
			alert("ī�װ��� �������ּ���");
			form.p_category.focus();
			return false;
		}
		if (form.p_self.value == "") {
			alert("�ڽ� �ڽ��� ǥ���� �ּ���.");
			form.p_self.focus();
			return false;
		}
		if (form.p_class1.value == "") {
			alert("������ ���� �Ұ��� ���ּ���.");
			form.p_class1.focus();
			return false;
		}
		if (form.p_class2.value == "") {
			alert("������ ���� �Ұ��� ���ּ���.");
			form.p_class2.focus();
			return false;
		}
		if (form.p_class3.value == "") {
			alert("������ ���� �Ұ��� ���ּ���.");
			form.p_class3.focus();
			return false;
		}
		if (form.p_class4.value == "") {
			alert("������ ���� �Ұ��� ���ּ���.");
			form.p_class4.focus();
			return false;
		}
		if (form.p_time.value == "") {
			alert("�ҿ� �ð��� �������ּ���.");
			form.p_time.focus();
			return false;
		}
		if (form.p_cost.value == "") {
			alert("�����ؾ��� ������ �������ּ���.");
			form.p_cost.focus();
			return false;
		}
		if (form.p_cost.value == "") {/*�̹���*/
			alert("�����ؾ��� ������ �������ּ���.");
			form.p_cost.focus();
			return false;
		}
		/*id������ üũ ���� Ȯ��*/
		if (document.getElementById("oto").checked != true
				&& document.getElementById("otm").checked != true) {
			alert("���� �ο��� ���� ������ üũ���ּ���.");
			return false;
		}
		if (document.getElementById("otm").checked == true) {//1:N üũ�Ǿ�����
			if (form.p_count_min.value == "") {
				alert("������ ���������� �ּ� �ο��� �������ּ���.");
				form.p_count_min.focus();
				return false;
			}
			if (form.p_count_max.value == "") {
				alert("������ ���������� �ִ� �ο��� �������ּ���.");
				form.p_count_max.focus();
				return false;
			}
		}
	}

	/*���� ��ư value�� ���Ǻ񱳷�, �����ֱ�/����*/
	function div_onoff(v, id) {
		if (v == "2")
			document.getElementById(id).style.display = "";//������
		else
			document.getElementById(id).style.display = "none";//����		
	}
</script>

<style>
input[type=number] {
	width: 80px;
}
</style>
</head>
<%--
	p_num ������ȣ�� �ڵ����� ���� �� �ο��� ��(input="hidden"..?)
	t_email �̸��� Ʃ�� table���� �����ð�
	private String imgsrc;	//�̹��������� ������������ ���� �߰� �ۼ�   
--%>
<body>
	<jsp:include page="/Home/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">���� ���</h1>
		</div>
	</div>

	<div class="container">
		<form method="post" name="addProductForm"
			action="addProductPro.jsp" onsubmit="return writeSave()">

			<div class="form-group row">
				<label class="col-sm-2">�̸�</label>
				<div class="col-sm-3">
					<input type="text" readonly name="p_classname" class="form-control"
						value="<%=mvo.getM_name()%>">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">�г���</label>
				<div class="col-sm-3">
					<%--tvo.getT_nick()--%>
					<input type="text" readonly name="p_nick" class="form-control"
						value="">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">�̸���</label>
				<div class="col-sm-3">
					<input type="text" readonly name="p_email" class="form-control"
						value="<%=mvo.getM_email()%>">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">ī�װ�</label>
				<div class="col-sm-3">
					<%--��� �׷�:select�� �� �� �ֵ��� �����Ұ� --%>
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
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">���� �Ұ�</label>
				<div class="col-sm-5">
					<textarea name="p_self" rows="2" cols="50"></textarea>
				</div>
			</div>
			<h2>���� �Ұ�</h2>
			<div class="form-group row">
				<label class="col-sm-2">Ʃ�� ����</label>
				<div class="col-sm-3">
					<textarea name="p_class1" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">���� �Ұ�</label>
				<div class="col-sm-3">
					<textarea name="p_class2" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">���� ���</label>
				<div class="col-sm-3">
					<textarea name="p_class3" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">Ŀ��ŧ��</label>
				<div class="col-sm-3">
					<textarea name="p_class4" rows="2" cols="50"></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">�ҿ�ð�</label>
				<div class="col-sm-3">
					<input type="number" name="p_time" min=1>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">����</label>
				<div class="col-sm-3">
					<input type="number" name="p_cost" step="1000" min=0>��
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">�ο�</label>
				<div class="col-sm-3">
					<input type="radio" name="howmany"
						id="oto" value="1" onclick="div_onoff(this.value,'con');">1:1����<br> 
					<input type="radio" name="howmany" id="otm" value="2"
						onclick="div_onoff(this.value,'con');">1:N ����<br>
					
					<div id="con" style="display: none">
						�ּ��ο�: <input type="number" name="p_count_min" min=1><br>
						�ִ��ο�: <input type="number" name="p_count_max" min=1>
					</div>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">PS</label>
				<div class="col-sm-3">
					<textarea name="p_memo" rows="2" cols="50"></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">���� ����</label>
				<div class="col-sm-5">
					<input type="file" name="" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" value="���� ���">&nbsp;&nbsp;&nbsp; <input
						type="reset" value="��� ���� ���"> &nbsp;&nbsp;&nbsp; <input
						type="button" value="��Ϻ���" OnClick="window.location='list.jsp'">
				</div>
			</div>

		</form>
	</div>
</body>
</html>
