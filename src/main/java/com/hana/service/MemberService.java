package com.hana.service;


import com.hana.data.dto.MemberDto;
import com.hana.frame.HanaService;
import com.hana.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService implements HanaService<String, MemberDto> {


    final MemberRepository repository;

    @Override
    public int add(MemberDto memberDto) throws Exception {
        return repository.insert(memberDto);

    }

    @Override
    public int del(String s) throws Exception {
        return repository.delete(s);
    }

    @Override
    public int modify(MemberDto memberDto) throws Exception {
        return repository.update(memberDto);
    }

    @Override
    public MemberDto get(String s) throws Exception {
        return repository.selectOne(s);
    }

    @Override
    public List<MemberDto> get() throws Exception {
        return repository.select();
    }
}
