package hotel;

public class Room
{
	String hotel_name; 
	int room_num;
	String registration_date;
	int bed_num;
	int price;
	int room_area;
	
	public Room(String hotel_name, int room_num, String registration_date, int bed_num, int price, int room_area) {
		this.hotel_name = hotel_name; this.room_num = room_num; this.registration_date = registration_date; this.bed_num = bed_num; this.price = price; this.room_area = room_area;
	}
	
	public String toString(){
		return "hotel_name = " + this.hotel_name + ", room_num = " + this.room_num + ", registration_date = " + this.registration_date + ", bed_num = " + this.bed_num + ", price = " + this.price + ", room_area = " + this.room_area;
	}
	
	public String get_hotel_name() { return this.hotel_name; }
	public int get_room_num() { return this.room_num; }
	public String get_registration_date() { return this.registration_date; }
	public int get_bed_num() { return this.bed_num; }
	public int get_price() { return this.price; }
	public int get_room_area() { return this.room_area; }
}