package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlMemberDao;
import vo.Member;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Component("/auth/login.do")
public class LogInController implements Controller, DataBinding {

  PostgresSqlMemberDao memberDao;

  public LogInController setMemberDao(PostgresSqlMemberDao memberDao) {
    this.memberDao = memberDao;
    return this;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Member member = (Member) model.get("member");
    if (member.getUsername() == null) {
      // TODO 추후에 경로 변경 필요
      return "/startbootstrap-sb-admin-2-gh-pages/LogInForm.jsp";
    } else {
      Member existMember = memberDao.exist(member.getUsername(), member.getPassword());
      if (existMember != null) {
        ((HttpSession) model.get("session"))
            .setAttribute("member", existMember);
        // TODO 메인 화면으로 경로 변경 필요
        return "redirect:#";
      } else {
        // TODO 추후에 경로 변경 필요
        return "/startbootstrap-sb-admin-2-gh-pages/LogInFail.jsp";
      }
    }
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "member", Member.class
    };
  }
}
