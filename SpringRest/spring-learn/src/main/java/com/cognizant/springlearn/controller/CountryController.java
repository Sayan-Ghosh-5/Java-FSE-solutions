package com.cognizant.springlearn.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.cognizant.springlearn.Country;
import com.cognizant.springlearn.service.CountryService;

@RestController
public class CountryController {

    @Autowired
    private CountryService countryService;

    @RequestMapping("/country")
    public Country getCountryIndia() {
        ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");
        return context.getBean("country", Country.class);
    }

    @SuppressWarnings("unchecked")
    @GetMapping("/countries")
    public List<Country> getAllCountries() {
        ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");
        return (List<Country>) context.getBean("countryList", List.class);
    }

    @GetMapping("/countries/{code}")
    public Country getCountry(@PathVariable String code) {
        return countryService.getCountry(code);
    }
}
