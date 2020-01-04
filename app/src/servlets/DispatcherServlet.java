package servlets;

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

@WebServlet("*")
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

      // TODO 나머지 구현 필요
      
    } catch (Exception e) {
      e.printStackTrace();
      req.setAttribute("error", e);
      RequestDispatcher rd = req.getRequestDispatcher("/error.jsp");
      rd.forward(req, resp);
    }
  }
}
