package com.sonvt8.root.service;

import java.util.List;

import com.sonvt8.root.entity.Book;

public interface BookService {
    public List<Book> getCustomers(int theSortField);
    public void saveBook(Book theBook);
    public Book getBook(int theId);
    public void deleteBook(int theId);
    public List<Book> searchBooks(String theSearchName);
}
