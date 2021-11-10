package com.sonvt8.root.dao;

import com.sonvt8.root.entity.Book;
import com.sonvt8.root.dao.BookDAO;
import com.sonvt8.root.constant.SortBookColumn;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDAOImpl implements BookDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public BookDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Book> getBooks(int theSortField) {
        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        String sortField = null;

        switch (theSortField) {
            case SortBookColumn.TITLE:
                sortField = "Title";
                break;
            default:
            	sortField = "Author";
                break;
        }

        Query<Book> theQuery = currentSession.createQuery("from Book order by " + sortField, Book.class);

        List<Book> books = theQuery.getResultList();

        return books;
    }

    @Override
    public void saveBook(Book theBook) {
        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // if the primaryKey is empty, then INSERT else UPDATE.
        currentSession.saveOrUpdate(theBook);
    }

    @Override
    public Book getBook(int theId) {
        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        Book theBook = currentSession.get(Book.class, theId);

        return theBook;
    }

    @Override
    public void deleteBook(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();

        Query theQuery = currentSession.createQuery("delete from Book where id=:bookId");
        theQuery.setParameter("bookId", theId);
        theQuery.executeUpdate();
    }

    @Override
    public List<Book> searchBooks(String theSearchName) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query theQuery = null;

        if (theSearchName != null & theSearchName.trim().length() > 0) {
            theQuery = currentSession.createQuery("from Book where lower(Title) like :theName " +
                    "or lower(Author) like :theName", Book.class);

            theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");
        } else {
            theQuery = currentSession.createQuery("from Books", Book.class);
        }

        List<Book> books = theQuery.getResultList();

        return books;
    }
}
