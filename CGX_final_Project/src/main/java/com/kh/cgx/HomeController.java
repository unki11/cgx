package com.kh.cgx;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cgx.entity.movie.MovieDto;
import com.kh.cgx.repository.movie.VideoDao;
import com.kh.cgx.vo.movie.VideoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("")
public class HomeController {
	
	@Autowired
	private VideoDao videoDao;
	
	@Autowired
	private SqlSession sqlSession;

	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

@GetMapping("/")
	public String home( Model model,@ModelAttribute VideoVO videoVO, ModelMap modelMap) {
		
		List<VideoVO> video_list = videoDao.getList2(videoVO);
		modelMap.addAttribute("video_list", video_list);
		
		return "home";
	}
	
	
	
}
