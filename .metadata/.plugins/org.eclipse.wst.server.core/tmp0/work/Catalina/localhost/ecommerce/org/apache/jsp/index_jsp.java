/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.74
 * Generated at: 2023-05-27 19:13:52 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import models.User;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/components/navbar.jsp", Long.valueOf(1685214425142L));
    _jspx_dependants.put("/components/footer.jsp", Long.valueOf(1685199260773L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("models.User");
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
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
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
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Home Page</title>\r\n");
      out.write(" <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\r\n");
      out.write("        integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\r\n");
      out.write("        <link href=\"https://unicons.iconscout.com/release/v3.0.6/css/line.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/index.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");
      out.write("\r\n");
      out.write("\r\n");

User currentUser = (User) session.getAttribute("current-user");

      out.write("\r\n");
      out.write(" <header>\r\n");
      out.write("        <nav class=\" navbar navbar-expand-lg navbar-light bg-light fixed-top\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <h2 class=\"me-auto my-auto\">AEY37</h2>\r\n");
      out.write("                <div class=\"col-md-5\">\r\n");
      out.write("                    <ul class=\" d-flex justify-content-around list-unstyled my-auto\">\r\n");
      out.write("                        <li class=\"border-bottom border-success border-2\"><a class=\"text-decoration-none text-dark\" href=\"index.html\">Anasayfa</a></li>\r\n");
      out.write("                        \r\n");
      out.write("               	");

				if (currentUser != null && currentUser.isAdmin()) {
				
      out.write("\r\n");
      out.write("				<li class=\"text-decoration-none  text-dark\"><a class=\"text-decoration-none text-dark\" href=\"AdminMainPanel.jsp\">Admin Paneli</a></li>\r\n");
      out.write("				");

				}
				
      out.write("\r\n");
      out.write("                        \r\n");
      out.write("                ");

				if (currentUser == null) {
				
      out.write("\r\n");
      out.write("				<!-- Button Group -->\r\n");
      out.write("				<li class=\"text-decoration-none  text-dark\"><a   class=\"text-decoration-none text-dark\" href=\"login.jsp\">Sign In</a></li>\r\n");
      out.write("				<li class=\"text-decoration-none  text-dark\"><a   class=\"text-decoration-none text-dark\"href=\"register.jsp\">Register</a></li>\r\n");
      out.write("				");

				} else {
				
      out.write("\r\n");
      out.write("				<li><a class=\"text-decoration-none text-dark\" aria-current=\"page\"\r\n");
      out.write("						href=\"LogOutServlet\">Log Out</span>\r\n");
      out.write("					</a></li>\r\n");
      out.write("				<li class=\"text-decoration-none  text-dark btn btn-danger\">\r\n");
      out.write("					<a  class=\"text-decoration-none text-white\" aria-current=\"page\"style=\"text-transform: uppercase\"> <span>");
      out.print(currentUser.getUsername());
      out.write("</span></a>\r\n");
      out.write("				</li>\r\n");
      out.write("				");

				}
				
      out.write("\r\n");
      out.write("                    </ul>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("    </header>");
      out.write("\r\n");
      out.write("	\r\n");
      out.write("	 <section id=\"hero\" class=\"w-100 p-0 mb-5 position-relative d-flex z-3 flex-column justify-content-center align-items-center\" style=\"height: 60vh;background: url('images/hero-bg.jpg') center center;background-size: cover;\">\r\n");
      out.write("        <div class=\"container text-center text-md-left\" data-aos=\"fade-up\">\r\n");
      out.write("            <h1 class=\"title mb-3 font-weight-bold text-white\">Benimle <span class=\"border-bottom border-info border-5 rounded\">Tanış</span></h1>\r\n");
      out.write("            <h2 class=\"sub__title mb-5\" style=\"color: rgba(255, 255, 255, 0.8)\">Hayalindeki projeyi gerçeğe dönüştürmeden önce benim hakkımda fikir edin!</h2>\r\n");
      out.write("        </div>\r\n");
      out.write("    </section>\r\n");
      out.write("    \r\n");
      out.write("	");
      out.write("\r\n");
      out.write("<footer class=\"pt-5 mt-5 px-0 mx-0\">\r\n");
      out.write("        <div class=\"container-fluid bg bg-dark\">\r\n");
      out.write("            <div class=\"row p-5\">\r\n");
      out.write("                <div class=\"col-md-4\">\r\n");
      out.write("                    <h4 class=\"text-white\">Menu</h4>\r\n");
      out.write("                    <ul class=\"list-unstyled  d-flex flex-column justify-content-around\">\r\n");
      out.write("                        <li class=\"mt-2\"><a class=\"text-decoration-none text-white\" href=\"index.html\">Anasayfa</a></li>\r\n");
      out.write("                        <li class=\"mt-2\"><a class=\"text-decoration-none text-white\" href=\"about.html\">Hakkımda</a></li>\r\n");
      out.write("                        <li class=\"mt-2\"><a class=\"text-decoration-none text-white\" href=\"project.html\">Projeler</a></li>\r\n");
      out.write("                        <li class=\"mt-2\"><a class=\"text-decoration-none  text-white\" href=\"contact.html\">İletişim</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-md-4\">\r\n");
      out.write("                    <h4 class=\"text-white mb-2\">İletişim</h4>\r\n");
      out.write("                    <p class=\"text-white\">Email: <span class=\"font-italic\">alperenesyavuz37@gmail.com</span></p>\r\n");
      out.write("                    <p class=\"text-white\">Adres: <span class=\"font-italic\">Kastamonu / Tosya</span></p>\r\n");
      out.write("                    \r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-md-4\">\r\n");
      out.write("                    <h4 class=\"text-white\">Sosyal Medya</h4>\r\n");
      out.write("                    <ul class=\"list-unstyled  d-flex  justify-content-start\">\r\n");
      out.write("                        <li class=\"mt-2 me-5\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"32\" height=\"32\" fill=\"#ffffff\" class=\"bi bi-facebook\" viewBox=\"0 0 16 16\">\r\n");
      out.write("                            <path d=\"M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z\"/>\r\n");
      out.write("                          </svg></li>\r\n");
      out.write("                        <li class=\"mt-2 me-5\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"32\" height=\"32\" fill=\"#ffffff\" class=\"bi bi-instagram\" viewBox=\"0 0 16 16\">\r\n");
      out.write("                            <path d=\"M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z\"/>\r\n");
      out.write("                          </svg></li>\r\n");
      out.write("                        <li class=\"mt-2 me-5\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"32\" height=\"32\" fill=\"#ffffff\" class=\"bi bi-twitter\" viewBox=\"0 0 16 16\">\r\n");
      out.write("                            <path d=\"M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z\"/>\r\n");
      out.write("                          </svg></li>\r\n");
      out.write("                       \r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </footer>");
      out.write("\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\"\r\n");
      out.write("    integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\"\r\n");
      out.write("    crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\"\r\n");
      out.write("    integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\"\r\n");
      out.write("    crossorigin=\"anonymous\"></script>\r\n");
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
