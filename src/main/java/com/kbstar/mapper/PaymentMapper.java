package com.kbstar.mapper;

import com.kbstar.dto.Payment;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface PaymentMapper extends KBMapper<Integer, Payment> {

}
