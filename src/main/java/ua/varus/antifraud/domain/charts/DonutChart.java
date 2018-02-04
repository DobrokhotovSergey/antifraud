package ua.varus.antifraud.domain.charts;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true, includeFieldNames = false)
public class DonutChart extends AbstractChart {
    private String highlight;

    public DonutChart(double value, String label, String color, String highlight) {
        super(value, color, label);
        this.highlight = highlight;
    }
}
