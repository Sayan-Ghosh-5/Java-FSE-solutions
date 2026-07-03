package com.example;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import java.util.ArrayList;
import java.util.List;
import static org.junit.Assert.assertEquals;

public class AAAPatternTest {
    private List<String> list;

    @Before
    public void setUp() {
        list = new ArrayList<>();
    }

    @After
    public void tearDown() {
        list.clear();
    }

    @Test
    public void testListAdd() {
        String item = "testItem";

        list.add(item);

        assertEquals(1, list.size());
    }
}
