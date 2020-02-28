package dao;

import vo.Comment;

import java.util.List;

public interface CommentDao {

  List<Comment> selectListOnPost(int postId) throws Exception;
  int insert(Comment comment) throws Exception;
  int delete(int id) throws Exception;

}
