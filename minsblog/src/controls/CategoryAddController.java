package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlCategoryDao;
import vo.Category;

import java.util.Map;

@Component("/category/add.do")
public class CategoryAddController implements DataBinding, Controller {

  PostgresSqlCategoryDao categoryDao;

  public void setCategoryDao(PostgresSqlCategoryDao categoryDao) {
    this.categoryDao = categoryDao;
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "category", Category.class
    };
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Category category = (Category) model.get("category");
    categoryDao.insert(category);
    return "redirect:/category/list.do?cid=Main";
  }
}
