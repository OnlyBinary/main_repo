package com.hana.repository;

import com.hana.data.dto.ServiceDto;
import com.hana.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
@Mapper
public interface ServiceRepository extends HanaRepository<String, ServiceDto> {
    List<ServiceDto> selectByContent(String detail);
    List<ServiceDto> selectByTarget(String detail);
}
