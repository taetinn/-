/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.35
 * Generated at: 2020-07-12 16:16:11 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signUp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../include/head.jsp", out, false);
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("   \t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../include/nav.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("   <!-- Form -->\r\n");
      out.write("   <section>\r\n");
      out.write("      <h3>회원가입</h3>\r\n");
      out.write("      <form method=\"post\" action=\"signupPro.jsp\">\r\n");
      out.write("         <fieldset>\r\n");
      out.write("            <div class=\"row uniform 50%\">\r\n");
      out.write("               <div class=\"6u 12u$(xsmall)\">\r\n");
      out.write("                   <label>ID</label>\r\n");
      out.write("                   <input type=\"text\" name=\"id\" id=\"id\" required> \r\n");
      out.write("                   <span id=\"IdDupMsg\"></span>\r\n");
      out.write("                   <label>Password</label>\r\n");
      out.write("                   <input type=\"password\" id=\"pw1\" name=\"passwd\" required>\r\n");
      out.write("                   <label>Re-enter Password</label>\r\n");
      out.write("                   <input type=\"password\" id=\"pw2\" name=\"passwd2\">\r\n");
      out.write("                   <span id=PsswdMatch></span>\r\n");
      out.write("                   <label>Name</label>\r\n");
      out.write("                   <input type=\"text\" name=\"name\" required>\r\n");
      out.write("               </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"6u\">\r\n");
      out.write("               <div class=\"select-wrapper\">\r\n");
      out.write("               <label>Grade</label>\r\n");
      out.write("                  <select name=\"auth\" id=\"category\" required>\r\n");
      out.write("                     <option value=\"\">- 선택 -</option>\r\n");
      out.write("                     <option name=\"lecturer\" value=\"2\">강사</option>\r\n");
      out.write("                     <option name=\"member\" value=\"3\">회원</option>\r\n");
      out.write("                  </select>\r\n");
      out.write("               </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"4u 12u$(xsmall)\">\r\n");
      out.write("            <label>GX Type</label>\r\n");
      out.write("               <input type=\"checkbox\" id=\"Flying Yoga\" name=\"gxType\" value=\"yoga\" >\r\n");
      out.write("               <label for=\"Flying Yoga\">Flying Yoga</label>\r\n");
      out.write("               <input type=\"checkbox\" id=\"Cross Fit\" name=\"gxType\" value=\"crossfit\">\r\n");
      out.write("               <label for=\"Cross Fit\">Cross Fit</label>\r\n");
      out.write("               <input type=\"checkbox\" id=\"Pilates\" name=\"gxType\" value=\"pilates\">\r\n");
      out.write("               <label for=\"Pilates\">Pilates</label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"6u\">\r\n");
      out.write("               <div class=\"select-wrapper\">\r\n");
      out.write("                  <label>Period</label>\r\n");
      out.write("                  <select name=\"period\" id=\"period\">\r\n");
      out.write("                     <option value=\"\">- 선택 -</option>\r\n");
      out.write("                     <option value=\"1month\" >1month</option>\r\n");
      out.write("                     <option value=\"3month\" >3months</option>\r\n");
      out.write("                     <option value=\"1year\" >1year</option>\r\n");
      out.write("                  </select>\r\n");
      out.write("               </div>\r\n");
      out.write("            </div>\r\n");
      out.write("         </fieldset>\r\n");
      out.write("\r\n");
      out.write("         <fieldset>\r\n");
      out.write("            <label>Gender</label>\r\n");
      out.write("            <div class=\"4u 12u$(xsmall)\">\r\n");
      out.write("               <input type=\"radio\" id=\"female\" value = \"female\" name=\"gender\">\r\n");
      out.write("               <label for=\"female\">Female</label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"4u$ 12u$(xsmall)\">\r\n");
      out.write("               <input type=\"radio\" id=\"male\" value = \"male\" name=\"gender\">\r\n");
      out.write("               <label for=\"male\">Male</label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"6u 12u$(small)\">\r\n");
      out.write("               <label>Phone Number</label>\r\n");
      out.write("               <input type=\"text\" name=\"phone\">\r\n");
      out.write("               <label>Address</label>\r\n");
      out.write("               <input type=\"text\" name=\"address\">\r\n");
      out.write("            </div>\r\n");
      out.write("         </fieldset>\r\n");
      out.write("         <div class=\"12u$\">\r\n");
      out.write("            <ul class=\"actions\">\r\n");
      out.write("               <li><input type=\"submit\" value=\"SignUp\" class=\"special\" /></li>\r\n");
      out.write("               <li><input type=\"reset\" value=\"Reset\" /></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("         </div>\r\n");
      out.write("         </div>\r\n");
      out.write("      </form>\r\n");
      out.write("   </section>\r\n");
      out.write("\r\n");
      out.write("   <!-- Footer -->\r\n");
      out.write("   ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../include/footer.jsp", out, false);
      out.write("\r\n");
      out.write("   \r\n");
      out.write("\r\n");
      out.write("   <!-- Scripts -->\r\n");
      out.write("   <script src=\"../assets/jquery-3.5.1.js\"></script>\r\n");
      out.write("   <script src=\"../assets/js/jquery.min.js\"></script>\r\n");
      out.write("   <script src=\"../assets/js/skel.min.js\"></script>\r\n");
      out.write("   <script src=\"../assets/js/util.js\"></script>\r\n");
      out.write("   <script src=\"../assets/js/main.js\"></script>\r\n");
      out.write("   \r\n");
      out.write("   <script>\r\n");
      out.write("    \t$('input[name=id]').keyup(function(){\r\n");
      out.write("   \t\tvar id = $(this).val();\r\n");
      out.write("   \t\t$.ajax({\r\n");
      out.write("   \t\t\turl:'../IdDupCheck.jsp',\r\n");
      out.write("   \t\t\tdata:{id: id},\r\n");
      out.write("   \t\t\tdataType:'json',\r\n");
      out.write("   \t\t\tsuccess: function(data){\r\n");
      out.write("   \t\t\t\t//alert(typeof(data));\r\n");
      out.write("     \t\t\t\r\n");
      out.write("   \t\t\t\tif(data){\r\n");
      out.write("   \t\t\t\t\t$('span#IdDupMsg').html('사용 불가').css('color','red');\r\n");
      out.write("   \t\t\t\t}else{\r\n");
      out.write("   \t\t\t\t\t$('span#IdDupMsg').html('사용 가능').css('color','green');\r\n");
      out.write("   \t\t\t\t}\r\n");
      out.write("   \t\t\t}\r\n");
      out.write("   \t\t})\r\n");
      out.write("   \t}); \r\n");
      out.write("   \t\r\n");
      out.write("   \t$(function(){\r\n");
      out.write("   \t\t$('input#pw2').keyup(function(){\r\n");
      out.write("   \t\tvar pw1 = $('input#pw1').val();\r\n");
      out.write("   \t\tvar pw2 = $(this).val();\r\n");
      out.write("   \t\t\r\n");
      out.write("   \t\tif(pw1!=\"\" || pw2!=\"\"){\r\n");
      out.write("\t   \t\tif(pw1 == pw2){\r\n");
      out.write("\t\t\t\t\t$('span#PsswdMatch').html('비밀번호 일치').css('color','blue');\r\n");
      out.write("\t   \t\t}\r\n");
      out.write("\t   \t\telse{\r\n");
      out.write("\t\t\t\t\t$('span#PsswdMatch').html('비밀번호 불일치').css('color','red');\r\n");
      out.write("\t   \t\t}\r\n");
      out.write("   \t\t}\r\n");
      out.write("   \t});\r\n");
      out.write("   \t\t});\r\n");
      out.write("  \r\n");
      out.write("   </script>\r\n");
      out.write("\r\n");
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
