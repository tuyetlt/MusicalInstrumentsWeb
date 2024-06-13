<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsCategory.ascx.cs" Inherits="Controls_NewsCategory" %>
<%@ Import Namespace="System.Data" %>

<%
    string catID = "", catName = "";
    if (Utils.CheckExist_DataTable(dtCat))
    {
        catID = drCat["ID"].ToString();
        catName = drCat["Name"].ToString();
    }
%>

<input type="hidden" id="idCategory" value="<%= catID %>" />
<input type="hidden" id="pageIndex" value="1" />
<input type="hidden" id="pageSize" value="<%= C.ROWS_PRODUCTCATEGORY %>" />
<input type="hidden" id="totalArticle" value="<%= _totalArticle %>" />

<article class="news-list">
    <div class="container">
        <div class="left">

            <%if (isChild)
                {  %>
            <h1><%= catName %></h1>
            <div class="clear"></div>
            <div class="article-list" id="content-container">
                <%
                    if (Utils.CheckExist_DataTable(dtNews))
                    {
                        foreach (DataRow drNews in dtNews.Rows)
                        {
                            string linkDetail = TextChanger.GetLinkRewrite_Article(drNews["FriendlyUrl"].ToString());
                            string noffollow = string.Empty;
                            int SeoFlagINT = ConvertUtility.ToInt32(drNews["SeoFlags"]);
                            if (SeoFlagINT == (int)SeoFlag.Nofollow)
                                noffollow = @" rel=""nofollow""";
                %>
                <div class="item">
                    <div class="cnt-item-article">
                        <div class="img">
                            <a href="<%= linkDetail %>" <%= noffollow %>>
                                <img src="<%= Utils.GetFirstImageInGallery_Json(drNews["Gallery"].ToString(), 280, 215, "crop") %>" alt="<%= drNews["Name"].ToString() %>" /></a>
                        </div>
                        <div class="contet-blog">
                            <h3><a href="<%= linkDetail %>"><%= drNews["Name"].ToString() %></a></h3>
                            <div class="desc">
                                <p><%= drNews["Description"].ToString() %></p>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="clear"></div>
            <%--  <% if (_totalArticle > C.ROWS_PRODUCTCATEGORY)
                { %>
            <div class="container-btn show-more"><a id="category_paging_article" class="btn-see-more">Xem thêm <i class="fas fa-sort-down"></i></a></div>
            <%} %>--%>


            <% if (_totalArticle > C.ROWS_PRODUCTCATEGORY)
                { %>
            <div class="paging-out">
                <div class="paging">
                    <button class="first-page" disabled>
                        <i></i>
                    </button>
                    <button class="prev-page" disabled>
                        <i></i>
                    </button>
                    <div id="pagination"></div>
                    <button class="next-page">
                        <i></i>
                    </button>
                    <button class="last-page">
                        <i></i>
                    </button>
                </div>
            </div>
            <input type="hidden" min="1" id="pages" value="<%= _totalPage %>" />
            <input type="hidden" min="1" id="curpage" value="1" />
            <input type="hidden" id="delta" min="1" max="10" value="2" />
            <input type="hidden" id="modul" value="article" />
            <%} %>


            <%--if not child--%>

            <% }
                else
                {
                    if (Utils.CheckExist_DataTable(dtChild))
                    {
                        foreach (DataRow drChild in dtChild.Rows)
                        {
            %>
            <div class="title">
             <a href="<%=TextChanger.GetLinkRewrite_CategoryArticle(drChild["FriendlyUrl"].ToString()) %>"><h2><%=drChild["Name"].ToString() %></h2></a>
            <a href="<%=TextChanger.GetLinkRewrite_CategoryArticle(drChild["FriendlyUrl"].ToString()) %>" class="showall">Xem tất cả <i class="fad fa-external-link"></i></a></div>
            <div class="clear"></div>
            <div class="article-list">
                <%
                    string filterNews = string.Format(@"(CategoryIDList Like N'%,{0},%' OR CategoryaIDParentList Like N'%,{0},%') AND {1} AND StartDate<=getdate() AND {2}", drChild["ID"], Utils.CreateFilterDate, Utils.CreateFilterHide);
                    DataTable dtNewChild = SqlHelper.SQLToDataTable("tblArticle", "Gallery,Name,FriendlyUrl,Description,SeoFlags", filterNews, ConfigWeb.SortArticle, 1, 4);
                    if (Utils.CheckExist_DataTable(dtNewChild))
                    {
                        foreach (DataRow drNews in dtNewChild.Rows)
                        {
                            string linkDetail = TextChanger.GetLinkRewrite_Article(drNews["FriendlyUrl"].ToString());
                            string noffollow = string.Empty;
                            int SeoFlagINT = ConvertUtility.ToInt32(drNews["SeoFlags"]);
                            if (SeoFlagINT == (int)SeoFlag.Nofollow)
                                noffollow = @" rel=""nofollow""";
                %>
                <div class="item">
                    <div class="cnt-item-article">
                        <div class="img">
                            <a href="<%= linkDetail %>" <%= noffollow %>>
                                <img src="<%= Utils.GetFirstImageInGallery_Json(drNews["Gallery"].ToString(), 400, 300, "crop") %>" alt="<%= drNews["Name"].ToString() %>" /></a>
                        </div>
                        <div class="contet-blog">
                            <h3><a href="<%= linkDetail %>"><%= drNews["Name"].ToString() %></a></h3>
                            <div class="desc">
                                <p><%= drNews["Description"].ToString() %></p>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <%}
                    }
                } %>
        </div>
        <div class="right">
            <div class="container-sticky">
                <%=Utils.LoadUserControl("~/Controls/WidgetMenuNews.ascx") %>
                <%=Utils.LoadUserControl("~/Controls/WidgetSupport.ascx") %>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</article>

<script id="product-template" type="text/template">
    <div class="item">
        <div class="cnt-item-article">
            <div class="img">
                <a href="{{Link}}">
                    <img src="{{Image}}" alt="{{Name}}" /></a>
            </div>
            <div class="contet-blog">
                <h3><a href="{{Link}}">{{Name}}</a></h3>
                <div class="desc">
                    <p>{{Description}}</p>
                </div>
            </div>
        </div>
    </div>
</script>




<script type="application/ld+json">
{
"@context" : "http://schema.org",
"@type" : "<%= SEO_Schema.Type %>",
"name" : "<%= Utils.QuoteRemove(SEO_Schema.Title) %>",
"alternateName" : "<%= Utils.QuoteRemove(SEO_Schema.Description) %>",
"url" : "<%= SEO_Schema.Url %>",
"image" : "<%= SEO_Schema.Image %>",
"author": {
"@type": "Person",
    "name": "<%= ConfigWeb.SiteName %>",
  "url": "<%= ConfigWeb.SiteUrl %>"
},
"datePublished" : "<%= SEO_Schema.PublisherDate %>",
"headline" : "<%= Utils.QuoteRemove(SEO_Schema.Title) %>",
"dateModified" : "<%= SEO_Schema.PublisherDate %>",
"mainEntityOfPage": {
  "@type": "WebPage",
  "@id": "<%= SEO_Schema.Url %>"
},
"publisher": {
  "@type": "Organization",
  "name": "<%= SEO_Schema.Publisher_Name %>",
  "logo": {
    "@type": "ImageObject",
    "url": "<%= SEO_Schema.Publisher_Logo %>"
  }
}
}
</script>
