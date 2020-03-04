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
      Post originPost = postDao.selectOne(postId);
      Category category = new Category();
      category.setId(originPost.getCategoryId());
      model.put("originCategory", categoryDao.selectOneById(category));
      model.put("post", originPost);
      model.put("categories", categoryDao.selectList());
      return "/main/UpdatePost.jsp";
    } else {
      Category category = (Category) model.get("category");
      category.setName(category.getName().trim());
      post.setCategoryId(categoryDao.selectOne(category).getId());
      postDao.update(post);
      return "redirect:/post/read.do?postid=" + postId;
    }
  }

}
