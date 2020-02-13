package com.kh.cgx.service.movie;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.cgx.repository.movie.ChartDao;

public class ChartServiceImpl  implements ChartService{

	
	@Autowired
	private ChartDao chartDao;
 
	public void setschartDao(ChartDao chartDao) {
		this.chartDao = chartDao;
	}
	
	@Override
	public String getChartData() {
		
		return chartDao.getChartData();
	}

}
