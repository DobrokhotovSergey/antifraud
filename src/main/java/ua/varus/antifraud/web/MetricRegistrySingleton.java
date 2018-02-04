package ua.varus.antifraud.web;

import com.codahale.metrics.MetricRegistry;
import com.codahale.metrics.Slf4jReporter;
import lombok.extern.slf4j.Slf4j;

import java.util.concurrent.TimeUnit;

@Slf4j
public final class MetricRegistrySingleton {
    public static final MetricRegistry metrics = new MetricRegistry();

    static {
        final Slf4jReporter reporter = Slf4jReporter.forRegistry(metrics).outputTo(log).convertRatesTo(TimeUnit.SECONDS).convertDurationsTo(TimeUnit.MILLISECONDS).build();
        reporter.start(2, TimeUnit.SECONDS);

    }

    private MetricRegistrySingleton() {
        throw new AssertionError();
    }
}