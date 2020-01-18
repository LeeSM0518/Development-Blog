package dao;

import annotation.Component;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.Category;

import java.util.HashMap;
import java.util.List;

@Component("categoryDao")
public class PostgresSqlCategoryDao implements CategoryDao {

  SqlSessionFactory sqlSessionFactory;

  public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  @Override
  public List<Category> selectList(HashMap<String, Object> paramMap) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("dao.CategoryDao.selectList");
    }
  }

  @Override
  public int insert(Category category) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      int count = sqlSession.insert("dao.CategoryDao.insert", category);
      sqlSession.commit();
      return count;
    }
  }

  @Override
  public int delete(Category category) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      int count = sqlSession.delete("dao.CategoryDao.delete", category);
      sqlSession.commit();
      return count;
    }
  }

  @Override
  public Category selectOne(int id) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("dao.CategoryDao.selectOne", id);
    }
  }

  @Override
  public int update(HashMap<String, Object> paramMap) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      int count = sqlSession.update("dao.CategoryDao.update", paramMap);
      sqlSession.commit();
      return count;
    }
  }

}