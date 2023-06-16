package com.kbstar.service;

import com.kbstar.dto.Goodlist;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.GoodlistMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodlistService implements KBService<Integer, Goodlist> {
    @Autowired
    GoodlistMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param goodlist
     */
    @Override
    public void register(Goodlist goodlist) throws Exception {
        mapper.insert(goodlist);
    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(Goodlist goodlist) throws Exception {

    }

    @Override
    public Goodlist get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<Goodlist> get() throws Exception {
        return null;
    }
}