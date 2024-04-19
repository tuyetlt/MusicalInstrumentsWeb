<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetSlider.ascx.cs" Inherits="Controls_WidgetSlider" %>
<%@ Import Namespace="System.Data" %>

<section class="section1" id="sec1">
    <div class="container">
        <div class="in">
            <div class="item">
                <li class="nav-item category">
                    <%=Utils.LoadUserControl("~/Controls/WidgetMenu.ascx") %>
                </li>
            </div>
            <div class="item">
                <div class="content_slider">
                    <div class="content_">
                        <div class="slide">
                            <div class="owl-carousel owl-theme" id="owl_home_slide">
                                <%--<%
                                    try
                                    {
                                        string domainBanner = System.Configuration.ConfigurationManager.AppSettings["DOMAIN_BANNER_MANAGER"];
                                        string domainBannerDisplay = System.Configuration.ConfigurationManager.AppSettings["DOMAIN_BANNER_DISPLAY"];
                                        string filter = string.Format("Website like N'%,{0},%'", domainBannerDisplay);
                                        filter += " AND (StartDate is null OR StartDate<= GETDATE()) AND (EndDate is null OR EndDate>= GETDATE())";
                                        filter += string.Format(" AND (Flags & {0} <> 0)", (int)BannerFlag.HomeSlider);
                                        filter += string.Format(" AND (Hide is null OR Hide=0)");
                                        System.Data.DataTable dtSlide0 = SqlHelper.SQLToDataTableBanner("tblBanner", "Image_1,Image_2,Flags,Link,Alt", filter, "Sort", 1, 100);
                                        if (dtSlide0 != null && dtSlide0.Rows.Count > 0)
                                        {
                                            int count = 0;
                                            foreach (System.Data.DataRow dr in dtSlide0.Rows)
                                            {
                                                Response.Write("<div class='item'>");
                                                string link = dr["Link"].ToString();
                                                string newTab = string.Empty;
                                                if (((BannerFlag)(Ebis.Utilities.ConvertUtility.ToInt32(dr["Flags"]))).HasFlag(BannerFlag.OpenNewWindows))
                                                    newTab = @" target=""_blank""";
                                                string image_1 = domainBanner + dr["Image_1"].ToString();
                                                string image_2 = domainBanner + dr["Image_2"].ToString();
                                                if (string.IsNullOrEmpty(image_2))
                                                    image_2 = image_1;
                                                string alt = dr["Alt"].ToString();
                                                string cssClass = "";

                                                string img = string.Format(@"<a{0} href=""{1}""{2}><img src=""{3}"" alt=""{4}"" /></a>", cssClass, link, newTab, image_1, alt);
                                                string img_mobile = string.Format(@"<a{0} href=""{1}""{2}><img src=""{3}"" alt=""{4}"" /></a>", cssClass, link, newTab, image_2, alt);
                                                if (!Utils.isMobileBrowser)
                                                    Response.Write(img);
                                                else
                                                    Response.Write(img_mobile);
                                                count++;
                                                Response.Write("</div>");
                                            }
                                        }
                                    }
                                    catch
                                    {

                                    }
                                %>--%>
                                
                                <%
                                    string filter0 = string.Format("Flags & {0} <> 0", (int)BannerPositionFlag.HomeSlider);

                                    DataTable dt = SqlHelper.SQLToDataTable(C.BANNER_TABLE, "", filter0, "Sort", 1, 10);
                                    if (Utils.CheckExist_DataTable(dt))
                                    {
                                        foreach (DataRow dr in dt.Rows)
                                        {
                                            string link = ConvertUtility.ToString(dr["Link"]);
                                %>

                                <div class="item">
                                    <a href="<%= link %>">
                                        <img src="<%= dr["Image_1"] %>" alt="<%= dr["Alt"] %>" />
                                    </a>
                                </div>
                                <% }
                                    } %>
                            </div>
                        </div>

                        <%-- %><%
                            if (C.DOMAIN_BANNER_DISPLAY != "mayvesinh.vn" && C.DOMAIN_BANNER_DISPLAY != "mayhutbui.vn")
                            {
                            %>

                        <div class="banner">
                           <%-- <%
                                try
                                {

                                    string domainBanner = System.Configuration.ConfigurationManager.AppSettings["DOMAIN_BANNER_MANAGER"];
                                    string domainBannerDisplay = System.Configuration.ConfigurationManager.AppSettings["DOMAIN_BANNER_DISPLAY"];
                                    string filter = string.Format("Website like N'%,{0},%'", domainBannerDisplay);
                                    filter += " AND (StartDate is null OR StartDate<= GETDATE()) AND (EndDate is null OR EndDate>= GETDATE())";
                                    filter += string.Format(" AND (Flags & {0} <> 0)", (int)BannerFlag.RightSlider);
                                    filter += string.Format(" AND (Hide is null OR Hide=0)");
                                    System.Data.DataTable dtSlide1 = SqlHelper.SQLToDataTableBanner("tblBanner", "Image_1,Image_2,Flags,Link,Alt", filter, "Sort", 1, 100);
                                    if (dtSlide1 != null && dtSlide1.Rows.Count > 0)
                                    {
                                        int count = 0;
                                        foreach (System.Data.DataRow dr in dtSlide1.Rows)
                                        {
                                            string link = dr["Link"].ToString();
                                            string newTab = string.Empty;
                                            if (((BannerFlag)(Ebis.Utilities.ConvertUtility.ToInt32(dr["Flags"]))).HasFlag(BannerFlag.OpenNewWindows))
                                                newTab = @" target=""_blank""";
                                            string image_1 = domainBanner + dr["Image_1"].ToString();
                                            string image_2 = domainBanner + dr["Image_2"].ToString();
                                            if (string.IsNullOrEmpty(image_2))
                                                image_2 = image_1;
                                            string alt = dr["Alt"].ToString();
                                            string cssClass = "";

                                            string img = string.Format(@"<a{0} href=""{1}""{2}><img src=""{3}"" alt=""{4}"" /></a>", cssClass, link, newTab, image_1, alt);
                                            string img_mobile = string.Format(@"<a{0} href=""{1}""{2}><img src=""{3}"" alt=""{4}"" /></a>", cssClass, link, newTab, image_2, alt);
                                            if (!Utils.isMobileBrowser)
                                                Response.Write(img);
                                            else
                                                Response.Write(img_mobile);
                                            count++;
                                        }
                                    }
                                }
                                catch
                                {

                                }
                            %>--%>

                             <%-- %> <%
                                  string filter1 = string.Format("Flags & {0} <> 0", (int)BannerPositionFlag.RightSlider);

                                  DataTable dt1 = SqlHelper.SQLToDataTable(C.BANNER_TABLE, "", filter1, "Sort", 1, 10);
                                  if (Utils.CheckExist_DataTable(dt1))
                                  {
                                      foreach (DataRow dr in dt1.Rows)
                                      {
                                          string link = ConvertUtility.ToString(dr["Link"]);
                            %>
                            <div class="">
                            <a href="<%= link %>">
                                <img src="<%= dr["Image_1"] %>" alt="<%= dr["Alt"] %>" />
                            </a>
                            </div>
                            <% }
                                } %>
                        </div>

                        <% } %>--%>
                        <div class="banner">
                            <div class="item-images">
                            <img src="/themes/image/banner/baohanh.jpg" alt="Alternate Text" />
                            </div>
                            <div class="item-images">
                                <img src="/themes/image/banner/daily.jpg" alt="Alternate Text" />
                            </div>
                            <div class="item-images">
                                <img src="/themes/image/banner/laisuat.jpg" alt="Alternate Text" />
                            </div>
                            <div class="item-images">
                                 <img src="/themes/image/banner/vanchuyen.jpg" alt="Alternate Text" />
                             </div>
                        </div>
                   <%-- <div class="in">
                        <div class="list_blog_slider">
                            <div class="insider">
                                <%
                                    string filterNews = string.Format("(Flags & {0} <> 0) AND {1} AND StartDate<=getdate()", (int)ArticleFlag.HomeArticle, Utils.CreateFilterHide);
                                    DataTable dtNews = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "Name,FriendlyUrl,Gallery", filterNews, "EditedDate DESC", 1, 6);
                                    if (Utils.CheckExist_DataTable(dtNews))
                                    {
                                        foreach (DataRow dr in dtNews.Rows)
                                        {
                                %>
                                <article>
                                    <div class="cont">
                                        <div class="img">
                                            <a href="<%= TextChanger.GetLinkRewrite_Article(dr["FriendlyUrl"].ToString()) %>">
                                                <img src="<%= Utils.GetFirstImageInGallery_Json(dr["Gallery"].ToString(), 200, 100) %>" alt="<%= dr["Name"].ToString() %>" />
                                            </a>
                                        </div>
                                        <div class="info">
                                            <h4>
                                                <a href="<%= TextChanger.GetLinkRewrite_Article(dr["FriendlyUrl"].ToString()) %>"><%= dr["Name"].ToString() %></a>
                                            </h4>
                                        </div>
                                    </div>
                                </article>
                                <% }
                                    } %>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</section>