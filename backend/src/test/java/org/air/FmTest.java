package org.air;

import com.alibaba.fastjson.JSONObject;
import com.air.Application;


import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
@Component
public class FmTest {

    @Test
    public void test(){
        System.out.println("test");
    }
}
