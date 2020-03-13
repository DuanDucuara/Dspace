<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Location bar component
  -
  - This component displays the "breadcrumb" style navigation aid at the top
  - of most screens.
  -
  - Uses request attributes set in org.dspace.app.webui.jsptag.Layout, and
  - hence must only be used as part of the execution of that tag.  Plus,
  - dspace.layout.locbar should be verified to be true before this is included.
  -
  -  dspace.layout.parenttitles - List of titles of parent pages
  -  dspace.layout.parentlinks  - List of URLs of parent pages, empty string
  -                               for non-links
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
  
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="/WEB-INF/dspace-tags.tld" prefix="dspace" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale"%>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.content.Collection" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.eperson.EPerson" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.browse.BrowseIndex" %>
<%@ page import="org.dspace.browse.BrowseInfo" %>
<%@ page import="java.util.Map" %>

<%
    // Is anyone logged in?
    EPerson user = (EPerson) request.getAttribute("dspace.current.user");

    // Is the logged in user an admin
    Boolean admin = (Boolean)request.getAttribute("is.admin");
    boolean isAdmin = (admin == null ? false : admin.booleanValue());

    Boolean communityAdmin = (Boolean)request.getAttribute("is.communityAdmin");
    boolean isCommunityAdmin = (communityAdmin == null ? false : communityAdmin.booleanValue());
    
    Boolean collectionAdmin = (Boolean)request.getAttribute("is.collectionAdmin");
    boolean isCollectionAdmin = (collectionAdmin == null ? false : collectionAdmin.booleanValue());

    // Get the current page, minus query string
    String currentPage = UIUtil.getOriginalURL(request);
    int c = currentPage.indexOf( '?' );
    if( c > -1 )
    {
        currentPage = currentPage.substring( 0, c );
    }

    // E-mail may have to be truncated
    String navbarEmail = null;

    if (user != null)
    {
        navbarEmail = user.getEmail();
    }
    
    // get the browse indices
    
	BrowseIndex[] bis = BrowseIndex.getBrowseIndices();
    BrowseInfo binfo = (BrowseInfo) request.getAttribute("browse.info");
    String browseCurrent = "";
    if (binfo != null)
    {
        BrowseIndex bix = binfo.getBrowseIndex();
        // Only highlight the current browse, only if it is a metadata index,
        // or the selected sort option is the default for the index
        if (bix.isMetadataIndex() || bix.getSortOption() == binfo.getSortOption())
        {
            if (bix.getName() != null)
    			browseCurrent = bix.getName();
        }
    }
 // get the locale languages
    Locale[] supportedLocales = I18nUtil.getSupportedLocales();
    Locale sessionLocale = UIUtil.getSessionLocale(request);
%>

<div class="nav navbar-nav centrado">
  <li class="<%= currentPage.endsWith("/home.jsp")? "active" : "" %>"><a href="<%= request.getContextPath() %>/"><span class="glyphicon glyphicon-home"></span> <fmt:message key="jsp.layout.navbar-default.home"/></a></li>
    <%
			for (int i = 0; i < bis.length; i++)
			{
				BrowseIndex bix = bis[i];
				String key = "browse.menu." + bix.getName();
			%>
			<li><a href="<%= request.getContextPath() %>/browse?type=<%= bix.getName() %>"><fmt:message key="<%= key %>"/></a></li>
			<%	
			}
		%>
    <li class="<%= ( currentPage.endsWith( "/help" ) ? "active" : "" ) %>"><dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.index\") %>"><fmt:message key="jsp.layout.navbar-default.help"/></dspace:popup></li>
</div>