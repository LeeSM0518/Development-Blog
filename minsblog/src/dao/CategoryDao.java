package dao;

import vo.Category;

import java.util.HashMap;
import java.util.List;

public interface CategoryDao {

  List<Category> selectList(HashMap<String, Object> paramMap) throws Exception;
  int insert(Category category) throws Exception;
  int delete(Category category) throws Exception;
  Category selectOne(int id) throws Exception;
  int update(HashMap<String, Object> paramMap) throws Exception;

}
