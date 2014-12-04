package com.use9.log.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.use9.frame.hibernate.pojo.Use9Admin;

public class CheckAdmin
  implements Filter
{
  public void destroy()
  {
  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException
  {
    HttpServletRequest req = (HttpServletRequest)request;
    HttpServletResponse resp = (HttpServletResponse)response;
    Use9Admin admin = null;
    admin = (Use9Admin)req.getSession().getAttribute("admin");
    if (admin == null) {
        resp.sendRedirect(req.getContextPath() + "/index.jsp");
    } else {
        chain.doFilter(req, resp);
    }
    	
  }

  public void init(FilterConfig filterConfig)
    throws ServletException
  {
  }
}