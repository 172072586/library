package com.home.entity;

//书籍信息
public class Book {
    private Integer book_id;// 书本编号
    private String book_name;//书名
    private String author;//作者
    private String publish;// 出版社
    private String ISBN;//国际标准图书编号
    private String introduction;// 介绍
    private String language;//语言
    private double price;//价格
    private String pubdate;// 出版时间

    private Integer cid;// 类别编号
    private Category category;// 类别
    private Integer stock;// 库存


    public Integer getBook_id() {
        return book_id;
    }

    public void setBook_id(Integer book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPubdate() {
        return pubdate;
    }

    public void setPubdate(String pubdate) {
        this.pubdate = pubdate;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "Book{" +
                "book_id=" + book_id +
                ", book_name='" + book_name + '\'' +
                ", author='" + author + '\'' +
                ", publish='" + publish + '\'' +
                ", ISBN='" + ISBN + '\'' +
                ", introduction='" + introduction + '\'' +
                ", language='" + language + '\'' +
                ", price=" + price +
                ", pubdate='" + pubdate + '\'' +
                ", cid=" + cid +
                ", category=" + category +
                ", stock=" + stock +
                '}';
    }
}
