package com.kbstar.mapper;

import com.kbstar.dto.Goodlist;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface GoodlistMapper extends KBMapper<Integer, Goodlist> {
    public void removegood(Goodlist goodlist);

    public String searchgood(Integer recipepin, Integer custpin);
}
