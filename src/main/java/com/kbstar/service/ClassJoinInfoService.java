package com.kbstar.service;

import com.kbstar.dto.ClassJoinInfo;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ClassJoinInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassJoinInfoService implements KBService<Integer, ClassJoinInfo> {
    @Autowired
    ClassJoinInfoMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param classJoinInfo
     */
    @Override
    public void register(ClassJoinInfo classJoinInfo) throws Exception {
        mapper.insert(classJoinInfo);
    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(ClassJoinInfo classJoinInfo) throws Exception {

    }

    @Override
    public ClassJoinInfo get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<ClassJoinInfo> get() throws Exception {
        return null;
    }
}