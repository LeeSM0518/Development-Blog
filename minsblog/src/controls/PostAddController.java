package controls;

import annotation.Component;
import bind.DataBinding;

import java.util.Map;

@Component("/post/add.do")
public class PostAddController implements Controller, DataBinding {
  @Override
  public String execute(Map<String, Object> model) throws Exception {
    String out = (String) model.get("contextArea");
    // TODO 글 쓰는 jsp 파일에서 제목과 카테고리를 반드시 쓰도록 설정
    if (out == null) {
      return "/main/WritePost.jsp";
    } else {
      System.out.println(out);
      return "redirect:/category/list.do?cid=Main";
    }
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "contextArea", String.class,
    };
  }
}
