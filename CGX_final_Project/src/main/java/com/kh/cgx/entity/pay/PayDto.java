package com.kh.cgx.entity.pay;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class PayDto {

	private int no;
	private String cid;
	private String tid;
	private String aid;
	private String process_time;
	private String partner_order_id;
	private String partner_user_id;
	private String item_name;
	private int quantity;
	private int  total_amount;
	private String status;
	private String reservation_no;
	
}
