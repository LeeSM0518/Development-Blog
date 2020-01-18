package controls;

import annotation.Component;
import bind.DataBinding;
import dao.PostgresSqlCategoryDao;
import vo.Category;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Component("/category/list.do")
public class CategoryListController implements DataBinding, Controller {

  PostgresSqlCategoryDao categoryDao;

  public void setCategoryDao(PostgresSqlCategoryDao categoryDao) {
    this.categoryDao = categoryDao;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    HashMap<String, Object> paramMap = new HashMap<>();
    // TODO session 에서 어드민 정보가 있는지 확인 필요
    HttpSession session = (HttpSession) model.get("session");
    // TODO 카테고리가 Main 일때와 아닐때로 구분 필요
    // TODO Post mapper 파일에 카테고리 id로 부터 해당 글을 불러오는 조인 쿼리 추가 해야함
    // 아직은 paramMap이 사용되지는 않음
    model.put("categories", categoryDao.selectList(paramMap));
    return "/home/home.jsp";
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "category", Category.class
    };
  }

}
