package ua.varus.antifraud.domain.charts;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public abstract class AbstractChart {
    protected double value;
    protected String color;
    protected String label;
}
