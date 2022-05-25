package hotel;

public class HotelOwner
{
	String h_id;
	String passwd;
	String name;
	String cellphone;
	String registration_number;
	
	public HotelOwner(String h_id, String passwd, String name, String cellphone, String registration_number) {
		this.h_id = h_id; this.passwd = Hash.SHA256(passwd); this.name = name; this.cellphone = cellphone; this.registration_number = registration_number; 
	}
	
	public String toString(){
		return "h_id = " + this.h_id + ", passwd = " + this.passwd + ", name = " + this.name + ", cellphone = " + this.cellphone + ", registration_number = " + this.registration_number;
	}
	
	public String get_h_id() { return this.name; }
	public String get_passwd() { return this.passwd; }
	public String get_name() { return this.name; }
	public String get_cellphone() { return this.cellphone; }
	public String get_registration_number() { return this.registration_number; }
}