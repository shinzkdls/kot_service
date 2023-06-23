package com.kbstar.mapper;

import com.kbstar.dto.Subscribe;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SubscribeMapper extends KBMapper<Integer, Subscribe> {
    public List<Subscribe> getMySubscribe(String custid) throws Exception;

    public Integer getsubscribestatus(Integer custpin, Integer subcustpin) throws Exception;

    public void delsub(Subscribe subscribe) throws Exception;
}
