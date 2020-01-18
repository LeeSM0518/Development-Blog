package controls;

import annotation.Component;
import bind.DataBinding;

import java.util.Map;

@Component("/post/add.do")
public class PostAddController implements Controller, DataBinding {
  @Override
  public String execute(Map<String, Object> model) throws Exception {
    // TODO WritePost.jsp 와 컨트롤러 수정 필요
    // TODO WritePost.jsp 에서 post로 markdown 데이터 전송 방법 생각
    String out = (String) model.get("returnContext");
    System.out.println(model);
    if (out == null) {
      return "/main/WritePost.jsp";
    } else {
      System.out.println((String) model.get("returnContext"));
      return "redirect:/category/list.do?cid=Main";
    }
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] {
        "returnContext", String.class,
        "context", String.class
    };
  }
}
