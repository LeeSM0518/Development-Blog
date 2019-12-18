package listeners;

import context.ApplicationContext;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.IOException;
import java.io.InputStream;

@WebListener
public class ContextLoaderListener implements ServletContextListener {

  static ApplicationContext applicationContext;

  public static ApplicationContext getApplicationContext() {
    return applicationContext;
  }

  @Override
  public void contextInitialized(ServletContextEvent sce) {
    try {
      applicationContext = new ApplicationContext();

      String resource = "dao/mybatis-config.xml";
      InputStream inputStream = Resources.getResourceAsStream(resource);
      SqlSessionFactory sqlSessionFactory =
          new SqlSessionFactoryBuilder().build(inputStream);

      applicationContext.addBean("sqlSessionFactory", sqlSessionFactory);

      ServletContext sc = sce.getServletContext();
      sc.setRequestCharacterEncoding("UTF-8");

      String propertiesPath = sc.getRealPath(
          sc.getInitParameter("contextConfigLocation"));

      applicationContext.prepareObjectsByProperties(propertiesPath);
      applicationContext.prepareObjectsByAnnotation("");
      applicationContext.injectDependency();
    } catch (Throwable e) {
      e.printStackTrace();
    }
  }

  @Override
  public void contextDestroyed(ServletContextEvent sce) {

  }
}
