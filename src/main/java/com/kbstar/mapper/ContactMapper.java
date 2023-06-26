package com.kbstar.mapper;

import com.kbstar.dto.Contact;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ContactMapper extends KBMapper<Integer, Contact> {
    public List<Contact> getmycontact(Integer custpin) throws Exception;
}
