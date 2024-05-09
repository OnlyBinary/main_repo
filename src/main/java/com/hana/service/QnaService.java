package com.hana.service;


import com.hana.data.dto.QnaDto;
import com.hana.frame.HanaService;
import com.hana.repository.QnaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QnaService implements HanaService<String, QnaDto> {


    final QnaRepository repository;

    @Override
    public int add(QnaDto qnaDto) throws Exception {
        return repository.insert(qnaDto);

    }

    @Override
    public int del(String s) throws Exception {
        return repository.delete(s);
    }

    @Override
    public int modify(QnaDto qnaDto) throws Exception {
        return repository.update(qnaDto);
    }

    @Override
    public QnaDto get(String s) throws Exception {
        return repository.selectOne(s);
    }

    @Override
    public List<QnaDto> get() throws Exception {
        return repository.select();
    }

    public QnaDto seldet(int s) throws Exception {
        return repository.selectdetail(s);
    }

    public int delqna(int s) throws Exception {
        return repository.deleteqna(s);
    }
}
