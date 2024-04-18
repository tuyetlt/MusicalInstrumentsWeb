<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HomeProduct.ascx.cs" Inherits="Controls_HomeProduct" %>
<%@ Import Namespace="System.Data" %>
<div class="container">
    <%
        int mainMenu = (int)PositionMenuFlag.MenuSubMainHome;
        string filterWidget = string.Format("PositionMenuFlag & {0} <> 0", mainMenu);
        DataTable dtWidget_1 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,ParentID,Link,PositionMenuFlag,LinkTypeMenuFlag,Image_2,Icon", string.Format("ParentID=0 AND {0} AND {1}", filterWidget, Utils.CreateFilterHide), "Sort", 1, C.MAX_ITEM_CATEGORY_HOME);
        if (Utils.CheckExist_DataTable(dtWidget_1))
        {
            foreach (DataRow dr_1 in dtWidget_1.Rows)
            {
                DataTable dtWidget_2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,ParentID,Link,PositionMenuFlag,LinkTypeMenuFlag,Image_2,Icon", string.Format("ParentID={0} AND {1} AND {2}", dr_1["ID"], string.Format("PositionMenuFlag & {0} <> 0", (int)PositionMenuFlag.MenuSubMainHome), Utils.CreateFilterHide), "Sort", 1, 5);
    %>
    <div class="home-product" id="sec_<%= dr_1["ID"] %>">
        <div class="title">
            <h2>
                <a href="<%= Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]) %>"><%= dr_1["Name"] %></a></h2>

            <%
                if (Utils.CheckExist_DataTable(dtWidget_2))
                {
                    int c = 0;
                    foreach (DataRow dr_2 in dtWidget_2.Rows)
                    {
                        string split = "";
                        if (c > 0)
                            split = "<span>|</span>";
                        Response.Write(string.Format(@"{0}<a href=""{1}"">{2}</a>", split, Utils.CreateCategoryLink(dr_2["LinkTypeMenuFlag"], dr_2["FriendlyUrl"], dr_2["Link"]), dr_2["Name"], dr_2["Link"]));
                        c++;
                    }

                }
            %>


            <a href="<%= Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]) %>" class="more">Xem tất cả <i class="fal fa-arrow-right"></i></a>
        </div>
        <div class="clear"></div>
        <div class="section">
            <% if (!Utils.isMobileBrowser)
                { %>
            <div class="banner">
                <a href="<%= Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]) %>">
                    <img src="<%= C.ROOT_URL %><%= dr_1["Image_2"] %>" alt="<%= dr_1["Name"] %>" /></a>
            </div>
            <%
                }
                string filterP = string.Format("AttrProductFlag & {0} <> 0", (int)AttrProductFlag.Home);
                DataTable dtProduct = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID,Name,FriendlyUrl,FriendlyUrlCategory,Gallery,Price,Price1", string.Format("(Hide is null OR Hide=0) AND (CategoryIDList Like N'%,{0},%' OR CategoryIDParentList Like N'%,{0},%' OR TagIDList Like N'%,{0},%') AND ({1})", dr_1["ID"], filterP), ConfigWeb.SortProductHome, 1, 16);
                if (Utils.CheckExist_DataTable(dtProduct))
                {
            %>
            <div class="section-product">
                <%
                    for (int i = 0; i < 8 && i < dtProduct.Rows.Count; i++)
                    {
                        DataRow drProduct = dtProduct.Rows[i];
                        string linkDetail = TextChanger.GetLinkRewrite_Products(drProduct["FriendlyUrlCategory"].ToString(), drProduct["FriendlyUrl"].ToString());
                %>
                <div class="item">

                    <%
                        string Price = SqlHelper.GetPrice(ConvertUtility.ToInt32(drProduct["ID"]), "Price");
                        string Price1 = SqlHelper.GetPrice(ConvertUtility.ToInt32(drProduct["ID"]), "Price1");

                    %>

                    <% if (!string.IsNullOrEmpty(SqlHelper.GetPricePercent(ConvertUtility.ToInt32(drProduct["ID"]))))
                        { %>
                    <span class="percent-sale"><%= SqlHelper.GetPricePercent(ConvertUtility.ToInt32(drProduct["ID"])) %></span>
                    <% } %>


                    <%--  <div class="saleoff">
                        20%
                    </div>--%>
                    <a href="<%= linkDetail %>">
                        <img src="<%= Utils.GetFirstImageInGallery_Json(drProduct["Gallery"].ToString(), 200, 200) %>" alt="<%= drProduct["Name"].ToString() %>" />

                        <h3><%= drProduct["Name"].ToString() %></h3>
                        <span class="price"><%= Price %>
                        </span>
                        <span class="old-price"><%= Price1 %>
                        </span>
                    </a>
                </div>

                <% if (i == 3)
                    { %>
                <div class="clear"></div>

                <% }
                    } %>




                <% if (Utils.isMobileBrowser)
                    { %>
                <div class="clear"></div>
                <a class="view-more" href="<%= Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]) %>"><i class="fad fa-angle-double-down"></i>Xem thêm</a>
                <%} %>
            </div>
            <% } %>
            <div class="clear"></div>
        </div>
    </div>
    <%}
        } %>
</div>

<%--<%
    int mainMenu = (int)PositionMenuFlag.Main;
    string filterWidget = string.Format("PositionMenuFlag & {0} <> 0", mainMenu);
    DataTable dtWidget_1 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,ParentID,Link,PositionMenuFlag,LinkTypeMenuFlag,Image_2,Icon", string.Format("ParentID=0 AND {0}", filterWidget), "Sort", 1, C.MAX_ITEM_CATEGORY_HOME);
    if (Utils.CheckExist_DataTable(dtWidget_1))
    {
        foreach (DataRow dr_1 in dtWidget_1.Rows)
        {
            DataTable dtWidget_2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,ParentID,Link,PositionMenuFlag,LinkTypeMenuFlag,Image_2,Icon", string.Format("ParentID={0} AND {1}", dr_1["ID"], string.Format("PositionMenuFlag & {0} <> 0", (int)PositionMenuFlag.MenuSub)), "Sort", 1, 5);
%>
<section class="section3" id="sec_<%= dr_1["ID"] %>">
    <div class="container">
        <div class="in">
            <div class="title">
                <h2>
                    <span><a href="<%= Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]) %>"><%= dr_1["Name"] %></a></span>

                    <%
                        if (Utils.CheckExist_DataTable(dtWidget_2))
                        {
                            foreach (DataRow dr_2 in dtWidget_2.Rows)
                            {
                                Response.Write(string.Format(@"<a href=""{0}"">{1}</a>",  Utils.CreateCategoryLink(dr_2["LinkTypeMenuFlag"], dr_2["FriendlyUrl"], dr_2["Link"]), dr_2["Name"], dr_2["Link"]));
                            }
                        }
                    %>
                </h2>


                <a href="<%= Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]) %>" class="all">Xem tất cả <i class="fal fa-arrow-right"></i></a>
            </div>

            <div class="slide_product_multi">
                <div class="banner">
                    <a href="<%= Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]) %>">
                        <span class="img" style="background: url('<%= C.ROOT_URL %><%= dr_1["Image_2"] %>') no-repeat;"></span>
                    </a>
                </div>
                <div class="owl-carousel owl-theme owl_multi_product">

                    <% 
                        string filterP = string.Format("AttrProductFlag & {0} <> 0", (int)AttrProductFlag.Home);
                        DataTable dtProduct = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID,Name,FriendlyUrl,FriendlyUrlCategory,Gallery,Price,Price1", string.Format("(Hide is null OR Hide=0) AND (CategoryIDParentList Like N'%,{0},%' OR TagIDList Like N'%,{0},%') AND ({1})", dr_1["ID"], filterP), ConfigWeb.SortProductHome, 1, 16);
                        if (Utils.CheckExist_DataTable(dtProduct))
                        {
                            int count = 0;
                    %>
                    <div class="item">
                        <div class="flex-container">
                            <%
                                for (int i = 0; i < 8 && i < dtProduct.Rows.Count; i++)
                                {
                                    DataRow drProduct = dtProduct.Rows[i];
                                    string linkDetail = TextChanger.GetLinkRewrite_Products(drProduct["FriendlyUrlCategory"].ToString(), drProduct["FriendlyUrl"].ToString());
                            %>
                            <div>
                                <a href="<%= linkDetail %>">
                                    <div class="img">
                                        <img src="<%= Utils.GetFirstImageInGallery_Json(drProduct["Gallery"].ToString(), 200, 200) %>" alt="<%= drProduct["Name"].ToString() %>" />
                                    </div>

                                    <div class="cont">
                                        <h4><%= drProduct["Name"].ToString() %></h4>
                                        <p><%= SqlHelper.GetPrice(ConvertUtility.ToInt32(drProduct["ID"]), "Price") %></p>
                                    </div>
                                </a>
                            </div>
                            <%
                                    count++;
                                }%>
                        </div>
                        <div class="flex-container">
                            <%
                                for (int i = count; i < 16 && i < dtProduct.Rows.Count; i++)
                                {
                                    DataRow drProduct = dtProduct.Rows[i];
                                    string linkDetail = TextChanger.GetLinkRewrite_Products(drProduct["FriendlyUrlCategory"].ToString(), drProduct["FriendlyUrl"].ToString());
                            %>
                            <div>
                                <a href="<%= linkDetail %>">
                                    <div class="img">
                                        <img src="<%= Utils.GetFirstImageInGallery_Json(drProduct["Gallery"].ToString(), 200, 200) %>" alt="<%= drProduct["Name"].ToString() %>" />
                                    </div>

                                    <div class="cont">
                                        <h4><%= drProduct["Name"].ToString() %></h4>
                                        <p><%= SqlHelper.GetPrice(ConvertUtility.ToInt32(drProduct["ID"]), "Price") %></p>
                                    </div>
                                </a>
                            </div>
                            <%
                                    count++;
                                }%>
                        </div>
                    </div>
                    <div class="item">
                        <div class="flex-container">
                            <%
                                for (int i = count; i < 16 && i < dtProduct.Rows.Count; i++)
                                {
                                    DataRow drProduct = dtProduct.Rows[i];
                                    string linkDetail = TextChanger.GetLinkRewrite_Products(drProduct["FriendlyUrlCategory"].ToString(), drProduct["FriendlyUrl"].ToString());
                            %>
                            <div>
                                <a href="<%= linkDetail %>">
                                    <div class="img">
                                        <img src="<%= Utils.GetFirstImageInGallery_Json(drProduct["Gallery"].ToString(), 200, 200) %>" alt="<%= drProduct["Name"].ToString() %>" />
                                    </div>

                                    <div class="cont">
                                        <h4><%= drProduct["Name"].ToString() %></h4>
                                        <p><%= SqlHelper.GetPrice(ConvertUtility.ToInt32(drProduct["ID"]), "Price") %></p>
                                    </div>
                                </a>
                            </div>
                            <%
                                    count++;
                                }%>
                        </div>
                        <div class="flex-container">
                            <%
                                for (int i = count; i < 32 && i < dtProduct.Rows.Count; i++)
                                {
                                    DataRow drProduct = dtProduct.Rows[i];
                                    string linkDetail = TextChanger.GetLinkRewrite_Products(drProduct["FriendlyUrlCategory"].ToString(), drProduct["FriendlyUrl"].ToString());
                            %>
                            <div>
                                <a href="<%= linkDetail %>">
                                    <div class="img">
                                        <img src="<%= Utils.GetFirstImageInGallery_Json(drProduct["Gallery"].ToString(), 200, 200) %>" alt="<%= drProduct["Name"].ToString() %>" />
                                    </div>

                                    <div class="cont">
                                        <h4><%= drProduct["Name"].ToString() %></h4>
                                        <p><%= SqlHelper.GetPrice(ConvertUtility.ToInt32(drProduct["ID"]), "Price") %></p>
                                    </div>
                                </a>
                            </div>
                            <%
                                    count++;
                                }%>
                        </div>
                    </div>

                    <%
                        }
                    %>
                </div>
            </div>
            <% 
                string filterP1 = string.Format("AttrProductFlag & {0} <> 0", (int)AttrProductFlag.Home1);
                DataTable dtHot = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "", string.Format("(Hide is null OR Hide=0) AND (CategoryIDParentList Like N'%,{0},%' OR TagIDList Like N'%,{0},%') AND ({1})", dr_1["ID"], filterP1), ConfigWeb.SortProductHome, 1, 10);
                if (Utils.CheckExist_DataTable(dtHot))
                {
            %>
            <div class="product_hot">
                <h3><%= dr_1["Name"] %> nổi bật</h3>
                <div class="list_">
                    <div class="owl-carousel owl-theme owl_product_hot">
                        <% foreach (DataRow drHot in dtHot.Rows)
                            {
                                string linkDetail = TextChanger.GetLinkRewrite_Products(drHot["FriendlyUrlCategory"].ToString(), drHot["FriendlyUrl"].ToString());
                        %>
                        <div class="item">
                            <a href="<%= linkDetail %>">
                                <div class="img">
                                    <img src="<%= Utils.GetFirstImageInGallery_Json(drHot["Gallery"].ToString(), 200, 200) %>" alt="<%= drHot["Name"].ToString() %>" />
                                </div>

                                <div class="cont">
                                    <h4><%= drHot["Name"].ToString() %></h4>
                                    <div class="info">
                                        <ins><%= SqlHelper.GetPrice(ConvertUtility.ToInt32(drHot["ID"]), "Price") %></ins>
                                        <del><%= SqlHelper.GetPrice(ConvertUtility.ToInt32(drHot["ID"]), "Price1") %></del>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>
<%}
    } %>

--%>


<ul class="floor-menu-fixed">
    <li><i class="far fa-chevron-up"></i></li>
    <%
        if (!Utils.isMobileBrowser)
        {

            string filter = string.Format("PositionMenuFlag & {0} <> 0", mainMenu);

            DataTable dt_1 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,Icon", string.Format("ParentID=0 AND {0}", filter), "Sort", 1, C.MAX_ITEM_CATEGORY_HOME);
            if (Utils.CheckExist_DataTable(dt_1))
            {
                foreach (DataRow dr_1 in dt_1.Rows)
                {
    %>
    <li>
        <a href="#sec_<%= dr_1["ID"] %>" class="click_icon sec<%= dr_1["ID"] %>" data-id="sec<%= dr_1["ID"] %>">
            <div class="img">
                <img src="<%= C.ROOT_URL %><%= dr_1["Icon"] %>" alt="<%= dr_1["Name"] %>" />
            </div>
        </a>
    </li>
    <% }
            }
        } %>
    <li><i class="far fa-chevron-down"></i></li>
</ul>
