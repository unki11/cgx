package com.kh.cgx.vo.kakao;

import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPaySuccessReturnVO {

	private String aid,tid,cid,sid;
	private String partner_order_id,partner_user_id,payment_method_type;
	private String item_name,item_code;
	private KakaoPayAmountVO amount;
	private int quantity;
	private String created_at,approved_at;
	private String payload;
}
