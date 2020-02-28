package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlCommentDao;
import dao.PostgresSqlPostDao;

import java.util.Map;

@Component("/post/read.do")
public class DetailedPostController implements Controller, DataBinding {

  PostgresSqlPostDao postDao;
  PostgresSqlCommentDao commentDao;

  public void setPostDao(PostgresSqlPostDao postDao) {
    this.postDao = postDao;
  }

  public void setCommentDao(PostgresSqlCommentDao commentDao) {
    this.commentDao = commentDao;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    int postId = Integer.parseInt(((String) model.get("postid")));
    model.put("post", postDao.selectOne(postId));
    model.put("comments", commentDao.selectListOnPost(postId));
    return "/main/ReadMorePost.jsp";
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "postid", String.class
    };
  }
}
