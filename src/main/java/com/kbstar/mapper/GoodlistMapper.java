package com.kbstar.mapper;

import com.kbstar.dto.Goodlist;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface GoodlistMapper extends KBMapper<Integer, Goodlist> {
}
