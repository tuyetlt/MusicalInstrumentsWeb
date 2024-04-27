<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetSupport.ascx.cs" Inherits="Controls_WidgetSupport" %>
<%@ Import Namespace="System.Data" %>


<div class="contact">
    <div class="title">Tư vấn mua hàng</div>
    <ul class="contact-list">
        <%
            string filter = string.Format("ParentID=0 AND Flags & {0} <> 0", (int)BaseTableFlag.Support);
            DataTable dtParent = SqlHelper.SQLToDataTable("tblBase", "", filter, "Sort");

            if (MultiLevel)
            {
                if (Utils.CheckExist_DataTable(dtParent))
                {
                    foreach (DataRow drParent in dtParent.Rows)
                    {
        %>

        <li class="contact-item">
            <div class="title">
                <span class="list-style"></span>
                <%= drParent["Name"] %>
            </div>
         
            <%
                filter = string.Format("ParentID={0} AND Flags & {1} <> 0", drParent["ID"], (int)BaseTableFlag.Support);
                DataTable dtChild = SqlHelper.SQLToDataTable("tblBase", "", filter, "Sort");
                if (Utils.CheckExist_DataTable(dtChild))
                {
                    foreach (DataRow drChild in dtChild.Rows)
                    {
                        string zalo = string.Format("https://zalo.me/{0}", drChild["Phone"].ToString().Replace(" ", "").Replace(".",""));
                        string tel = string.Format("tel:{0}", drChild["Phone"].ToString().Replace(" ", "").Replace(".",""));
            %>
            <p>
                <%= drChild["Name"] %>: <b><a rel="nofollow" href="<%= tel %>"><%= drChild["Phone"] %></a></b>
                
                <a rel="nofollow" class="tel" href="<%= tel %>"></a><a rel="nofollow" class="zalo" href="<%= zalo %>"></a>
            </p>
            <%
                    }
                }
            %>
        </li>
        <%
                    }
                }
            }
            else
            {
                if (Utils.CheckExist_DataTable(dtParent))
                {
                    foreach (DataRow drParent in dtParent.Rows)
                    {
        %>
        <p><%= drParent["Name"] %>: <b><a href="tel:<%= drParent["Phone"] %>"><%= drParent["Phone"] %></a></b></p>
        <%
                    }
                }
            }
        %>
    </ul>
</div>
