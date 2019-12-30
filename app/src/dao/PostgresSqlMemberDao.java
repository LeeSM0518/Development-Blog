package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.Member;

import java.util.HashMap;
import java.util.List;

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
}
