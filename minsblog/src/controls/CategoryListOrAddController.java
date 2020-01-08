package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlCategoryDao;
import vo.Category;

import java.util.HashMap;
import java.util.Map;

@Component("/category.do")
public class CategoryListOrAddController implements DataBinding, Controller {

  PostgresSqlCategoryDao categoryDao;

  public void setCategoryDao(PostgresSqlCategoryDao categoryDao) {
    this.categoryDao = categoryDao;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    HashMap<String, Object> paramMap = new HashMap<>();
    // 아직은 paramMap이 사용되지는 않음
    model.put("category", categoryDao.selectList(paramMap));
    // TODO return 구현해야함
    return null;
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "Category", Category.class
    };
  }

}
