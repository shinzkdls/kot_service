package com.kbstar.mapper;

import com.kbstar.dto.ClassJoinInfo;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ClassJoinInfoMapper extends KBMapper<Integer, ClassJoinInfo> {
    public String searchjoin(Integer classpin, Integer custpin);
}
