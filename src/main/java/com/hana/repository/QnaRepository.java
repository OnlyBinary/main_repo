package com.hana.repository;


import com.hana.data.dto.QnaDto;
import com.hana.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface QnaRepository extends HanaRepository<String, QnaDto> {

    QnaDto selectdetail(int s) throws Exception;

    int deleteqna(int s) throws Exception;

}
