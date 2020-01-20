package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlCategoryDao;
import vo.Category;

import java.util.HashMap;
import java.util.Map;

@Component("/category/update.do")
public class CategoryUpdateController implements DataBinding, Controller {

  PostgresSqlCategoryDao categoryDao;

  public void setCategoryDao(PostgresSqlCategoryDao categoryDao) {
    this.categoryDao = categoryDao;
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "category", Category.class,
        "beforeName", String.class,
        "changeName", String.class
    };
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    HashMap<String, Object> paramMap = new HashMap<>();
    paramMap.put("beforeName", model.get("beforeName"));
    paramMap.put("changeName", model.get("changeName"));
    categoryDao.update(paramMap);
    return "redirect:/category/list.do?cid=Main";
  }
}
