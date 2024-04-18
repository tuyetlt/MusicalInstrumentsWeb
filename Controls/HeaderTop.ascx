<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeaderTop.ascx.cs" Inherits="Controls_HeaderTop" %>
<%@ Import Namespace="System.Data" %>
<header>
    <div class="over-lay"></div>
    <div class="container">
        <div class="in"><% if (!Utils.isMobileBrowser)
                { %>
            <div class="item">
                <div class="logo"><% if (PageInfo.CurrentControl == ControlCurrent.Home.ToString())
                        { %>
                    <h1>
                        <a href="<%= C.ROOT_URL %>">
                            <img src="<%= C.ROOT_URL %><%= ConfigWeb.Logo %>" alt="<%= ConfigWeb.MetaTitle %>"></a></h1>
                    <%}
                        else
                        { %>
                    <a href="<%= C.ROOT_URL %>">
                        <img src="<%= C.ROOT_URL %><%= ConfigWeb.Logo %>" alt="<%= ConfigWeb.MetaTitle %>"></a><% } %>
                </div>
            </div>
            <div class="item">
                <div class="search">
                    <form method="GET" action="<%=C.ROOT_URL %>/tim-kiem.html" data-search="internal">
                        <input type="text" name="key" class="search_input" id="searchbox" autocomplete="off" placeholder="Tìm kiếm" />
                        <div class="loading-search"></div>
                        <button type="submit" class="sub_search">
                            <i class="fal fa-search"></i>
                        </button>
                    </form>
                    <div class="over-lay-search">
                    </div>
                    <div class="show_search_content">
                        <label>Đang tải sản phẩm gợi ý...</label>
                    </div>
                </div>
            </div>
            <div class="item item-update">
                <div class="menu">
                    <ul>
                        <%
                            if (1 == 1)
                            {
                                int menuFlag = (int)PositionMenuFlag.Top;
                                string filter = string.Format("(Hide is null OR Hide=0) AND PositionMenuFlag & {0} <> 0", menuFlag);
                                DataTable dt_1 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "Name,Icon,LinkTypeMenuFlag,AttrMenuFlag,FriendlyUrl,Link,SeoFlags", string.Format("ParentID=0 AND {0}", filter), "Sort");
                                if (Utils.CheckExist_DataTable(dt_1))
                                {
                                    foreach (DataRow dr_1 in dt_1.Rows)
                                    {
                                        string link = Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]);
                                        string noffollow = string.Empty;
                                        int SeoFlagINT = ConvertUtility.ToInt32(dr_1["SeoFlags"]);
                                        if (SeoFlagINT == (int)SeoFlag.Nofollow)
                                            noffollow = @" rel=""nofollow""";
                        %><li>
                            <a <%= Utils.CreateCategory_Target(dr_1["AttrMenuFlag"]) %> href="<%= link %>"<%= noffollow %>>
                                <img src="<%= dr_1["Icon"].ToString() %>" alt="<%= dr_1["Name"].ToString() %>" />
                                <span><%= dr_1["Name"].ToString() %></span>
                            </a>
                        </li>
                        <% }
                                }
                            }%></ul>
                </div>
                <div class="content-hotline">
                    <a href="#">
                        <div class="cnt-social-header">
                            <div class="icon-social">
                                <img src="/themes/image/hotline.png" alt="Alternate Text" />
                            </div>
                            <div class="cnt-hotline">
                                <h3>Hotline - Zalo</h3>
                                <span>0123456789</span>
                                <span>0123456789</span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <%} %>
        </div>
    </div>
    <% if (Utils.isMobileBrowser)
        { %>
    <div class="item">
        <div class="logo">
            <a href="<%= C.ROOT_URL %>">
                <img src="<%= ConfigWeb.Logo %>" alt="<%= ConfigWeb.MetaTitle %>"></a>
        </div>
    </div>
    <div class="menu-mobile">
        <div class="toggle_search">
            <i class="far fa-search"></i>
        </div>
        <label for="navbar-toggler" class="toggle_menu">
            <i class="far fa-bars"></i>
        </label>
        <input type="checkbox" class="navbar-input" name="" id="navbar-toggler" />
        <label for="navbar-toggler" class="overlay"></label>
        <div class="navbar-toggler-mobile">
            <div class="title-menu">
                <h3 class="title"><%= ConfigWeb.SiteName %></h3>
                <label for="navbar-toggler" class="exit">
                    <i class="fas fa-times"></i>
                </label>
            </div>
            <ul class="nav-list">
                <%
                    if (1 == 1)
                    {
                        int mainMenu = (int)PositionMenuFlag.Main;

                        string filter = string.Format("{0} AND PositionMenuFlag & {1} <> 0", Utils.CreateFilterHide, mainMenu);
                        DataTable dt_1 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID=0 AND {0}", filter), "Sort");
                        if (Utils.CheckExist_DataTable(dt_1))
                        {
                            foreach (DataRow dr_1 in dt_1.Rows)
                            {
                                string link_1 = TextChanger.GetLinkRewrite_Category(dr_1["FriendlyUrl"].ToString());
                                DataTable dt_2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,SeoFlags", string.Format("ParentID={0} AND {1}", dr_1["ID"], filter), "Sort");
                                 string noffollow1 = string.Empty;
                                        int SeoFlagINT = ConvertUtility.ToInt32(dr_1["SeoFlags"]);
                                        if (SeoFlagINT == (int)SeoFlag.Nofollow)
                                            noffollow1 = @" rel=""nofollow""";
                %>
                <li class="nav-item-mobile">
                    <a class="nav-link" href="<%= link_1 %>"<%= noffollow1 %>><%= dr_1["Name"].ToString() %></a>
                    <%  if (Utils.CheckExist_DataTable(dt_2))
                        {
                    %>
                    <a class="nav-link down" data-id="<%= dr_1["ID"].ToString() %>"><i class="fas fa-caret-down"></i></a>
                    <%
                        }
                    %>
                    <div class="clear"></div>
                    <ul class="sub-menu sub<%= dr_1["ID"].ToString() %>">
                        <%
                            if (Utils.CheckExist_DataTable(dt_2))
                            {
                                foreach (DataRow dr_2 in dt_2.Rows)
                                {
                                    string link_2 = TextChanger.GetLinkRewrite_Category(dr_2["FriendlyUrl"].ToString());
                                    DataTable dt_3 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,SeoFlags", string.Format("ParentID={0} AND {1}", dr_2["ID"], filter), "Sort");
                                      string noffollow2 = string.Empty;
                                        int SeoFlagINT2 = ConvertUtility.ToInt32(dr_2["SeoFlags"]);
                                        if (SeoFlagINT2 == (int)SeoFlag.Nofollow)
                                            noffollow2 = @" rel=""nofollow""";
                        %>
                        <li class="sub-menu-item">
                            <a class="category-item" href="<%= link_2 %>">
                                <%= dr_2["Name"].ToString() %>
                            </a>
                            <%  if (Utils.CheckExist_DataTable(dt_3))
                                {
                            %>
                            <a class="category-item down" data-id="<%= dr_2["ID"].ToString() %>"><i class="fas fa-caret-down"></i></a>
                            <%
                                }
                            %>
                            <div class="clear"></div>
                            <div class="option sub2_<%= dr_2["ID"].ToString() %>">
                                <%
                                    if (Utils.CheckExist_DataTable(dt_2))
                                    {
                                        foreach (DataRow dr_3 in dt_3.Rows)
                                        {
                                            string link_3 = TextChanger.GetLinkRewrite_Category(dr_3["FriendlyUrl"].ToString());
                                %>
                                <a class="option-link" href="<%= link_3 %>"<%= noffollow2 %>><%= dr_3["Name"].ToString() %></a>
                                <% }
                                    } %>
                            </div>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                </li>
                <% }
                        }
                    } %>
            </ul>
        </div>
        <div class="search_toggle_show">
            <form method="GET" action="<%=C.ROOT_URL %>/tim-kiem.html" data-search="internal">
                <button type="submit" class="sub_search">
                    <i class="fal fa-search"></i>
                </button>
                <input type="text" name="key" class="search_input" id="searchbox" autocomplete="off" placeholder="Tìm kiếm" />
                <div class="loading-search"></div>
                <div class="show_search_content"></div>
            </form>
        </div>
    </div>
    <%} %>
</header>
<div class="container" style="padding-top: 5px">
    <%=Utils.LoadUserControl("~/Controls/WidgetBannerTop.ascx") %>
</div>
<div class="menu-header">
    <div class="menu">
        <div class="container">
            <ul class="nav-list">
                <li class="nav-item category">
                    <a class="nav-link" href="#"><i class="fas fa-bars"></i>Danh mục sản phẩm</a>
                    <%=Utils.LoadUserControl("~/Controls/WidgetMenu.ascx") %>
                </li>
                <%=Utils.LoadUserControl("~/Controls/WidgetBreadcrumb.ascx") %>
            </ul>
        </div>
    </div>
</div>