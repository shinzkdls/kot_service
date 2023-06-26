package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.ClassBasic;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ClassMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassService implements KBService<Integer, ClassBasic> {
    @Autowired
    ClassMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param classBasic
     */
    @Override
    public void register(ClassBasic classBasic) throws Exception {
        mapper.insert(classBasic);
    }

    @Override
    public void remove(Integer classpin) throws Exception {
        mapper.delete(classpin);
    }

    @Override
    public void modify(ClassBasic classBasic) throws Exception {
        mapper.update(classBasic);
    }

    @Override
    public ClassBasic get(Integer classpin) throws Exception {
        return mapper.select(classpin);
    }

    @Override
    public List<ClassBasic> get() throws Exception {
        List<ClassBasic> list = mapper.selectall();
        return list;
    }

    public Page<ClassBasic> getPage(int pageNo, ClassBasic classBasic) throws Exception {
        PageHelper.startPage(pageNo, 6);
        return mapper.getpage(classBasic);
    }

    public Page<ClassBasic> getPage_category(int pageNo, String location,
                                             String type, String sort) throws Exception {
        PageHelper.startPage(pageNo, 6);
        return mapper.getpage_category(location, type, sort);
    }

    public Page<ClassBasic> getSearch(int pageNo, String classtitle) throws Exception {
        PageHelper.startPage(pageNo, 6);
        return mapper.getsearch(classtitle);
    }

    public int pingetter() throws Exception {
        return mapper.pingetter();
    }

    public List<ClassBasic> latestClass() throws Exception {
        List<ClassBasic> classList = mapper.latestClass();
        return classList;
    }


}
