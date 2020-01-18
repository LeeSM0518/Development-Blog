package dao;

import vo.Member;

import java.util.HashMap;
import java.util.List;

public interface MemberDao {

  List<Member> selectList(HashMap<String, Object> paramMap) throws Exception;
  Member exist(String username, String password) throws Exception;
  int insert(Member member) throws Exception;
  Member selectOne(int id) throws Exception;
  int update(Member member) throws Exception;

}
