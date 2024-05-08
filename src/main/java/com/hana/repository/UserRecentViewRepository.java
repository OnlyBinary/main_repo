package com.hana.repository;

import com.hana.data.dto.UserRecentViewDto;
import com.hana.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserRecentViewRepository extends HanaRepository<String, UserRecentViewDto> {
    UserRecentViewDto findMemberService(String memberId, String serviceId);

    List<UserRecentViewDto> memberRecentView(String memberId);
}
