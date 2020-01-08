package vo;

import java.util.Date;

public class Post {

  int id;
  String title;
  int author;
  Date date;
  String content;
  int categoryId;

  public int getId() {
    return id;
  }

  public Post setId(int id) {
    this.id = id;
    return this;
  }

  public String getTitle() {
    return title;
  }

  public Post setTitle(String title) {
    this.title = title;
    return this;
  }

  public int getAuthor() {
    return author;
  }

  public Post setAuthor(int author) {
    this.author = author;
    return this;
  }

  public Date getDate() {
    return date;
  }

  public Post setDate(Date date) {
    this.date = date;
    return this;
  }

  public String getContent() {
    return content;
  }

  public Post setContent(String content) {
    this.content = content;
    return this;
  }

  public int getCategoryId() {
    return categoryId;
  }

  public Post setCategoryId(int categoryId) {
    this.categoryId = categoryId;
    return this;
  }
}
