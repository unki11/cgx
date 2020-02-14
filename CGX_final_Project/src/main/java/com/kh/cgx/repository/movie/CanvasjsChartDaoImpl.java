package com.kh.cgx.repository.movie;

import com.kh.cgx.chart.movie.CanvasjsChartData;

public class CanvasjsChartDaoImpl implements CanvasjsChartDao{

	
	@Override
	public String getCanvasjsChartData() {
		return CanvasjsChartData.getCanvasjsDataList();
	}
}
