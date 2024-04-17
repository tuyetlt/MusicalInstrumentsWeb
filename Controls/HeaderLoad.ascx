<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeaderLoad.ascx.cs" Inherits="Controls_HeaderLoad" %>
<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/assets/fontawesome-pro-5.11.2-web/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="<%=Utils.CheckVersion_NonTemplate("/themes/css/style.css") %>" />
<link rel="stylesheet" type="text/css" href="<%=Utils.CheckVersion_NonTemplate("/themes/css/main.css") %>" />
<link rel="stylesheet" type="text/css" href="<%=Utils.CheckVersion_NonTemplate("/themes/css/fix.css") %>" />
<% if(!string.IsNullOrEmpty(ConfigWeb.Style)){ %>
<link rel="stylesheet" type="text/css" href="<%=Utils.CheckVersion_NonTemplate("/themes/css/" + ConfigWeb.Style) %>" />
<% } %>
<link rel="stylesheet" href="/assets/css/owl.carousel.min.css" />
<link rel="stylesheet" href="/assets/css/owl.theme.default.css">
<link rel="stylesheet" href="/assets/css/slick.css">
<link rel="stylesheet" href="/assets/slick/slick-theme.css">
<link rel="stylesheet" href="/assets/css/jquery.fancybox.min.css">
<%= ConfigWeb.CodeHeader %>