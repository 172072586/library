package com.home.service.impl;

import com.home.dao.ReaderDao;
import com.home.entity.Reader;
import com.home.service.ReaderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class ReaderServiceImpl implements ReaderService {
    @Resource
    private ReaderDao readerDao;

    @Override
    public int addReader(Reader reader) {
        //注册读者
        return readerDao.insertReaderDao(reader);
    }

    //按借阅号和读者名查询
    @Override
    public ArrayList<Reader> findSomeReader(Integer reader_id, String reader_name) {
        ArrayList<Reader> readers = readerDao.selectSomeReader(reader_id, reader_name);
        return readers;
    }

    //按读者id查询
    @Override
    public ArrayList<Reader> findIdReader(Integer reader_id) {
        ArrayList<Reader> readers = readerDao.selectIdReader(reader_id);
        return readers;
    }

    //按借阅名查询
    @Override
    public ArrayList<Reader> findNameReader(String reader_name) {
        ArrayList<Reader> readers = readerDao.selectNameReader(reader_name);
        return readers;
    }
    //修改读者信息
    @Override
    public int editReader(Reader reader) {
        int result = readerDao.updateReader(reader);
        return result;
    }

    @Override
    public Reader queryReader(Integer reader_id, String password) {
        //验证读者是否存在
        Reader reader = readerDao.selectReaderDao(reader_id, password);
        return reader;
    }

    //删除读者
    @Override
    public int loseBook(Integer reader_id) {
        int result = readerDao.deleteBook(reader_id);
        return result;
    }

    //查询所有读者信息
    @Override
    public ArrayList<Reader> findReader() {
        ArrayList<Reader> readers = readerDao.selectReader();
        return readers;
    }

    //管理员添加读者功能
    @Override
    public int submitAddReader(Reader reader) {
        int result = readerDao.submitAddReader(reader);
        return result;
    }
}
