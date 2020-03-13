<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
%>

            <%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null)
    {
%>
	</div>
	<div class="col-md-3">
                    <%= sidebar %>
    </div>
    </div>       
<%
    }
%>
</div>
</main>
            <%-- Page footer --%>
             <footer class="navbar navbar-inverse navbar-bottom">
             <div id="designedby" class="container text-muted">
              <a href="https://www.colombiacompra.gov.co/"><img
                                    src="<%= request.getContextPath() %>/image/colombia-compra-eficiente.png"
                                    alt="Logo Colombia compra eficiente" /></a>
              <a href="https://www.mineducacion.gov.co/portal/"><img
                                    src="<%= request.getContextPath() %>/image/mineducacion.png"
                                    alt="Logo Mineducación" /></a>
              <a href="https://www.lasalle.org.co/"><img
                                    src="<%= request.getContextPath() %>/image/logo-lasalle.png"
                                    alt="Logo de la salle" /></a>
              <a href="https://unevoc.unesco.org/go.php?q=UNEVOC+Network+-+Home"><img
                                    src="<%= request.getContextPath() %>/image/unevoc.png"
                                    alt="Logo unevoc" /></a>
			  <div id="footer_feedback" class="pull-right">                                    
                                <p class="text-muted"><fmt:message key="jsp.layout.footer-default.text"/>&nbsp;-
                                <a target="_blank" href="<%= request.getContextPath() %>/feedback"><fmt:message key="jsp.layout.footer-default.feedback"/></a>
                                <a href="<%= request.getContextPath() %>/htmlmap"></a></p>
                                </div>
			</div>
    </footer>
    </body>
</html>