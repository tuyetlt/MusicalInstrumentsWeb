<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetServices.ascx.cs" Inherits="Controls_WidgetServices" %>
<%@ Import Namespace="System.Data" %>
<% 
    string filter = string.Format("(Hide is null OR Hide=0) AND Flags & {0} <> 0", (int)BaseTableFlag.Service);
    DataTable dt = SqlHelper.SQLToDataTable("tblBase", "ID, Name, Alt, Icon", filter);
    if (Utils.CheckExist_DataTable(dt))
    {
%>
<div class="section4">
    <div class="container">
        <div class="in">
            <div class="box_info">
                <% 
                    foreach (DataRow dr in dt.Rows)
                    {
                %>
                <div class="item">
                    <div class="insider">
                        <div class="img">
                            <i class="fad fa-shipping-fast"></i>
                        </div>
                        <div class="info">
                            <h3><%= dr["Name"].ToString() %></h3>
                            <p><%= dr["Alt"].ToString() %></p>
                        </div>
                    </div>
                </div>
                <%
                    } %>
            </div>
        </div>
    </div>
</div>
<% } %>
