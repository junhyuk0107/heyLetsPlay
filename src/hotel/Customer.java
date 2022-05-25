package hotel;

public class Customer
{
	String c_id;
	String passwd;
	String name;
	String cellphone;
	String email;
	
	public Customer(String c_id, String passwd, String name, String cellphone, String email) {
		this.c_id = c_id; this.passwd = Hash.SHA256(passwd); this.name = name; this.cellphone = cellphone; this.email = email;
	}
	
	public String toString(){
		return "c_id = " + this.c_id + ", passwd = " + this.passwd + ", name = " + this.name + ", cellphone = " + this.cellphone + ", email = " + this.email;
	}
	
	public String get_c_id() { return this.c_id; }
	public String get_passwd() { return this.passwd; }
	public String get_name() { return this.name; }
	public String get_cellphone() { return this.cellphone; }
	public String get_email() { return this.email; }
}