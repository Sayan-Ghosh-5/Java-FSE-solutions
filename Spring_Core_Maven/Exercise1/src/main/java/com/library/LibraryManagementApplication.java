package com.library;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryManagementApplication {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        System.out.println("Spring Context for Exercise 1 loaded successfully. Beans present:");
        System.out.println("bookRepository: " + context.containsBean("bookRepository"));
        System.out.println("bookService: " + context.containsBean("bookService"));
    }
}
