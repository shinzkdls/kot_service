package com.kbstar.service;

import com.kbstar.dto.Payment;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.PaymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PaymentService implements KBService<Integer, Payment> {
    @Autowired
    PaymentMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param payment
     */
    @Override
    public void register(Payment payment) throws Exception {
        mapper.insert(payment);
    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(Payment payment) throws Exception {

    }

    @Override
    public Payment get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<Payment> get() throws Exception {
        return mapper.selectall();
    }
}