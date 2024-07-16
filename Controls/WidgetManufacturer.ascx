<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetManufacturer.ascx.cs" Inherits="Controls_WidgetManufacturer" %>
<%@ Import Namespace="System.Data" %>
<%
    DataTable dt = SqlHelper.SQLToDataTable("tblHome_Manufacturer", "Image_1,Name,Alt,Link", Utils.CreateFilterHide, "Sort");
    if (Utils.CheckExist_DataTable(dt))
    {
%>
<div class="section-up section_partner">
    <div class="container">
        <div class="in-partner">
            <div class="title">
                <h2>
                    <span>Nhà xưởng, kho hàng, vận chuyển hàng</span>
                </h2>
            </div>
            <div class="list-partner">
                <ul class="list-images-slide">
                    <% 
                        foreach (DataRow dr in dt.Rows)
                        {
                            string link_open = string.Empty;
                            string link_close = string.Empty;
                            if (string.IsNullOrEmpty(dr["Link"].ToString()))
                            {
                                link_open = string.Format(@"<a href=""{0}"" rel=""nofollow"" target=""_blank"">", dr["Link"].ToString());
                                link_close = string.Format("</a>");
                            }
                    %>
                    <li>
                        <%= link_open %>
                        <img src="<%=dr["Image_1"].ToString() %>" alt="<%=dr["Alt"].ToString() %>" />
                        <%= link_close %>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
</div>
<%
    }
%>