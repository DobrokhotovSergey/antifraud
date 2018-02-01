package ua.varus.antifraud.web;

import com.codahale.metrics.Counter;
import ua.varus.antifraud.metrics.MetricRegistrySingleton;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListenerWithMetrics implements HttpSessionListener {

    private final Counter counterOfActiveSessions;

    public SessionListenerWithMetrics() {
        super();
        counterOfActiveSessions = MetricRegistrySingleton.metrics.counter("web.sessions.active.count");
    }

    @Override
    public void sessionCreated(final HttpSessionEvent event) {
        counterOfActiveSessions.inc();
    }

    @Override
    public void sessionDestroyed(final HttpSessionEvent event) {
        counterOfActiveSessions.dec();
    }
}