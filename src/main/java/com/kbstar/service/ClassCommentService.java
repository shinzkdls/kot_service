package com.kbstar.service;

import com.kbstar.dto.ClassComment;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ClassCommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassCommentService implements KBService<Integer, ClassComment> {
    @Autowired
    ClassCommentMapper mapper;


    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param classComment
     */
    @Override
    public void register(ClassComment classComment) throws Exception {
        mapper.insert(classComment);
    }

    @Override
    public void remove(Integer classcommentpin) throws Exception {
        mapper.delete(classcommentpin);
    }

    @Override
    public void modify(ClassComment classComment) throws Exception {
        mapper.update(classComment);
    }

    @Override
    public ClassComment get(Integer classcommentpin) throws Exception {
        return mapper.select(classcommentpin);
    }

    @Override
    public List<ClassComment> get() throws Exception {
        return mapper.selectall();
    }

    public List<ClassComment> getClassAllComment(Integer classpin) throws Exception {
        return mapper.selectClassAllComment(classpin);
    }
}
