package com.hana.member;



import com.hana.data.dto.MemberDto;
import com.hana.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;

@SpringBootTest
@Slf4j
class SelectOneTests {
    @Autowired
    MemberService memberService;

    @Test
    void contextLoads() {
        try {
            MemberDto memberDto;
            memberDto = memberService.get("sid01");
            if(memberDto == null){
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
