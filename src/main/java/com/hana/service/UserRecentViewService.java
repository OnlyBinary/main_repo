package com.hana.service;

import com.hana.data.dto.UserRecentViewDto;
import com.hana.frame.HanaService;
import com.hana.repository.UserRecentViewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserRecentViewService implements HanaService<String, UserRecentViewDto> {

    final UserRecentViewRepository recentViewRepository;

    @Override
    public int add(UserRecentViewDto userRecentViewDto) throws Exception {
        return recentViewRepository.insert(userRecentViewDto);
    }

    @Override
    public int del(String s) throws Exception {
        return recentViewRepository.delete(s);
    }

    @Override
    public int modify(UserRecentViewDto userRecentViewDto) throws Exception {
        return recentViewRepository.update(userRecentViewDto);
    }

    @Override
    public UserRecentViewDto get(String s) throws Exception {
        return recentViewRepository.selectOne(s);
    }

    @Override
    public List<UserRecentViewDto> get() throws Exception {
        return recentViewRepository.select();
    }

    public UserRecentViewDto findByMemberAndService(String memberId, String serviceId) {
        return recentViewRepository.findMemberService(memberId, serviceId);
    }
    public List<UserRecentViewDto> memberRecentView(String memberId) {
        return recentViewRepository.memberRecentView(memberId);
    }

}
