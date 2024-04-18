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
            <h1><%= catName %></h1>
            <div class="article-list">
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
                                <img src="<%= Utils.GetFirstImageInGallery_Json(drNews["Gallery"].ToString(), 200, 150) %>" alt="<%= drNews["Name"].ToString() %>" /></a>
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
            <%} %>
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
