package com.kh.cgx.vo.movie;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class DistVO {
	
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_phone;
	private String member_lastlogin;
	private String member_joindate;
	private String member_email;
	private int member_point;
	private String member_sex;
	private String member_birth;
	private int ticket_no;
	private int member_no;
	private int ticket_buy_no;
	private int ticket_total_person;
	private int movietime_no;
	private int screen_no;
	private String movietime_time;
	private int movietime_price;
	private int movie_no;
	private int files_no;
	private String movie_title;
	private String movie_director;
	private int movie_ticket_rate;
	private String movie_startdate;
	private int movie_runtime;
	private String movie_country;
	private String movie_grade;
	private String movie_status;
	private String movie_genre;
	private String movie_publisher;
	private String movie_content;
}
