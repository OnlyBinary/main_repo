package com.hana.service;


import com.hana.data.dto.InterestlistDto;
import com.hana.frame.HanaService;
import com.hana.repository.InterestlistRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InterestlistService implements HanaService<String, InterestlistDto> {


    final InterestlistRepository repository;

    @Override
    public int add(InterestlistDto interestlistDto) throws Exception {
        return repository.insert(interestlistDto);

    }

    @Override
    public int del(String s) throws Exception {
        return repository.delete(s);
    }

    @Override
    public int modify(InterestlistDto interestlistDto) throws Exception {
        return repository.update(interestlistDto);
    }

    @Override
    public InterestlistDto get(String s) throws Exception {
        return repository.selectOne(s);
    }

    @Override
    public List<InterestlistDto> get() throws Exception {
        return repository.select();
    }

    public List<InterestlistDto> selint(String s) throws Exception {
        return repository.selectinterest(s);
    }

    public List<InterestlistDto> getOther(String serviceId) throws Exception {
        return repository.selectOneOther(serviceId);
    }

    public InterestlistDto getByServiceMemberId(String serviceId, String memberId) throws Exception {
        return repository.selectServiceMember(serviceId, memberId);
    }

    public void deleteByServiceMemberId(String memberId, String serviceId) {
        repository.deleteServiceMember(memberId, serviceId);
    }
}
