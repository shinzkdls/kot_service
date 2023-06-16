package com.kbstar.service;

import com.kbstar.dto.Magic;
import com.kbstar.mapper.MagicMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MagicService{
    @Autowired
    MagicMapper mapper;
    public List<Magic> getMagic() throws Exception {
        List<Magic> list =mapper.getMagic();
        return list;
    }

}