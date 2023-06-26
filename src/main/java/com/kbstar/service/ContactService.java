package com.kbstar.service;

import com.kbstar.dto.Contact;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ContactMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ContactService implements KBService<Integer, Contact> {
    @Autowired
    ContactMapper mapper;

    @Override
    public void register(Contact contact) throws Exception {
        mapper.insert(contact);
    }

    @Override
    public void remove(Integer s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Contact contact) throws Exception {
        mapper.update(contact);
    }

    @Override
    public Contact get(Integer s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Contact> get() throws Exception {
        return mapper.selectall();
    }

    public List<Contact> getmycontact(Integer custpin) throws Exception {
        return mapper.getmycontact(custpin);
    }

}
