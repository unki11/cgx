package com.kh.cgx.vo.kakao;

import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayRevokeReturnVO {
	
	private String aid,tid,cid,status;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	
	private KakaoPayAmountVO canceled_amount;
	private KakaoPayAmountVO cancel_available_amount;
	
	private String item_name,item_code;
	private int quantity;
	private String created_at,approved_at,canceled_at;
	private String payload;
}
