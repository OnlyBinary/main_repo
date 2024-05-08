package com.hana.repository;

import com.github.pagehelper.Page;
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
    List<ServiceDto> selectByLocation(String detail);
    void deleteAreaIsNull();
    List<ServiceDto> selectTopFive();
    List<ServiceDto> selectOrderByDate();
    Page<ServiceDto> getPage(String maxclassnm) throws Exception;
    Page<ServiceDto> getPageTarget(String usertgtinfo) throws Exception;
    Page<ServiceDto> getPageLocation(String location) throws Exception;
    Page<ServiceDto> getTotal() throws Exception;
}
