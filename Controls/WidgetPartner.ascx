<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetPartner.ascx.cs" Inherits="Controls_WidgetPartner" %>
<%@ Import Namespace="System.Data" %>
<% DataTable dt = SqlHelper.SQLToDataTable("tblHome_Partner", "Image_1,Name,Alt,Link", Utils.CreateFilterHide, "Sort");
    if (Utils.CheckExist_DataTable(dt))
    { %>
<div class="section-up section_partner">
    <div class="container">
        <div class="in-partner">
            <div class="title">
                <h2>
                    <span>ĐỐI TÁC & QUÝ KHÁCH HÀNG</span>
                </h2>
            </div>
            <div class="list-partner">
                <ul class="list-partner-slide">
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

<%--<div class="section2">
    <div class="container">
        <div class="in">
            <div class="title">
                <h2>ĐỐI TÁC & QUÝ KHÁCH HÀNG</h2>
            </div>
            <div class="slide_product">
                <div class="insider">
                    <div class="owl-carousel owl-theme" id="owl_slide_partners">
                        <% 
                            DataTable dt = SqlHelper.SQLToDataTable("tblHome_Partner", "Image_1, Alt,Link", Utils.CreateFilterHide, "Sort");
                            if (Utils.CheckExist_DataTable(dt))
                            {
                                foreach (DataRow dr in dt.Rows)
                                {
                                    string link_open = string.Empty;
                                    string link_close = string.Empty;
                                    if (string.IsNullOrEmpty(dr["Link"].ToString()))
                                    {
                                        link_open = string.Format(@"<a href=""{0}""", dr["Link"].ToString());
                                        link_close = string.Format("</a>");
                                    }
                        %>
                        <div class="item">
                            <%= link_open %>
                            <img src="<%=dr["Image_1"].ToString() %>" alt="<%=dr["Alt"].ToString() %>" />
                            <%= link_close %>
                            <h3><%=dr["Name"].ToString() %></h3>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--%>