<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryLoad.ascx.cs" Inherits="ajax_Controls_CategoryLoad" %>
<%@ Import Namespace="System.Data" %>
<% 
    if (action == "product_list")
    {
        if (Utils.CheckExist_DataTable(dtProduct))
        {
            foreach (DataRow drProduct in dtProduct.Rows)
            {
                string linkDetail = TextChanger.GetLinkRewrite_Products(ConvertUtility.ToString(drProduct["FriendlyUrlCategory"]), ConvertUtility.ToString(drProduct["FriendlyUrl"]));

%>
<div class="product-item">
    <a href="<%= linkDetail %>">
        <div class="img">
            <img src="<%= Utils.GetFirstImageInGallery_Json(drProduct["Gallery"].ToString(), 300, 300) %>" alt="<%= drProduct["Name"].ToString() %>" />
        </div>
        <%--<span class="sale">50%</span>--%>
        <div class="cont">
            <h4 class="name"><%= drProduct["Name"].ToString() %></h4>
            <div class="info">
                <ins><%= SqlHelper.GetPrice(drProduct, "Price") %></ins>
                <del><%= SqlHelper.GetPrice(drProduct, "Price1") %></del>
            </div>
        </div>
    </a>
</div>
<%
            }
        }
    }
    else if (action == "article_list")
    {
        if (Utils.CheckExist_DataTable(dtArticle))
        {
            foreach (DataRow drNews in dtArticle.Rows)
            {
                string linkDetail = TextChanger.GetLinkRewrite_Article(drNews["FriendlyUrl"].ToString());
%>

<div class="item">
    <div class="img">
        <a href="<%= linkDetail %>">
            <img src="<%= Utils.GetFirstImageInGallery_Json(drNews["Gallery"].ToString(), 200, 150) %>" alt="<%= drNews["Name"].ToString() %>" /></a>
    </div>
    <h3><a href="<%= linkDetail %>"><%= drNews["Name"].ToString() %></a></h3>
    <p><%= drNews["Description"].ToString() %></p>
</div>

<%}
        }
    } %>