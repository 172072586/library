package com.home.service.impl;

import com.home.dao.ReaderDao;
import com.home.entity.Reader;
import com.home.service.ReaderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service
public class ReaderServiceImpl implements ReaderService {
    @Resource
    private ReaderDao readerDao;

    @Override
    public int addReader(Reader reader) {
        //注册读者
        return readerDao.insertReaderDao(reader);
    }

    @Override
    public Reader queryReader(String reader_id, String password) {
        //验证读者是否存在
        Reader reader = readerDao.selectReaderDao(reader_id, password);
        return reader;
    }
}
