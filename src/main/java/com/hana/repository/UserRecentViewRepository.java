package com.hana.repository;

import com.hana.data.dto.UserRecentViewDto;
import com.hana.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserRecentViewRepository extends HanaRepository<String, UserRecentViewDto> {
    UserRecentViewDto findMemberService(String memberId, String serviceId);
}
