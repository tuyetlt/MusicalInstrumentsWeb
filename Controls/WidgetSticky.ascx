<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetSticky.ascx.cs" Inherits="Controls_WidgetSticky" %>
<%@ Import Namespace="System.Data" %>
<%--<div class="menu-header">
    <div class="menu">
        <ul class="nav-list">
            <li class="nav-item category">
                <a class="nav-link" href="#"><i class="fas fa-bars"></i>Danh mục sản phẩm</a>
                <div class="over-lay"></div>
                <ul class="sub-menu">
                    <%
                        if (!Utils.isMobileBrowser)
                        {
                            int mainMenu = (int)PositionMenuFlag.Main;

                            string filter = string.Format("PositionMenuFlag & {0} <> 0", mainMenu);
                            DataTable dt_1 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID=0 AND {0}", filter), "Sort");
                            if (Utils.CheckExist_DataTable(dt_1))
                            {
                                foreach (DataRow dr_1 in dt_1.Rows)
                                {
                                    string link_1 = TextChanger.GetLinkRewrite_Category(dr_1["FriendlyUrl"].ToString());
                    %>

                    <li class="sub-menu-item">

                        <a class="category-item" href="<%= link_1 %>">
                            <span style="background-image: url('<%= dr_1["Icon"].ToString() %>')"></span>
                            <%= dr_1["Name"].ToString() %></a>

                        <%
                            int subMenu = (int)PositionMenuFlag.MenuSubMainHome;

                            string filter2 = string.Format("PositionMenuFlag & {0} <> 0", subMenu);
                            DataTable dt_sub = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID={0} AND {1}", dr_1["ID"], filter2), "Sort");
                            if (Utils.CheckExist_DataTable(dt_sub))
                            {
                                Response.Write(@"<div class=""option"">");
                                int count = 0;
                                foreach (DataRow dr_sub in dt_sub.Rows)
                                {
                                    string comma = "";
                                    if (count > 0)
                                        comma = ", ";

                                    Response.Write(string.Format(@"{0}<a class=""option-link"" href=""{1}"">{2}</a>", comma, "#", dr_sub["Name"].ToString()));
                                    count++;
                                }
                                Response.Write("</div>");
                            }

                            int subMenu2 = (int)PositionMenuFlag.MenuSubMainHome2;

                            string filter3 = string.Format("PositionMenuFlag & {0} <> 0", subMenu2);
                            DataTable dt_sub2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID={0} AND {1}", dr_1["ID"], filter3), "Sort");
                            if (Utils.CheckExist_DataTable(dt_sub2))
                            {
                                Response.Write(@"<div class=""option"">");
                                int count = 0;
                                foreach (DataRow dr_sub2 in dt_sub2.Rows)
                                {
                                    string comma = "";
                                    if (count > 0)
                                        comma = ", ";
                                    Response.Write(string.Format(@"{0}<a class=""option-link"" href=""{1}"">{2}</a>", comma, "#", dr_sub2["Name"].ToString()));
                                    count++;
                                }
                                Response.Write("</div>");
                            }
                        %>
                        <div class="category-content">
                            <div class="content">
                                <%
                                    DataTable dt_2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID={0} AND {1}", dr_1["ID"], filter), "Sort", 1, 4);
                                    if (Utils.CheckExist_DataTable(dt_2))
                                    {
                                        foreach (DataRow dr_2 in dt_2.Rows)
                                        {
                                %>
                                <div class="container-link">
                                    <img src="/themes/img/logo-category.png" />
                                    <h4 class="title"><a href="#"><%= dr_2["Name"].ToString() %></a></h4>
                                    <hr />
                                    <ul class="link-list">

                                        <%
                                            DataTable dt_3 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID={0}", dr_2["ID"]), "Sort", 1, 3);
                                            if (Utils.CheckExist_DataTable(dt_2))
                                            {
                                                foreach (DataRow dr_3 in dt_3.Rows)
                                                {
                                        %>
                                        <li class="link-item"><a href="#"><%= dr_3["Name"].ToString() %></a></li>
                                        <%
                                                }
                                            }
                                        %>
                                    </ul>
                                </div>
                                <%
                                        }
                                    }
                                %>

                                <div style="clear:both; border-top:1px solid #dbdbdb; margin-top:10px; padding-top:10px"></div>
                               
                                 <%
                                    dt_2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID={0} AND {1}", dr_1["ID"], filter), "Sort", 1, 4);
                                    if (Utils.CheckExist_DataTable(dt_2))
                                    {
                                        foreach (DataRow dr_2 in dt_2.Rows)
                                        {
                                %>
                                <div class="container-link style2">
                                    <img src="https://www.dangquangwatch.vn/view/pic/m_hopdung.jpg" />
                                    <h4 class="title"><a href="#"><%= dr_2["Name"].ToString() %></a></h4>
                                    <hr />
                                    <ul class="link-list">

                                        <%
                                            DataTable dt_3 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID={0}", dr_2["ID"]), "Sort", 1, 3);
                                            if (Utils.CheckExist_DataTable(dt_2))
                                            {
                                                foreach (DataRow dr_3 in dt_3.Rows)
                                                {
                                        %>
                                        <li class="link-item"><a href="#"><%= dr_3["Name"].ToString() %></a></li>
                                        <%
                                                }
                                            }
                                        %>
                                    </ul>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </li>
                    <%
                                }
                            }
                        }
                    %>
                    <li class="sub-menu-item">
                        <a class="category-item" href="#">Xem tất cả</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Xem tất cả</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Tin tức</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="#">Hỏi đáp</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
            <li class="nav-item">
                <a class="nav-link" href="#">Săn giảm giá</a>
            </li>
        </ul>
    </div>
</div>--%>
