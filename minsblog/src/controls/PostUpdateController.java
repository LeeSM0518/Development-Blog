package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlCategoryDao;
import dao.PostgresSqlPostDao;
import vo.Category;
import vo.Post;

import java.util.Map;

@Component("/post/info.do")
public class PostUpdateController implements DataBinding, Controller {

  PostgresSqlPostDao postDao;
  PostgresSqlCategoryDao categoryDao;

  public void setPostDao(PostgresSqlPostDao postDao) {
    this.postDao = postDao;
  }

  public void setCategoryDao(PostgresSqlCategoryDao categoryDao) {
    this.categoryDao = categoryDao;
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "category", Category.class,
        "post", Post.class
    };
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Post post = (Post) model.get("post");
    int postId = post.getId();
    if (post.getTitle() == null) {
      // TODO Markdown 내용과 HTML 내용 삽입하는거 구현
      Category category = new Category();
      category.setId(post.getCategoryId());
      model.put("originCategory", categoryDao.selectOneById(category));
      model.put("post", postDao.selectOne(postId));
      model.put("categories", categoryDao.selectList());
      return "/main/UpdatePost.jsp";
    } else {
      postDao.update(post);
      return "redirect:/post/read.do?postId=" + postId;
    }
  }

}
