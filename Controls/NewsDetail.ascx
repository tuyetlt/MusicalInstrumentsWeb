<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsDetail.ascx.cs" Inherits="Controls_NewsDetail" %>
<%@ Import Namespace="System.Data" %>

<article class="news-detail">
    <div class="container">
        <div class="left">
            <div class="date">
                <i class="fad fa-clock"></i><%=String.Format("{0:dd/MM/yyyy HH:mm}",dr["CreatedDate"]) %>
            </div>
            <div class="clear"></div>
            <h1><%= ConvertUtility.ToString(dr["Name"]) %></h1>
            <p class="description">
                <%= ConvertUtility.ToString(dr["Description"]) %>
            </p>
            <%
                if (!Utils.IsNullOrEmpty(dr["NewsRelatedIDList"].ToString().Trim()))
                {
                    string filter = string.Format("ID in ({0}) AND {1}", dr["NewsRelatedIDList"].ToString(), Utils.CreateFilterHide);
                    DataTable dtNews = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "ID,FriendlyUrl, Name, Gallery, Description", filter, "EditedDate DESC");
                    if (Utils.CheckExist_DataTable(dtNews))
                    {
                        int count = 0;
            %>
            <div class="clear"></div>
            <ul class="news-related">
                <% for (int i = 0; i < dtNews.Rows.Count; i++)
                    {
                %>
                <li>
                    <a href="<%= TextChanger.GetLinkRewrite_Article(dtNews.Rows[i]["FriendlyUrl"].ToString()) %>"><%= dtNews.Rows[i]["Name"].ToString() %></a>
                </li>
                <%  count++;
                    }
                %>
            </ul>
            <div class="clear"></div>
            <%
                    }
                }
                string AddressFunction = ConfigWeb.AdressFunction;
                string ContentHtml = ConvertUtility.ToString(dr["LongDescription"]);
                ContentHtml = ContentHtml.Replace("{Address}", AddressFunction);
            %>
            <%= ContentHtml %>


            <%-- <%= Utils.LoadUserControl("~/Controls/WidgetComment.ascx") %>--%>
        </div>
        <div class="right">
            <div class="container-sticky">
                <%=Utils.LoadUserControl("~/Controls/WidgetMenuNews.ascx") %>






<%--                <%
                    string TagsList = dr["TagIDList"].ToString().Trim(',');
                    if (!Utils.IsNullOrEmpty(TagsList))
                    {
                        DataTable dtTag = SqlHelper.SQLToDataTable("tblCategories", "Name,FriendlyUrl", string.Format("ID IN ({0})", TagsList));
                        if (dtTag != null && dtTag.Rows.Count > 0)
                        {
                %>
                <div class="clear"></div>
                <div class="entry-tags">
                    <ul>

                        <%
                            foreach (DataRow drTag in dtTag.Rows)
                            {
                                string link = TextChanger.GetLinkRewrite_Category(drTag["FriendlyUrl"].ToString());
                                string tagName = drTag["Name"].ToString();
                        %>
                        <li class="entry-tag-item"><a href="<%= link %>" title="<%= tagName %>"><%= tagName %></a></li>
                        <%
                            }
                        %>
                    </ul>
                </div>
                <div class="clear"></div>
                <%
                        }
                    }
                %>--%>



                <%
                    string HashTagsList = dr["HashTagIDList"].ToString().Trim(',');
                    if (!Utils.IsNullOrEmpty(HashTagsList))
                    {
                        DataTable dtHashTag = SqlHelper.SQLToDataTable("tblCategories", "ID,Name,FriendlyUrl", string.Format("ID IN ({0})", HashTagsList));
                        if (dtHashTag != null && dtHashTag.Rows.Count > 0)
                        {
                            List<string> IDListTag = new List<string>();
                            foreach (DataRow drHashTag in dtHashTag.Rows)
                            {
                                IDListTag.Add(drHashTag["ID"].ToString());
                            }

                            int countCheck = 1;

                            //if (IDListTag != null && IDListTag.Count > 0)
                            //{

                            //    foreach (string TagCheck in IDListTag)
                            //    {
                            //        countCheck = SqlHelper.GetCount(C.ARTICLE_TABLE, string.Format("HashTagIDList like N'%,{0},%' AND ID<>{1}", TagCheck, dr["ID"]));
                            //        if (countCheck > 0)
                            //            continue;
                            //    }
                            //}


                            if (countCheck > 0)
                            {
                                foreach (DataRow drHashTag in dtHashTag.Rows)
                                {
                                    DataTable dtArticle = SqlHelper.SQLToDataTable("tblArticle", "Name, FriendlyUrl", string.Format("HashTagIDList like N'%,{0},%' AND ID<>{1}", drHashTag["ID"], dr["ID"]), "ID DESC", 1, 10);
                                    string linkTag = TextChanger.GetLinkRewrite_Category(drHashTag["FriendlyUrl"].ToString());
                %>
                <div class="clear"></div>
                <div class="widget fix-widget3">
                    <div class="widget-title3">
                       
                            <img class="ictags" src="/themes/img/ic-03.svg">
                            <%= drHashTag["Name"].ToString() %>
                    </div>
                    <div class="widget-container">
                        <ul>
                            <%
                                if (Utils.CheckExist_DataTable(dtArticle) && Utils.CheckExist_DataTable(dtArticle))
                                {
                                    int count = 0;
                                    foreach (System.Data.DataRow drArticleTag in dtArticle.Rows)
                                    {
                                        count++;
                                        string linkDetail = TextChanger.GetLinkRewrite_Article(drArticleTag["FriendlyUrl"] + "");
                                        string titleArtice = drArticleTag["Name"] + "";
                            %>
                            <li class="widget-news3">
                                <span class="count123"><%= count %></span>
                                <div class="description">
                                    <span class="post-title-widget">
                                        <a href="<%=linkDetail %>" title="<%=titleArtice %>"><%=titleArtice %></a>
                                    </span>
                                </div>
                            </li>
                            <%}
                                }%>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
                <%

                                }
                            }
                        }
                    }

                %>
                <%=Utils.LoadUserControl("~/Controls/WidgetSupport.ascx") %>
            </div>
        </div>
    </div>
</article>
<div class="clear"></div>



<script type="application/ld+json">
{
"@context" : "http://schema.org",
"@type" : "<%= SEO_Schema.Type %>",
"name" : "<%= Utils.QuoteRemove(SEO_Schema.Title) %>",
"alternateName" : "",
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
  "name": "<%= ConfigWeb.SiteName %>",
  "logo": {
    "@type": "ImageObject",
    "url": "<%= ConfigWeb.LogoAdmin %>"
  }
}
}
</script>

<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "Book",
"aggregateRating": {
    "@type": "AggregateRating",
        "bestRating": "100",
        "ratingValue": "<%= SEO_Schema.RatingValue %>",
        "ratingCount": "<%= SEO_Schema.RatingCount %>"
  },
  "publisher": {
    "@type": "Organization",
    "name": "<%= ConfigWeb.SiteName %>"
  },
"name": "<%= Utils.QuoteRemove(SEO_Schema.Title) %>"
}
</script>