package com.hana.service;


import com.hana.data.dto.InterestlistDto;
import com.hana.data.dto.ReviewlistDto;
import com.hana.frame.HanaService;
import com.hana.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewService implements HanaService<String, ReviewlistDto> {


    final ReviewRepository repository;

    @Override
    public int add(ReviewlistDto reviewlistDto) throws Exception {
        return repository.insert(reviewlistDto);

    }

    @Override
    public int del(String s) throws Exception {
        return repository.delete(s);
    }

    @Override
    public int modify(ReviewlistDto reviewlistDto) throws Exception {
        return repository.update(reviewlistDto);
    }

    @Override
    public ReviewlistDto get(String s) throws Exception {
        return repository.selectOne(s);
    }

    @Override
    public List<ReviewlistDto> get() throws Exception {
        return repository.select();
    }

    public List<ReviewlistDto> selrev(String s) throws Exception {
        return repository.selectreview(s);
    }
}
