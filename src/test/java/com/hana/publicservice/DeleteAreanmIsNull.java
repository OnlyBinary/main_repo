package com.hana.publicservice;

import com.hana.service.ServiceService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class DeleteAreanmIsNull {

    @Autowired
    ServiceService serviceService;

    @Test
    void contextLoads() {
        serviceService.deleteAreanmIsNUll();
    }
}
