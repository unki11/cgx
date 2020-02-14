package com.kh.cgx.repository.movie;

import com.kh.cgx.chart.movie.ChartData;

public class ChartDaoImpl implements ChartDao{

	
	@Override
	public String getChartData() {
		return ChartData.getDataList();
	}
}
