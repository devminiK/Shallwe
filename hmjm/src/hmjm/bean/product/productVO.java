package hmjm.bean.product;

public class productVO {
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
	private int p_cost;			//����
	private int p_count_min;	//�ο� �ּ� �ο�
	private int p_count_max;	//�ο� �ִ� �ο�
	private String p_memo;		//�� ���̴� ��
	private String imgsrc;		//�̹��������� ������������ ���� �߰� �ۼ�
	
	//private String p_nick;		//Ʃ���� �г���	-�����ð�
	//private String p_selfimg;	//��� ��ǰ�� Ʃ�� ����	-�����ð�
	//private String p_name;		//Ʃ���� �̸�		-�����ð�
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_email() {
		return p_email;
	}
	public void setP_email(String p_email) {
		this.p_email = p_email;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getP_classname() {
		return p_classname;
	}
	public void setP_classname(String p_classname) {
		this.p_classname = p_classname;
	}
	/*
	public String getP_nick() {
		return p_nick;
	}
	public void setP_nick(String p_nick) {
		this.p_nick = p_nick;
	}
	public String getP_selfimg() {
		return p_selfimg;
	}
	public void setP_selfimg(String p_selfimg) {
		this.p_selfimg = p_selfimg;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	*/
	public String getP_self() {
		return p_self;
	}
	public void setP_self(String p_self) {
		this.p_self = p_self;
	}
	public String getP_class1() {
		return p_class1;
	}
	public void setP_class1(String p_class1) {
		this.p_class1 = p_class1;
	}
	public String getP_class2() {
		return p_class2;
	}
	public void setP_class2(String p_class2) {
		this.p_class2 = p_class2;
	}
	public String getP_class3() {
		return p_class3;
	}
	public void setP_class3(String p_class3) {
		this.p_class3 = p_class3;
	}
	public String getP_class4() {
		return p_class4;
	}
	public void setP_class4(String p_class4) {
		this.p_class4 = p_class4;
	}
	public String getP_time() {
		return p_time;
	}
	public void setP_time(String p_time) {
		this.p_time = p_time;
	}
	public int getP_cost() {
		return p_cost;
	}
	public void setP_cost(String p_cost) {
		this.p_cost = p_cost;
	}
	public int getP_count_min() {
		return p_count_min;
	}
	public void setP_count_min(int p_count_min) {
		this.p_count_min = p_count_min;
	}
	public int getP_count_max() {
		return p_count_max;
	}
	public void setP_count_max(int p_count_max) {
		this.p_count_max = p_count_max;
	}
	public String getP_memo() {
		return p_memo;
	}
	public void setP_memo(String p_memo) {
		this.p_memo = p_memo;
	}
	
	//���Ͽ� ���õ� .setter, getter �߰� �ۼ�
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) { 
	this.imgsrc = imgsrc;
	}
}
