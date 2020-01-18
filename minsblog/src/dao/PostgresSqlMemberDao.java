package dao;

import annotation.Component;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.Member;

import java.util.HashMap;
import java.util.List;

@Component("memberDao")
public class PostgresSqlMemberDao implements MemberDao {

  SqlSessionFactory sqlSessionFactory;

  public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  @Override
  public List<Member> selectList(HashMap<String, Object> paramMap) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("dao.MemberDao.selectList", paramMap);
    }
  }

  @Override
  public Member exist(String username, String password) throws Exception {
    HashMap<String, String> paramMap = new HashMap<>();
    paramMap.put("username", username);
    paramMap.put("password", password);

    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("dao.MemberDao.exist", paramMap);
    }
  }

  @Override
  public int insert(Member member) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      int count = sqlSession.insert("dao.MemberDao.insert", member);
      sqlSession.commit();
      return count;
    }
  }

  @Override
  public Member selectOne(int id) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("dao.MemberDao.selectOne", id);
    }
  }

  @Override
  public int update(Member member) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      int count = sqlSession.update("dao.MemberDao.update", member);
      sqlSession.commit();
      return count;
    }
  }

}
