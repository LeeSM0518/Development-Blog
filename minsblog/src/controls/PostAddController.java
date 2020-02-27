package controls;

import annotation.Component;
import bind.DataBinding;
import dao.CategoryDao;
import dao.PostDao;
import vo.Category;
import vo.Member;
import vo.Post;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Component("/post/add.do")
public class PostAddController implements Controller, DataBinding {

  CategoryDao categoryDao;
  PostDao postDao;

  public void setCategoryDao(CategoryDao categoryDao) {
    this.categoryDao = categoryDao;
  }

  public void setPostDao(PostDao postDao) {
    this.postDao = postDao;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Post post = (Post) model.get("post");
    Category category = (Category) model.get("category");
    if (post.getTitle() == null) {
      model.put("categories", categoryDao.selectList());
      return "/main/WritePost.jsp";
    } else {
      HttpSession session = (HttpSession) model.get("session");
      Member member = (Member) session.getAttribute("adminMember");
      post.setAuthor(member.getId());
      post.setCategoryId(categoryDao.selectOne(category).getId());
      System.out.println(post);
      postDao.insert(post);
      return "redirect:/category/list.do?cid=Main";
    }
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[]{
            "category", Category.class,
            "post", Post.class
    };
  }
}
