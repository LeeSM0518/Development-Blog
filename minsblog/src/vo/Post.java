package vo;

import java.util.Date;

public class Post {

  int id;
  String title;
  int author;
  Date date;
  String markdownContent;
  int categoryId;
  String htmlContent;

  @Override
  public String toString() {
    final StringBuilder sb = new StringBuilder("Post{");
    sb.append("id=").append(id);
    sb.append(", title='").append(title).append('\'');
    sb.append(", author=").append(author);
    sb.append(", date=").append(date);
    sb.append(", markdownContent='").append(markdownContent).append('\'');
    sb.append(", htmlContent='").append(htmlContent).append('\'');
    sb.append(", categoryId=").append(categoryId);
    sb.append('}');
    return sb.toString();
  }

  public String getHtmlContent() {
    return htmlContent;
  }

  public void setHtmlContent(String htmlContent) {
    this.htmlContent = htmlContent;
  }

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

  public String getMarkdownContent() {
    return markdownContent;
  }

  public Post setMarkdownContent(String markdownContent) {
    this.markdownContent = markdownContent;
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
