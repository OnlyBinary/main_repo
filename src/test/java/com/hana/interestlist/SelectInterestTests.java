package com.hana.interestlist;



import com.hana.data.dto.InterestlistDto;
import com.hana.data.dto.ReviewlistDto;
import com.hana.service.InterestlistService;
import com.hana.service.ReviewService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;
import java.util.List;

@SpringBootTest
@Slf4j
class SelectInterestTests {
    @Autowired
    InterestlistService interestlistService;

    @Autowired
    ReviewService reviewService;

    @Test
    void contextLoads() {
        try {
//            List<InterestlistDto> interestlistDto = null;
//            interestlistDto = interestlistService.selint("sid01");

            List<ReviewlistDto> reviewlistDto = null;
            reviewlistDto = reviewService.selrev("S240111125908572569");

            if(reviewlistDto == null){
                log.info("--------NULL----------");
            }
            log.info("--------OK---------");
        } catch (Exception e) {
            if(e instanceof SQLException){
                log.info("----------System Trouble EX0001---------");
            } else if (e instanceof DuplicateKeyException){
                log.info("--------ID Duplicated EX0002------------");
            } else {
              log.info("----Sorry EX003-------------");
              e.printStackTrace();
        }
        }
    }
}
