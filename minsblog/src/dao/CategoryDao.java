package dao;

import vo.Category;

import java.util.HashMap;
import java.util.List;

public interface CategoryDao {

  List<Category> selectList(HashMap<String, Object> paramMap) throws Exception;
  int insert(Category category) throws Exception;
  int delete(int id) throws Exception;
  Category selectOne(int id) throws Exception;
  int update(Category category) throws Exception;

}
