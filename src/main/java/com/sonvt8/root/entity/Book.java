package com.sonvt8.root.entity;

import javax.persistence.*;

@Entity
@Table(name="Books")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="Title")
    private String title;

    @Column(name = "Author")
    private String author;

    @Column(name="Price")
    private String price;
    
    @Column(name="Released")
    private String released;
    
    @Column(name="Quantity")
    private int quantity;
    
    @Column(name="ImageUrl")
    private String imageUrl;
    
    @Column(name="Description")
    private String description;
    
    @ManyToOne(cascade = {CascadeType.REFRESH, CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE})
    @JoinColumn(name = "CategoryId")
    private Category category;

	public Book() { }
    
    public Book(String title, String author, String price, String released, int quantity, String imageUrl, String description) {
        this.title = title;
        this.author = author;
        this.price = price;
        this.released = released;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getReleased() {
		return released;
	}

	public void setReleased(String released) {
		this.released = released;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
    public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}
