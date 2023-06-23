package com.kbstar.service;

import com.kbstar.dto.Subscribe;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.SubscribeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubscribeService implements KBService<Integer, Subscribe> {
    @Autowired
    SubscribeMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param subscribe
     */
    @Override
    public void register(Subscribe subscribe) throws Exception {
        mapper.insert(subscribe);
    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(Subscribe subscribe) throws Exception {

    }

    @Override
    public Subscribe get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<Subscribe> get() throws Exception {
        return null;
    }

    public List<Subscribe> getMySubscribe(String custid) throws Exception {
        return mapper.getMySubscribe(custid);
    }

    public Integer getsubscribestatus(Integer custpin, Integer subcustpin) throws Exception {
        return mapper.getsubscribestatus(custpin, subcustpin);
    }

    public void delsub(Subscribe subscribe) throws Exception {
        mapper.delsub(subscribe);
    }

    ;
}