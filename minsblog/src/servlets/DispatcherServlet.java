package servlets;

import bind.DataBinding;
import bind.ServletRequestDataBinder;
import context.ApplicationContext;
import controls.Controller;
import listeners.ContextLoaderListener;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {

  @Override
  protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    resp.setContentType("text/html; charset=UTF-8");
    String servletPath = req.getServletPath();

    try {
      ApplicationContext ctx = ContextLoaderListener.getApplicationContext();

      HashMap<String, Object> model = new HashMap<>();
      model.put("session", req.getSession());

      Controller pageController = (Controller) ctx.getBean(servletPath);

      if (pageController == null) {
        throw new Exception("요청한 서비스를 찾을 수 없습니다.");
      }

      if (pageController instanceof DataBinding) {
        prepareRequestData(req, model, (DataBinding)pageController);
      }

      String viewUrl = pageController.execute(model);

      for (String key : model.keySet())
        req.setAttribute(key, model.get(key));

      if (viewUrl.startsWith("redirect:")) {
        resp.sendRedirect(viewUrl.substring(9));
      } else {
        RequestDispatcher rd = req.getRequestDispatcher(viewUrl);
        rd.include(req, resp);
      }

    } catch (Exception e) {
      e.printStackTrace();
      req.setAttribute("error", e);
      RequestDispatcher rd = req.getRequestDispatcher("/error.jsp");
      rd.forward(req, resp);
    }
  }

  private void prepareRequestData(HttpServletRequest request, HashMap<String, Object> model,
                                  DataBinding dataBinding) throws Exception {
    Object[] dataBinders = dataBinding.getDataBinders();
    for (int i = 0; i < dataBinders.length; i += 2) {
      String dataName = (String) dataBinders[i];
      Class<?> dataType = (Class<?>) dataBinders[i+1];
      Object dataObj = ServletRequestDataBinder.bind(request, dataType, dataName);
      model.put(dataName, dataObj);
    }
  }

}
