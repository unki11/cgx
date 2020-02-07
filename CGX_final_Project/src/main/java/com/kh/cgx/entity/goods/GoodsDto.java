package com.kh.cgx.entity.goods;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class GoodsDto {

	private int goods_no;
	private String goods_name;
	private int goods_price;
	private String goods_img;
	private String goods_category;
}
