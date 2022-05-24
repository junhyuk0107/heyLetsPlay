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
}