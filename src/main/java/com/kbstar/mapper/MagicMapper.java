package com.kbstar.mapper;

import com.kbstar.dto.Magic;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MagicMapper{
    public List<Magic> getMagic() throws Exception;

}
