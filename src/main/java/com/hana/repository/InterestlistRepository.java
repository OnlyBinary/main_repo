package com.hana.repository;


import com.hana.data.dto.InterestlistDto;
import com.hana.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface InterestlistRepository extends HanaRepository<String, InterestlistDto> {

    List<InterestlistDto> selectinterest(String s) throws Exception;
    InterestlistDto selectServiceMember(String serviceId, String memberId) throws Exception;
    List<InterestlistDto> selectOneOther(String serviceId) throws Exception;
    void deleteServiceMember(String memberId, String serviceId);
}
