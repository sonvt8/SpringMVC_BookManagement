package com.sonvt8.root.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sonvt8.root.constant.SortBookColumn;
import com.sonvt8.root.entity.Book;
import com.sonvt8.root.service.BookService;

import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {
	private BookService bookService;

    @Autowired
    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/list")
    public String listBooks(Model theModel, @RequestParam(required = false) String sort) {

        List<Book> theBooks = null;

        if (sort != null) {
            int theSortField = Integer.parseInt(sort);
            theBooks = bookService.getBooks(theSortField);
        } else {
        	theBooks = bookService.getBooks(SortBookColumn.TITLE);
        }

        theModel.addAttribute("books", theBooks);

        return "list-books";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {

        // create model attribute to bind form data
        Book theBook = new Book();
        theModel.addAttribute("book", theBook);

        return "book-form";
    }

    @PostMapping("/saveBook")
    public String saveBook(@ModelAttribute("book") Book theBook) {
    	bookService.saveBook(theBook);

        // redirect from controller to another URL in controller
        return "redirect:/books/list";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("bookId") int theId, Model theModel) {
        // get customer from DB
        Book theBook = bookService.getBook(theId);

        // bind data to theModel
        theModel.addAttribute("book", theBook);

        return "customer-form";
    }

    @GetMapping("/delete")
    public String deleteBook(@RequestParam("bookId") int theId) {
    	bookService.deleteBook(theId);
        return "redirect:/books/list";
    }

    @GetMapping("search")
    public String searchBook(@RequestParam("theSearchName") String theSearchName, Model theModel) {
        List<Book> theBooks = bookService.searchBooks(theSearchName);
        theModel.addAttribute("books", theBooks);
        return "list-books";
    }
}
