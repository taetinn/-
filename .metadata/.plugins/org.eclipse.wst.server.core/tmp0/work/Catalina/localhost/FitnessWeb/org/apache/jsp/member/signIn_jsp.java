/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.35
 * Generated at: 2020-06-30 11:16:30 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signIn_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write(" ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../include/head.jsp", out, false);
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../include/nav.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write(" \t<!-- Form -->\r\n");
      out.write("\t<section>\r\n");
      out.write("\t\t<form method=\"post\" action=\"signinPro.jsp\">\r\n");
      out.write("\t\t\t<fieldset>\r\n");
      out.write("\t\t\t\t<div class=\"row uniform 50%\">\r\n");
      out.write("\t\t\t\t\t<div class=\"6u 12u$(xsmall)\">\r\n");
      out.write("\t\t\t\t\t\t<label>ID</label> \r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" name=\"id\" placeholder=\"id\" />\r\n");
      out.write("\t\t\t\t\t\t<label>PW</label>\r\n");
      out.write("\t\t\t\t\t\t <input type=\"password\" name=\"passwd\" placeholder=\"password\" />\r\n");
      out.write("\t\t\t\t\t\t <input type=\"checkbox\" name=\"keepLogin\" value=\"true\" id=\"keepLogin\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"keepLogin\">로그인 상태 유지</label>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t</fieldset>\r\n");
      out.write("\t\t\t<div class=\"3u 6u$(small) 12u$(xsmall)\">\r\n");
      out.write("\t\t\t\t<ul class=\"actions vertical small\">\r\n");
      out.write("\t\t\t\t\t<li><input type=\"submit\" class=\"button special small\" value=\"Sign In\"></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"signUp.jsp\" class=\"button alt small\">Sign Up</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t</section>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<!-- Footer -->\r\n");
      out.write(" \t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../include/footer.jsp", out, false);
      out.write(" \r\n");
      out.write("\r\n");
      out.write("\t<!-- Scripts -->\r\n");
      out.write("\t<script src=\"../assets/js/jquery.min.js\"></script>\r\n");
      out.write("\t<script src=\"../assets/js/skel.min.js\"></script>\r\n");
      out.write("\t<script src=\"../assets/js/util.js\"></script>\r\n");
      out.write("\t<!--[if lte IE 8]><script src=\"assets/js/ie/respond.min.js\"></script><![endif]-->\r\n");
      out.write("\t<script src=\"../assets/js/main.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
