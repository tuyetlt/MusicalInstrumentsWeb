<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContentDetail.ascx.cs" Inherits="Controls_ContentDetail" %>
<%@ Import Namespace="System.Data" %>

<article class="news-detail">
    <div class="container">
        <div class="left">
            <h1><%= ConvertUtility.ToString(dr["Name"]) %></h1>

            <%   string AddressFunction = ConfigWeb.AdressFunction;
                string ContentHtml = ConvertUtility.ToString(dr["LongDescription"]);
                ContentHtml = ContentHtml.Replace("{Address}", AddressFunction);
                %>
            <%= ContentHtml %>
        </div>
          <div class="right">
            <div class="container-sticky">
                <%=Utils.LoadUserControl("~/Controls/WidgetMenuNews.ascx") %>
                <%=Utils.LoadUserControl("~/Controls/WidgetSupport.ascx") %>
            </div>
        </div>
    </div>
</article>
<div class="clear"></div>
