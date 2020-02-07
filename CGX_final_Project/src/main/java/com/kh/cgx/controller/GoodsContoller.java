package com.kh.cgx.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cgx.entity.goods.GoodsDto;
import com.kh.cgx.repository.goods.GoodsDao;

@Controller
@RequestMapping("/goods")
public class GoodsContoller {
	
	@Autowired
	private GoodsDto goodsDto;
	
	@Autowired
	private GoodsDao goodsDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping ("/")
	public String goods(Model model){
//		List<GoodsDto> list=goodsDao.getList();
		List<GoodsDto> list = sqlSession.selectList("goods.list");
		System.out.println(list);
		model.addAttribute("list",list);
		return "goods/goods";
	}
	
	@GetMapping("/categorypage")
	public String category() {
		
		return "goods/categorypage";
	}
}
