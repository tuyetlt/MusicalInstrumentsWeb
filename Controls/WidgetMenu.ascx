<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetMenu.ascx.cs" Inherits="Controls_WidgetMenu" %>
<%@ Import Namespace="System.Data" %>
<div class="over-lay-menu"></div>
<ul class="sub-menu"><%
        if (!Utils.isMobileBrowser)
        {
            string filter = string.Format("{0} AND {1}", Utils.CreateFilterHide, Utils.CreateFilterFlags(PositionMenuFlag.Main, "PositionMenuFlag"));
            DataTable dt_1 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,SeoFlags,AttrMenuFlag,Icon,LinkTypeMenuFlag,Link,Image_3", string.Format("ParentID=0 AND {0}", filter), "Sort", 1, C.MAX_ITEM_MENU);
            if (Utils.CheckExist_DataTable(dt_1))
            {
                foreach (DataRow dr_1 in dt_1.Rows)
                {
                    string link_1 = Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]);
                    string noffollow1 = string.Empty;
                    int SeoFlagINT = ConvertUtility.ToInt32(dr_1["SeoFlags"]);
                    if (SeoFlagINT == (int)SeoFlag.Nofollow)
                        noffollow1 = @" rel=""nofollow""";
    %><li class="sub-menu-item">
        <a class="category-item" href="<%= link_1 %>" <%= Utils.CreateCategory_Target(dr_1["AttrMenuFlag"]) %><%= noffollow1 %>>
            <div class="content">
                <div class="img-icon">
                    <img src="<%= dr_1["Icon"].ToString() %>" alt="<%= dr_1["Name"] %>" />
                </div>
                <span class="text"><%= dr_1["Name"].ToString() %></span>
            </div>
        </a><%
            int subMenu = (int)PositionMenuFlag.MenuSubMainHome;

            string filter2 = string.Format("(Hide is null OR Hide=0) AND PositionMenuFlag & {0} <> 0", subMenu);
            DataTable dt_sub = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,SeoFlags,AttrMenuFlag,LinkTypeMenuFlag,Icon,Link", string.Format("ParentID={0} AND {1}", dr_1["ID"], filter2), "Sort");
            if (Utils.CheckExist_DataTable(dt_sub))
            {

                Response.Write(@"<div class=""option"">");
                int count = 0;
                foreach (DataRow dr_sub in dt_sub.Rows)
                {
                    string noffollow2 = string.Empty;
                    int SeoFlagINT2 = ConvertUtility.ToInt32(dr_sub["SeoFlags"]);
                    if (SeoFlagINT2 == (int)SeoFlag.Nofollow)
                        noffollow2 = @" rel=""nofollow""";

                    string comma = "";
                    if (count > 0)
                        comma = ", ";

                    Response.Write(string.Format(@"{0}<a{1} class=""option-link"" href=""{2}"">{3}</a>", comma, noffollow2, Utils.CreateCategoryLink(dr_sub["LinkTypeMenuFlag"], dr_sub["FriendlyUrl"], dr_sub["Link"]), dr_sub["Name"].ToString()));
                    count++;
                }

                Response.Write(@"</div>");
            }
        %>
        <%
            int subMenu2 = (int)PositionMenuFlag.MenuSubMainHome2;

            string filter3 = string.Format("(Hide is null OR Hide=0) AND PositionMenuFlag & {0} <> 0", subMenu2);
            DataTable dt_sub2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,SeoFlags,AttrMenuFlag,LinkTypeMenuFlag,Icon,Link,Image_3", string.Format("ParentID={0} AND {1}", dr_1["ID"], filter3), "Sort");
            if (Utils.CheckExist_DataTable(dt_sub2))
            {
                Response.Write(@"<div class=""option"">");
                int count = 0;
                foreach (DataRow dr_sub2 in dt_sub2.Rows)
                {
                     string noffollow3= string.Empty;
                                        int SeoFlagINT3 = ConvertUtility.ToInt32(dr_sub2["SeoFlags"]);
                                        if (SeoFlagINT3 == (int)SeoFlag.Nofollow)
                                            noffollow3 = @" rel=""nofollow""";

                    string comma = "";
                    if (count > 0)
                        comma = ", ";

                    Response.Write(string.Format(@"{0}<a{1} class=""option-link"" href=""{2}"">{3}</a>", comma, noffollow3, Utils.CreateCategoryLink(dr_sub2["LinkTypeMenuFlag"], dr_sub2["FriendlyUrl"], dr_sub2["Link"]), dr_sub2["Name"].ToString()));
                    count++;
                }
                Response.Write(@"</div>");
            }
            string background_css = string.Empty;
            if (!string.IsNullOrEmpty(dr_1["Image_3"].ToString()))
            {
                background_css = string.Format(@" style=""background-image: url('{0}')""", dr_1["Image_3"].ToString());
            } %><div class="category-content" <%= background_css %>>
            <div class="content">
                <%
                    int flagStyle1 = (int)PositionMenuFlag.Style1;

                    string filter_style1 = string.Format("(Hide is null OR Hide=0) AND PositionMenuFlag & {0} <> 0", flagStyle1);
                    DataTable dt_2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,SeoFlags,AttrMenuFlag,LinkTypeMenuFlag,Icon,Link,Image_3", string.Format("ParentID={0} AND {1}", dr_1["ID"], filter_style1), "Sort");
                    if (Utils.CheckExist_DataTable(dt_2))
                    {
                        foreach (DataRow dr_2 in dt_2.Rows)
                        {
                             string noffollow4 = string.Empty;
                                        int SeoFlagINT4 = ConvertUtility.ToInt32(dr_2["SeoFlags"]);
                                        if (SeoFlagINT4 == (int)SeoFlag.Nofollow)
                                            noffollow4 = @" rel=""nofollow""";

                            string icon = "";
                            if (!string.IsNullOrEmpty(dr_2["Icon"].ToString()))
                                icon = dr_2["Icon"].ToString();
                            string link = Utils.CreateCategoryLink(dr_2["LinkTypeMenuFlag"], dr_2["FriendlyUrl"], dr_2["Link"]);
                %><div class="container-link">
                    <%--<% if (!string.IsNullOrEmpty(icon))
                        { %><a href="<%= link %>">
                        <img src="<%= icon %>" alt="<%= dr_2["Name"].ToString() %>" /></a>
                    <% } %>--%><p class="title">
                        <a href="<%= link %>"<%= noffollow4 %>><%= dr_2["Name"].ToString() %></a>
                    </p>
                    <hr />
                    <ul class="link-list"><%
                            DataTable dt_3 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,SeoFlags,AttrMenuFlag,LinkTypeMenuFlag,Icon,Link,Image_3", string.Format("(Hide is null OR Hide=0) AND ParentID={0}", dr_2["ID"]), "Sort");
                            if (Utils.CheckExist_DataTable(dt_2))
                            {
                                foreach (DataRow dr_3 in dt_3.Rows)
                                {
                                      string noffollow5 = string.Empty;
                                        int SeoFlagINT5 = ConvertUtility.ToInt32(dr_3["SeoFlags"]);
                                        if (SeoFlagINT5 == (int)SeoFlag.Nofollow)
                                            noffollow4 = @" rel=""nofollow""";
                                    link = Utils.CreateCategoryLink(dr_3["LinkTypeMenuFlag"], dr_3["FriendlyUrl"], dr_3["Link"]);
                        %>
                        <li class="link-item"><a <%= Utils.CreateCategory_Target(dr_3["AttrMenuFlag"]) %> href="<%= link %>"<%= noffollow5 %>><%= dr_3["Name"].ToString() %></a></li><%
                                }
                            }
                        %>
                    </ul>
                </div>
                <%
                        }
                    }
                %>
                <div style="clear: both; margin-top: 20px; padding-top: 10px; width: 100%">
                </div>
                <%
                    int flagStyle2 = (int)PositionMenuFlag.Style2;

                    string filter_style2 = string.Format("(Hide is null OR Hide=0) AND PositionMenuFlag & {0} <> 0", flagStyle2);
                    DataTable dt_4 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,SeoFlags,AttrMenuFlag,LinkTypeMenuFlag,Icon,Link,Image_3", string.Format("ParentID={0} AND {1}", dr_1["ID"], filter_style2), "Sort");
                    if (Utils.CheckExist_DataTable(dt_4))
                    {
                        foreach (DataRow dr_3 in dt_4.Rows)
                        {
                              string noffollow6 = string.Empty;
                                        int SeoFlagINT6 = ConvertUtility.ToInt32(dr_3["SeoFlags"]);
                                        if (SeoFlagINT6 == (int)SeoFlag.Nofollow)
                                            noffollow6 = @" rel=""nofollow""";

                            string icon = C.NO_IMG_PATH;
                            if (!string.IsNullOrEmpty(dr_3["Icon"].ToString()))
                                icon = dr_3["Icon"].ToString() + "?width=80&height=80&quality=100";
                            string link = Utils.CreateCategoryLink(dr_3["LinkTypeMenuFlag"], dr_3["FriendlyUrl"], dr_3["Link"]);
                %>
                <div class="container-link style2">
                    <a <%= Utils.CreateCategory_Target(dr_3["AttrMenuFlag"]) %> href="<%= link %>"<%= noffollow6 %>>
                        <img src="<%= icon %>" alt="<%= dr_3["Name"].ToString() %>" /></a>
                    <div class="container-title">
                        <p class="title">
                            <a href="<%= link %>"><%= dr_3["Name"].ToString() %></a>
                        </p>
                        <hr />
                        <ul class="link-list">
                            <%
                                if (dr_3["ID"].ToString() == "8")
                                {
                                    Response.Write("");
                                }
                                DataTable dt_5 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,SeoFlags,AttrMenuFlag,LinkTypeMenuFlag,Icon,Link,Image_3", string.Format("(Hide is null OR Hide=0) AND ParentID={0}", dr_3["ID"]), "Sort");
                                if (Utils.CheckExist_DataTable(dt_5))
                                {
                                    foreach (DataRow dr_5 in dt_5.Rows)
                                    {
                                          string noffollow7 = string.Empty;
                                        int SeoFlagINT7 = ConvertUtility.ToInt32(dr_5["SeoFlags"]);
                                        if (SeoFlagINT7 == (int)SeoFlag.Nofollow)
                                            noffollow7 = @" rel=""nofollow""";
                                        link = Utils.CreateCategoryLink(dr_5["LinkTypeMenuFlag"], dr_5["FriendlyUrl"], dr_5["Link"]);
                            %><li class="link-item"><a <%= Utils.CreateCategory_Target(dr_5["AttrMenuFlag"]) %> href="<%= link %>"<%= noffollow7 %>><%= dr_5["Name"].ToString() %></a></li><%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </div><%}
                    } %>
            </div>
        </div>
    </li>
    <%
                }
            }
        }
    %>
    <li class="sub-menu-item">
        <a class="category-item" href="<%= C.ROOT_URL %>/sitemap.html">Xem tất cả</a>
    </li>
</ul>
