package com.hana.publicservice;

import com.hana.data.KeyStore;
import com.hana.util.PublicServiceUtil;
import org.json.simple.parser.ParseException;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;

@SpringBootTest
public class GetServiceDetailDataTest {

    @Autowired
    KeyStore keyStore;

    @Test
    void contextLoads() throws IOException, ParseException {
        System.out.println(PublicServiceUtil.getServiceDetailData(
                keyStore.publicServiceKey, "1", "1",
                "S230202155258334077"
        ));
    }
}
