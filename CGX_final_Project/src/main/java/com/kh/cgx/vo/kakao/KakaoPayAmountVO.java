package com.kh.cgx.vo.kakao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class KakaoPayAmountVO {

	private int total,tax_free,vat,point,discount;
}
