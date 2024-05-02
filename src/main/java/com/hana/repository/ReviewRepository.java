package com.hana.repository;


import com.hana.data.dto.ReviewlistDto;
import com.hana.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ReviewRepository extends HanaRepository<String, ReviewlistDto> {
}
