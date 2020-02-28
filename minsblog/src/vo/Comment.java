package vo;

import java.util.Date;

public class Comment {

  int id;
  String writer;
  Date date;
  String content;
  int postId;

  public int getId() {
    return id;
  }

  public Comment setId(int id) {
    this.id = id;
    return this;
  }

  public String getWriter() {
    return writer;
  }

  public Comment setWriter(String writer) {
    this.writer = writer;
    return this;
  }

  public Date getDate() {
    return date;
  }

  public Comment setDate(Date date) {
    this.date = date;
    return this;
  }

  public String getContent() {
    return content;
  }

  public Comment setContent(String content) {
    this.content = content;
    return this;
  }

  public int getPostId() {
    return postId;
  }

  public Comment setPostId(int postId) {
    this.postId = postId;
    return this;
  }

  @Override
  public String toString() {
    final StringBuilder sb = new StringBuilder("Comment{");
    sb.append("id=").append(id);
    sb.append(", writer='").append(writer).append('\'');
    sb.append(", date=").append(date);
    sb.append(", content='").append(content).append('\'');
    sb.append(", postId=").append(postId);
    sb.append('}');
    return sb.toString();
  }
}
