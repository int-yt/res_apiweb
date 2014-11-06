package com.use9.log.filter;

import com.use9.frame.hibernate.HibernateSessionFactory;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class SetCharacterEncodingFilter
  implements Filter
{
  protected FilterConfig filterConfig;
  protected String encodingName;
  protected boolean enable;

  public SetCharacterEncodingFilter()
  {
    this.encodingName = "UTF-8";
    this.enable = false;
  }

  public void init(FilterConfig filterConfig) throws ServletException {
    this.filterConfig = filterConfig;
    loadConfigParams();
  }

  private void loadConfigParams()
  {
    this.encodingName = this.filterConfig.getInitParameter("encoding");

    String strIgnoreFlag = this.filterConfig.getInitParameter("enable");
    if (strIgnoreFlag.equalsIgnoreCase("true"))
      this.enable = true;
    else
      this.enable = false;
  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException
  {
    if (this.enable)
      request.setCharacterEncoding(this.encodingName);

    Transaction tr = HibernateSessionFactory.getSession().beginTransaction();
    try
    {
      chain.doFilter(request, response);
      tr.commit();
    } catch (Exception e) {
      if (tr != null) tr.rollback();
      e.printStackTrace();

      HibernateSessionFactory.closeSession(); } finally { HibernateSessionFactory.closeSession();
    }
  }

  public void destroy()
  {
  }
}