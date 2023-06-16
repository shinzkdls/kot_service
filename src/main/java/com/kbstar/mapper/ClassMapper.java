package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.ClassBasic;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ClassMapper extends KBMapper<Integer, ClassBasic> {

    Page<ClassBasic> getpage(ClassBasic classBasic) throws Exception;

    Page<ClassBasic> getpage_category(String location, String type, String sort) throws Exception;

    Page<ClassBasic> getpage_sort(int classpin, int amount) throws Exception;

    public List<ClassBasic> search(ClassBasic csearch);

    Page<ClassBasic> getsearch(String classtitle) throws Exception;

    List<ClassBasic> latestClass() throws Exception;

    public int pingetter() throws Exception;

//    Page<ClassBasic> getlocation(String location) throws Exception;
//
//    Page<ClassBasic> gettype(String location) throws Exception;

}
