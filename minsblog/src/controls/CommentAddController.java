package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlCommentDao;
import vo.Comment;

import java.util.Map;

@Component("/comment/add.do")
public class CommentAddController implements DataBinding, Controller {

  PostgresSqlCommentDao commentDao;

  public void setCommentDao(PostgresSqlCommentDao commentDao) {
    this.commentDao = commentDao;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Comment comment = (Comment) model.get("comment");
    System.out.println(comment.toString());
    commentDao.insert(comment);
    return "redirect:/post/read.do?postid=" + comment.getPostId();
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "comment", Comment.class
    };
  }
}
