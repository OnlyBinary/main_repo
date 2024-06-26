package com.hana.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hana.data.dto.ServiceDto;
import com.hana.frame.HanaService;
import com.hana.repository.ServiceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ServiceService implements HanaService<String, ServiceDto> {

    final ServiceRepository serviceRepository;

    @Override
    public int add(ServiceDto serviceDto) throws Exception {
        return serviceRepository.insert(serviceDto);
    }

    @Override
    public int del(String s) throws Exception {
        return serviceRepository.delete(s);
    }

    @Override
    public int modify(ServiceDto serviceDto) throws Exception {
        return serviceRepository.update(serviceDto);
    }

    @Override
    public ServiceDto get(String s) throws Exception {
        return serviceRepository.selectOne(s);
    }

    @Override
    public List<ServiceDto> get() throws Exception {
        return serviceRepository.select();
    }

    public List<ServiceDto> getByDetail(String detail, String option) throws Exception {
        List<ServiceDto> serviceDtoList = null;

        switch(option) {
            case "content" -> serviceDtoList = getByContent(detail);
            case "target" -> serviceDtoList = getByTarget(detail);
            case "location" -> serviceDtoList = getByLocation(detail);
        }
        return serviceDtoList;
    }

    private List<ServiceDto> getByTarget(String target) {
        return serviceRepository.selectByTarget(target);
    }

    private List<ServiceDto> getByContent(String content) {
        return serviceRepository.selectByContent(content);
    }

    private List<ServiceDto> getByLocation(String location) {
        return serviceRepository.selectByLocation(location);
    }

    public void deleteAreanmIsNUll() {
        serviceRepository.deleteAreaIsNull();
    }

    public List<ServiceDto> selectTopFive() {
        return serviceRepository.selectTopFive();
    }

    public List<ServiceDto> selectOrderByDate() { return serviceRepository.selectOrderByDate();}

    public List<ServiceDto> selectTodayFinishedService() { return serviceRepository.selectTodayFinishedService();}

    public Page<ServiceDto> getPage(int pageNo, String option, String category) throws Exception {
        Page<ServiceDto> page = null;
        switch (category) {
            case "content" -> page = getPage(pageNo, option);
            case "target" -> page = getPageTarget(pageNo, option);
            case "location" -> page = getPageLocation(pageNo, option);
        }
        return page;
    }

    public Page<ServiceDto> getPage(int pageNo, String option) throws Exception {
        PageHelper.startPage(pageNo, 36);
        return serviceRepository.getPage(option);
    }


    public Page<ServiceDto> getPageTarget(int pageNo, String option) throws Exception {
        PageHelper.startPage(pageNo, 36);
        return serviceRepository.getPageTarget(option);
    }

    public Page<ServiceDto> getPageLocation(int pageNo, String option) throws Exception {
        PageHelper.startPage(pageNo, 21);
        return serviceRepository.getPageLocation(option);
    }

    public Page<ServiceDto> getTotal(int pageNo) throws Exception {
        PageHelper.startPage(pageNo,36);
        return serviceRepository.getTotal();
    }
}
