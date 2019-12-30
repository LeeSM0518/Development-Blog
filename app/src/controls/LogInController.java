package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlMemberDao;
import vo.Member;

import java.util.Map;

@Component("/login")
public class LogInController implements Controller, DataBinding {

  PostgresSqlMemberDao memberDao;

  public LogInController setMemberDao(PostgresSqlMemberDao memberDao) {
    this.memberDao = memberDao;
    return this;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    // TODO 관리자 로그인, 방문자 로그인 구현
    //  LogIn.jsp 구현
    return null;
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "member", Member.class
    };
  }
}
