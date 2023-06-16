package com.kbstar.mapper;

import com.kbstar.dto.ClassComment;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ClassCommentMapper extends KBMapper<Integer, ClassComment> {
    List<ClassComment> selectClassAllComment(Integer classpin) throws Exception;
}
