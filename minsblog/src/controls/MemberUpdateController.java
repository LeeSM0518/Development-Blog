package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlMemberDao;
import vo.Member;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Component("/myinfo.do")
public class MemberUpdateController implements Controller, DataBinding {

  PostgresSqlMemberDao memberDao;

  public void setMemberDao(PostgresSqlMemberDao memberDao) {
    this.memberDao = memberDao;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Member member = (Member) model.get("member");
    HttpSession session = (HttpSession) model.get("session");
    int id = ((Member) session.getAttribute("adminMember")).getId();
    if (member.getUsername() == null) {
      member = memberDao.selectOne(id);
      model.put("member", member);
      return "startbootstrap-sb-admin-2-gh-pages/MyInfo.jsp";
    } else {
      member.setId(id);
      memberDao.update(member);
      return "redirect:/category/list.do?cid=Main";
    }
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "member", Member.class
    };
  }

}
