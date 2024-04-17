﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetNews.ascx.cs" Inherits="Controls_WidgetNews" %>
<%@ Import Namespace="System.Data" %>


<div class="section3 section_blog">
    <div class="container">
        <div class="in">
            <div class="title">
                <h2>
                    <span>TIN TỨC</span>
                </h2>
            </div>
            <%
                string filter = string.Format("(Hide is null OR Hide=0) AND Flags & {0} <> 0", (int)ArticleFlag.HomeArticle);
                DataTable dtNews = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "FriendlyUrl, Name, Gallery, Description", filter, "EditedDate DESC", 1, 12);
                if (Utils.CheckExist_DataTable(dtNews))
                {
                    int count = 0;
            %>
            <div class="list_blog">
                <div class="insider">

                    <% for (int i = 0; i < 4 && i < dtNews.Rows.Count; i++)
                        {
                    %>
                    <a href="<%= TextChanger.GetLinkRewrite_Article(dtNews.Rows[i]["FriendlyUrl"].ToString()) %>"><span class="img">
                        <img src="<%= Utils.GetFirstImageInGallery_Json(dtNews.Rows[i]["Gallery"].ToString(), 300, 130, "crop") %>" alt="<%= dtNews.Rows[i]["Name"].ToString() %>" /></span>

                        <div class="caption">
                            <p class="text">
                                <%= dtNews.Rows[i]["Name"].ToString() %>
                            </p>
                        </div>
                    </a>
                    <%  count++;
                        } %>
                </div>
            </div>
            <div class="list_blog_info">
                <div class="insider">


                    <% for (int i = count; i < 12 && i < dtNews.Rows.Count; i++)
                        { %>
                    <article>
                        <div class="cont">
                            <div class="img">
                                <a href="<%= TextChanger.GetLinkRewrite_Article(dtNews.Rows[i]["FriendlyUrl"].ToString()) %>">
                                    <img src="<%= Utils.GetFirstImageInGallery_Json(dtNews.Rows[i]["Gallery"].ToString(), 130, 100, "crop") %>" alt="<%= dtNews.Rows[i]["Name"].ToString() %>" />
                                </a>
                            </div>
                            <div class="info">
                                <h3><a href="<%= TextChanger.GetLinkRewrite_Article(dtNews.Rows[i]["FriendlyUrl"].ToString()) %>"><%= dtNews.Rows[i]["Name"].ToString() %></a></h3>
                            </div>
                        </div>
                    </article>
                    <% 
                            if (Utils.isMobileBrowser)
                                Response.Write("<div class=\"clear\" style=\"height:10px\"></div>");
                        }


                    %>
                </div>
            </div>
            <%
                } %>
        </div>
    </div>
</div>

<%--<div class="section3 section_blog">
    <div class="container">
        <div class="in">
            <div class="title">
                <h2>
                    <span>TIN TỨC</span>
                </h2>
            </div>

            <%
                DataTable dtNews = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "", "", "ID DESC", 1, 8);
                if (Utils.CheckExist_DataTable(dtNews))
                {
                    int count = 0;
            %>

            <div class="list_blog">
                <div class="insider">
                    <% for (int i = 0; i < 4 && i < dtNews.Rows.Count; i++)
                        {
                    %>
                    <a href="#"><span class="img">
                        <img src="<%= Utils.GetFirstImageInGallery_Json(dtNews.Rows[i]["Gallery"].ToString()) %>" alt="<%= dtNews.Rows[i]["Name"].ToString() %>" /></span></a>
                    <% } %>
                </div>
            </div>

            <div class="list_blog_info">
                <div class="insider">
                    <% for (int i = count; i < 8 && i < dtNews.Rows.Count; i++)
                        { %>
                    <article>
                        <div class="cont">
                            <div class="img">
                                <img src="<%= Utils.GetFirstImageInGallery_Json(dtNews.Rows[i]["Gallery"].ToString()) %>" alt="<%= dtNews.Rows[i]["Name"].ToString() %>" />
                            </div>
                            <div class="info">
                                <h3><%= dtNews.Rows[i]["Name"].ToString() %></h3>
                            </div>
                        </div>
                    </article>
                    <% } %>
                </div>
            </div>
            <%
                    count++;
                } %>
        </div>
    </div>
</div>--%>