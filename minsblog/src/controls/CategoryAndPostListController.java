package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlCategoryDao;
import dao.PostgresSqlPostDao;
import vo.Category;

import java.util.Map;

@Component("/category/list.do")
public class CategoryAndPostListController implements DataBinding, Controller {

  PostgresSqlCategoryDao categoryDao;
  PostgresSqlPostDao postgresSqlPostDao;

  public void setCategoryDao(PostgresSqlCategoryDao categoryDao) {
    this.categoryDao = categoryDao;
  }

  public void setPostgresSqlPostDao(PostgresSqlPostDao postgresSqlPostDao) {
    this.postgresSqlPostDao = postgresSqlPostDao;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    String categoryId = (String) model.get("cid");
    if (categoryId.equals("Main")) {
      model.put("posts", postgresSqlPostDao.selectList());
    } else {
      Category category = new Category().setName(categoryId);
      int categoryIdInt = categoryDao.selectOne(category).getId();
      model.put("posts", postgresSqlPostDao.selectListByCategoryId(categoryIdInt));
    }
    model.put("categories", categoryDao.selectList());
    return "/home/home.jsp";
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[]{
            "category", Category.class,
            "cid", String.class
    };
  }

}
