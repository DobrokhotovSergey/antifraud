package ua.varus.antifraud.web;

import com.codahale.metrics.Counter;

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
        event.getSession().setMaxInactiveInterval(10);
        counterOfActiveSessions.inc();
        System.out.println("session created!");
    }

    @Override
    public void sessionDestroyed(final HttpSessionEvent event) {
        System.out.println("session destroyed!");
        counterOfActiveSessions.dec();
    }
}