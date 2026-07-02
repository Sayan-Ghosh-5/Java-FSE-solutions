package singleton.example;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Logger {
    private Logger() {
        System.out.println("Logger Instance Initialized.");
    }

    private static class LoggerHolder {
        private static final Logger INSTANCE = new Logger();
    }

    public static Logger getInstance() {
        return LoggerHolder.INSTANCE;
    }

    public void log(String message) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        System.out.println("[" + dtf.format(LocalDateTime.now()) + "] " + message);
    }
}