package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Notice;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface NoticeMapper extends KBMapper<Integer, Notice> {
    Page<Notice> getpage() throws Exception;
}
