package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlPostDao;

import java.util.Map;

@Component("/post/read.do")
public class DetailedPostController implements Controller, DataBinding {

  PostgresSqlPostDao postDao;

  public void setPostDao(PostgresSqlPostDao postDao) {
    this.postDao = postDao;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    String postId = (String) model.get("postid");
    model.put("post", postDao.selectOne(Integer.parseInt(postId)));
    System.out.println("date");
    System.out.println(postDao.selectOne(Integer.parseInt(postId)).getDate());
    System.out.println();
    return "/main/ReadMorePost.jsp";
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "postid", String.class
    };
  }
}
