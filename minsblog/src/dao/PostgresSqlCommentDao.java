package dao;

import annotation.Component;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.Comment;

import java.util.List;

@Component("commentDao")
public class PostgresSqlCommentDao implements CommentDao {

  SqlSessionFactory sqlSessionFactory;

  public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  @Override
  public List<Comment> selectListOnPost(int postId) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("dao.CommentDao.selectListOnPost", postId);
    }
  }

  @Override
  public int insert(Comment comment) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      int count = sqlSession.insert("dao.CommentDao.insert", comment);
      sqlSession.commit();
      return count;
    }
  }

  @Override
  public int delete(int id) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      int count = sqlSession.delete("dao.CommentDao.delete", id);
      sqlSession.commit();
      return count;
    }
  }

  @Override
  public int deleteByPostId(int id) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      int count = sqlSession.delete("dao.CommentDao.deleteByPostId", id);
      sqlSession.commit();
      return count;
    }
  }

}