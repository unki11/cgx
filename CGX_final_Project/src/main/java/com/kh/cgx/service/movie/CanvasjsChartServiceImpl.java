package com.kh.cgx.service.movie;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.cgx.repository.movie.CanvasjsChartDao;
	 
	public class CanvasjsChartServiceImpl implements CanvasjsChartService {
	 
		@Autowired
		private CanvasjsChartDao canvasjsChartDao;
	 
		public void setCanvasjsChartDao(CanvasjsChartDao canvasjsChartDao) {
			this.canvasjsChartDao = canvasjsChartDao;
		}
	 
		@Override
		public String getCanvasjsChartData() {
			return canvasjsChartDao.getCanvasjsChartData();
		}

}
