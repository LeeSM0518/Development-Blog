package dao;

import annotation.Component;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.Post;

import java.util.List;

@Component("postDao")
public class PostgresSqlPostDao implements PostDao {

  SqlSessionFactory sqlSessionFactory;

  public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  @Override
  public List<Post> selectList() throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("dao.PostDao.selectList");
    }
  }

  @Override
  public int selectOne(int id) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("dao.PostDao.selectOne", id);
    }
  }

  @Override
  public int insert(Post post) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.insert("dao.PostDao.insert", post);
    }
  }

  @Override
  public int update(Post post) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.update("dao.PostDao.update", post);
    }
  }

  @Override
  public int delete(int id) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.delete("dao.PostDao.delete", id);
    }
  }

}