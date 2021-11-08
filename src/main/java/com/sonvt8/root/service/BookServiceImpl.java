package com.sonvt8.root.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sonvt8.root.dao.BookDAO;
import com.sonvt8.root.entity.Book;

import java.util.List;

@Service
public class BookServiceImpl implements BookService{

    private BookDAO bookDAO;

    @Autowired
    public BookServiceImpl(BookDAO bookDAO) {
        this.bookDAO = bookDAO;
    }

    @Override
    @Transactional
    public List<Book> getCustomers(int theSortField) {
        return bookDAO.getBooks(theSortField);
    }

    @Override
    @Transactional
    public void saveBook(Book theBook) {
    	bookDAO.saveBook(theBook);
    }

    @Override
    @Transactional
    public Book getBook(int theId) {
        return bookDAO.getBook(theId);
    }

    @Override
    @Transactional
    public void deleteBook(int theId) {
    	bookDAO.deleteBook(theId);
    }

    @Override
    @Transactional
    public List<Book> searchBooks(String theSearchName) {
        return bookDAO.searchBooks(theSearchName);
    }
}
