package com.hana.repository;

import com.hana.data.dto.ServiceDto;
import com.hana.data.dto.SvccntDto;
import com.hana.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface SvccntRepository extends HanaRepository<String, SvccntDto> {
}
