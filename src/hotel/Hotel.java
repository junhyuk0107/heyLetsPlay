package hotel;

public class Hotel
{
	String hotel_name; 
	String address;
	String phone_num;
	int stars;
	String h_id;
	String registration_date;
	
	public Hotel(String hotel_name, String address,	String phone_num, int stars, String h_id, String registration_date) {
		this.hotel_name = hotel_name; this.address = address; this.phone_num = phone_num; this.stars = stars; this.h_id = h_id; this.registration_date = registration_date;
	}
	
	public String toString(){
		return "hotel_name = " + this.hotel_name + ", address = " + this.address + ", phone_num = " + this.phone_num + ", stars = " + this.stars + ", h_id = " + this.h_id + ", registration_date = " + this.registration_date;
	}
	
	public String get_hotel_name() { return this.hotel_name; }
	public String get_address() { return this.address; }
	public String get_phone_num() { return this.phone_num; }
	public int get_stars() { return this.stars; }
	public String get_h_id() { return this.h_id; }
	public String get_registration_date() { return this.registration_date; }
}