package hotel;

public class ReservationCancellation
{
	int cancellation_charge;
	String cancellation_date;
	String hotel_name;
	int room_num;
	String c_id;
	String reserve_date;
	String start_date_of_use;
	String end_of_use_date;
	String payment_type;
	int number_of_people;
	
	public ReservationCancellation(int cancellation_charge, String cancellation_date, String hotel_name, int room_num, String c_id, String reserve_date, String start_date_of_use, String end_of_use_date, String payment_type, int number_of_people) {
		this.cancellation_charge = cancellation_charge; this.cancellation_date = cancellation_date; this.hotel_name = hotel_name; this.room_num = room_num; this.c_id = c_id; this.reserve_date = reserve_date;  this.start_date_of_use = start_date_of_use;  this.end_of_use_date = end_of_use_date;  this.payment_type = payment_type;  this.number_of_people = number_of_people; 
	}
	
	public String toString(){
		return "cancellation_charge = " + this.cancellation_charge + ", cancellation_date = " + this.cancellation_date + ", hotel_name = " + this.hotel_name + ", room_num = " + this.room_num + ", c_id = " + this.c_id + ", reserve_date = " + this.reserve_date + ", start_date_of_use = " + this.start_date_of_use + ", end_of_use_date = " + this.end_of_use_date + ", payment_type = " + this.payment_type + ", number_of_people = " + this.number_of_people;
	}
	
	public int get_cancellation_charge() { return this.cancellation_charge; }
	public String get_cancellation_date() { return this.cancellation_date; }
	public String get_hotel_name() { return this.hotel_name; }
	public int get_room_num() { return this.room_num; }
	public String get_c_id() { return this.c_id; }
	public String get_reserve_date() { return this.reserve_date; }
	public String get_start_date_of_use() { return this.start_date_of_use; }
	public String get_end_of_use_date() { return this.end_of_use_date; }
	public String get_payment_type() { return this.payment_type; }
	public int get_number_of_people() { return this.number_of_people; }
}