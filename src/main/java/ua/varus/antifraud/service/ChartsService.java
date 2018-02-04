package ua.varus.antifraud.service;

import ua.varus.antifraud.domain.charts.DonutChart;

import java.util.List;

public interface ChartsService {
    List<DonutChart> onlineUsersChart();
}
