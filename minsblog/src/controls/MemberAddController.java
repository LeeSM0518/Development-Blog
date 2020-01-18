package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlMemberDao;
import vo.Authority;
import vo.Member;

import java.util.Map;

@Component("/join.do")
public class MemberAddController implements DataBinding, Controller {

  PostgresSqlMemberDao memberDao;

  public MemberAddController setMemberDao(PostgresSqlMemberDao memberDao) {
    this.memberDao = memberDao;
    return this;
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "member", Member.class,
        "checkpassword", String.class
    };
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Member member = (Member) model.get("member");
    member.setAuthority(Authority.ADMIN);
    if (member.getUsername() == null) {
      return "/startbootstrap-sb-admin-2-gh-pages/register.jsp";
    } else {
      if (!member.getPassword().equals(model.get("checkpassword"))) {
        memberDao.insert(member);
        return "redirect:/category/list.do?cid=Main";
      } else {
        return "redirect:/join.do";
      }
    }
  }

}
