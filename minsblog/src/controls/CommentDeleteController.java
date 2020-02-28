package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlCommentDao;

import java.util.Map;

@Component("/comment/delete.do")
public class CommentDeleteController implements DataBinding, Controller {

  PostgresSqlCommentDao commentDao;

  public void setCommentDao(PostgresSqlCommentDao commentDao) {
    this.commentDao = commentDao;
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "deleteCommentId", String.class,
        "deleteCommentOnPostId", String.class
    };
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    commentDao.delete(Integer.parseInt((String) model.get("deleteCommentId")));
    return "redirect:/post/read.do?postid=" + model.get("deleteCommentOnPostId");
  }
}
