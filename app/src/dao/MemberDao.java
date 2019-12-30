package dao;

import vo.Member;

import java.util.HashMap;
import java.util.List;

public interface MemberDao {

  List<Member> selectList(HashMap<String, Object> paramMap) throws Exception;
  Member exist(String username, String password) throws Exception;

}
