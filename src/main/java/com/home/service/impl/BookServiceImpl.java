package com.home.service.impl;

import com.home.dao.BookDao;
import com.home.entity.Book;
import com.home.service.BookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class BookServiceImpl implements BookService {

    @Resource
    private BookDao bookDao;

    @Override
    public int addBook(Book book) {
        int result = bookDao.insertBook(book);
        return result;
    }
}