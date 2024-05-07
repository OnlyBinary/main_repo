package com.hana.service;

import com.hana.data.dto.ServiceDto;
import com.hana.data.dto.SvccntDto;
import com.hana.frame.HanaService;
import com.hana.repository.SvccntRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SvccntService implements HanaService<String, SvccntDto> {

    final SvccntRepository svccntRepository;

    @Override
    public int add(SvccntDto svccntDto) throws Exception {
        return svccntRepository.insert(svccntDto);
    }

    @Override
    public int del(String s) throws Exception {
        return svccntRepository.delete(s);
    }

    @Override
    public int modify(SvccntDto svccntDto) throws Exception {
        return svccntRepository.update(svccntDto);
    }

    @Override
    public SvccntDto get(String s) throws Exception {
        return svccntRepository.selectOne(s);
    }

    @Override
    public List<SvccntDto> get() throws Exception {
        return svccntRepository.select();
    }
}
