package com.hana.repository;


import com.hana.data.dto.InterestlistDto;
import com.hana.data.dto.ReviewlistDto;
import com.hana.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ReviewRepository extends HanaRepository<String, ReviewlistDto> {
    List<ReviewlistDto> selectreview(String s) throws Exception;
}
