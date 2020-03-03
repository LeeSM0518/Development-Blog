package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlCommentDao;
import dao.PostgresSqlPostDao;
import vo.Post;

import java.util.Map;

@Component("/post/delete.do")
public class PostDeleteController implements DataBinding, Controller {

  PostgresSqlPostDao postDao;
  PostgresSqlCommentDao commentDao;

  public void setPostDao(PostgresSqlPostDao postDao) {
    this.postDao = postDao;
  }

  public void setCommentDao(PostgresSqlCommentDao commentDao) {
    this.commentDao = commentDao;
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "post", Post.class
    };
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Post post = (Post) model.get("post");
    commentDao.deleteByPostId(post.getId());
    postDao.delete(post.getId());
    return "redirect:/category/list.do?cid=Main";
  }

}
