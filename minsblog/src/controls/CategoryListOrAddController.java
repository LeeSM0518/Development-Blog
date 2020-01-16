package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlCategoryDao;
import vo.Category;

import javax.servlet.http.HttpSession;
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
    HttpSession session = (HttpSession) model.get("session");
    // 아직은 paramMap이 사용되지는 않음
    model.put("category", categoryDao.selectList(paramMap));
    return "/home/home.jsp";
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "Category", Category.class
    };
  }

}
